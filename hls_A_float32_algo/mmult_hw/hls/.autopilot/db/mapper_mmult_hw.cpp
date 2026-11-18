#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_directio.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" void mmult_hw(Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*);
extern "C" void apatb_mmult_hw_hw(volatile void * __xlx_apatb_param_a_0, volatile void * __xlx_apatb_param_a_1, volatile void * __xlx_apatb_param_a_2, volatile void * __xlx_apatb_param_a_3, volatile void * __xlx_apatb_param_a_4, volatile void * __xlx_apatb_param_a_5, volatile void * __xlx_apatb_param_a_6, volatile void * __xlx_apatb_param_a_7, volatile void * __xlx_apatb_param_a_8, volatile void * __xlx_apatb_param_a_9, volatile void * __xlx_apatb_param_a_10, volatile void * __xlx_apatb_param_a_11, volatile void * __xlx_apatb_param_a_12, volatile void * __xlx_apatb_param_a_13, volatile void * __xlx_apatb_param_a_14, volatile void * __xlx_apatb_param_a_15, volatile void * __xlx_apatb_param_a_16, volatile void * __xlx_apatb_param_a_17, volatile void * __xlx_apatb_param_a_18, volatile void * __xlx_apatb_param_a_19, volatile void * __xlx_apatb_param_a_20, volatile void * __xlx_apatb_param_b_0, volatile void * __xlx_apatb_param_b_1, volatile void * __xlx_apatb_param_b_2, volatile void * __xlx_apatb_param_b_3, volatile void * __xlx_apatb_param_b_4, volatile void * __xlx_apatb_param_b_5, volatile void * __xlx_apatb_param_b_6, volatile void * __xlx_apatb_param_b_7, volatile void * __xlx_apatb_param_b_8, volatile void * __xlx_apatb_param_b_9, volatile void * __xlx_apatb_param_b_10, volatile void * __xlx_apatb_param_b_11, volatile void * __xlx_apatb_param_b_12, volatile void * __xlx_apatb_param_b_13, volatile void * __xlx_apatb_param_b_14, volatile void * __xlx_apatb_param_b_15, volatile void * __xlx_apatb_param_b_16, volatile void * __xlx_apatb_param_b_17, volatile void * __xlx_apatb_param_b_18, volatile void * __xlx_apatb_param_b_19, volatile void * __xlx_apatb_param_b_20, volatile void * __xlx_apatb_param_c) {
using hls::sim::createStream;
  // Collect __xlx_a_0__tmp_vec
std::vector<Byte<4>> __xlx_a_0__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_0)[i]);
}
  int __xlx_size_param_a_0 = 84;
  int __xlx_offset_param_a_0 = 0;
  int __xlx_offset_byte_param_a_0 = 0*4;
  // Collect __xlx_a_1__tmp_vec
std::vector<Byte<4>> __xlx_a_1__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_1)[i]);
}
  int __xlx_size_param_a_1 = 84;
  int __xlx_offset_param_a_1 = 0;
  int __xlx_offset_byte_param_a_1 = 0*4;
  // Collect __xlx_a_2__tmp_vec
std::vector<Byte<4>> __xlx_a_2__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_2)[i]);
}
  int __xlx_size_param_a_2 = 84;
  int __xlx_offset_param_a_2 = 0;
  int __xlx_offset_byte_param_a_2 = 0*4;
  // Collect __xlx_a_3__tmp_vec
std::vector<Byte<4>> __xlx_a_3__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_3)[i]);
}
  int __xlx_size_param_a_3 = 84;
  int __xlx_offset_param_a_3 = 0;
  int __xlx_offset_byte_param_a_3 = 0*4;
  // Collect __xlx_a_4__tmp_vec
std::vector<Byte<4>> __xlx_a_4__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_4)[i]);
}
  int __xlx_size_param_a_4 = 84;
  int __xlx_offset_param_a_4 = 0;
  int __xlx_offset_byte_param_a_4 = 0*4;
  // Collect __xlx_a_5__tmp_vec
std::vector<Byte<4>> __xlx_a_5__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_5)[i]);
}
  int __xlx_size_param_a_5 = 84;
  int __xlx_offset_param_a_5 = 0;
  int __xlx_offset_byte_param_a_5 = 0*4;
  // Collect __xlx_a_6__tmp_vec
std::vector<Byte<4>> __xlx_a_6__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_6)[i]);
}
  int __xlx_size_param_a_6 = 84;
  int __xlx_offset_param_a_6 = 0;
  int __xlx_offset_byte_param_a_6 = 0*4;
  // Collect __xlx_a_7__tmp_vec
std::vector<Byte<4>> __xlx_a_7__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_7)[i]);
}
  int __xlx_size_param_a_7 = 84;
  int __xlx_offset_param_a_7 = 0;
  int __xlx_offset_byte_param_a_7 = 0*4;
  // Collect __xlx_a_8__tmp_vec
std::vector<Byte<4>> __xlx_a_8__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_8__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_8)[i]);
}
  int __xlx_size_param_a_8 = 84;
  int __xlx_offset_param_a_8 = 0;
  int __xlx_offset_byte_param_a_8 = 0*4;
  // Collect __xlx_a_9__tmp_vec
std::vector<Byte<4>> __xlx_a_9__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_9__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_9)[i]);
}
  int __xlx_size_param_a_9 = 84;
  int __xlx_offset_param_a_9 = 0;
  int __xlx_offset_byte_param_a_9 = 0*4;
  // Collect __xlx_a_10__tmp_vec
std::vector<Byte<4>> __xlx_a_10__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_10__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_10)[i]);
}
  int __xlx_size_param_a_10 = 84;
  int __xlx_offset_param_a_10 = 0;
  int __xlx_offset_byte_param_a_10 = 0*4;
  // Collect __xlx_a_11__tmp_vec
std::vector<Byte<4>> __xlx_a_11__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_11__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_11)[i]);
}
  int __xlx_size_param_a_11 = 84;
  int __xlx_offset_param_a_11 = 0;
  int __xlx_offset_byte_param_a_11 = 0*4;
  // Collect __xlx_a_12__tmp_vec
std::vector<Byte<4>> __xlx_a_12__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_12__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_12)[i]);
}
  int __xlx_size_param_a_12 = 84;
  int __xlx_offset_param_a_12 = 0;
  int __xlx_offset_byte_param_a_12 = 0*4;
  // Collect __xlx_a_13__tmp_vec
std::vector<Byte<4>> __xlx_a_13__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_13__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_13)[i]);
}
  int __xlx_size_param_a_13 = 84;
  int __xlx_offset_param_a_13 = 0;
  int __xlx_offset_byte_param_a_13 = 0*4;
  // Collect __xlx_a_14__tmp_vec
std::vector<Byte<4>> __xlx_a_14__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_14__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_14)[i]);
}
  int __xlx_size_param_a_14 = 84;
  int __xlx_offset_param_a_14 = 0;
  int __xlx_offset_byte_param_a_14 = 0*4;
  // Collect __xlx_a_15__tmp_vec
std::vector<Byte<4>> __xlx_a_15__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_15__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_15)[i]);
}
  int __xlx_size_param_a_15 = 84;
  int __xlx_offset_param_a_15 = 0;
  int __xlx_offset_byte_param_a_15 = 0*4;
  // Collect __xlx_a_16__tmp_vec
std::vector<Byte<4>> __xlx_a_16__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_16__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_16)[i]);
}
  int __xlx_size_param_a_16 = 84;
  int __xlx_offset_param_a_16 = 0;
  int __xlx_offset_byte_param_a_16 = 0*4;
  // Collect __xlx_a_17__tmp_vec
std::vector<Byte<4>> __xlx_a_17__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_17__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_17)[i]);
}
  int __xlx_size_param_a_17 = 84;
  int __xlx_offset_param_a_17 = 0;
  int __xlx_offset_byte_param_a_17 = 0*4;
  // Collect __xlx_a_18__tmp_vec
std::vector<Byte<4>> __xlx_a_18__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_18__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_18)[i]);
}
  int __xlx_size_param_a_18 = 84;
  int __xlx_offset_param_a_18 = 0;
  int __xlx_offset_byte_param_a_18 = 0*4;
  // Collect __xlx_a_19__tmp_vec
std::vector<Byte<4>> __xlx_a_19__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_19__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_19)[i]);
}
  int __xlx_size_param_a_19 = 84;
  int __xlx_offset_param_a_19 = 0;
  int __xlx_offset_byte_param_a_19 = 0*4;
  // Collect __xlx_a_20__tmp_vec
std::vector<Byte<4>> __xlx_a_20__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_a_20__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_a_20)[i]);
}
  int __xlx_size_param_a_20 = 84;
  int __xlx_offset_param_a_20 = 0;
  int __xlx_offset_byte_param_a_20 = 0*4;
  // Collect __xlx_b_0__tmp_vec
std::vector<Byte<4>> __xlx_b_0__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_0)[i]);
}
  int __xlx_size_param_b_0 = 84;
  int __xlx_offset_param_b_0 = 0;
  int __xlx_offset_byte_param_b_0 = 0*4;
  // Collect __xlx_b_1__tmp_vec
std::vector<Byte<4>> __xlx_b_1__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_1)[i]);
}
  int __xlx_size_param_b_1 = 84;
  int __xlx_offset_param_b_1 = 0;
  int __xlx_offset_byte_param_b_1 = 0*4;
  // Collect __xlx_b_2__tmp_vec
std::vector<Byte<4>> __xlx_b_2__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_2)[i]);
}
  int __xlx_size_param_b_2 = 84;
  int __xlx_offset_param_b_2 = 0;
  int __xlx_offset_byte_param_b_2 = 0*4;
  // Collect __xlx_b_3__tmp_vec
std::vector<Byte<4>> __xlx_b_3__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_3)[i]);
}
  int __xlx_size_param_b_3 = 84;
  int __xlx_offset_param_b_3 = 0;
  int __xlx_offset_byte_param_b_3 = 0*4;
  // Collect __xlx_b_4__tmp_vec
std::vector<Byte<4>> __xlx_b_4__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_4)[i]);
}
  int __xlx_size_param_b_4 = 84;
  int __xlx_offset_param_b_4 = 0;
  int __xlx_offset_byte_param_b_4 = 0*4;
  // Collect __xlx_b_5__tmp_vec
std::vector<Byte<4>> __xlx_b_5__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_5)[i]);
}
  int __xlx_size_param_b_5 = 84;
  int __xlx_offset_param_b_5 = 0;
  int __xlx_offset_byte_param_b_5 = 0*4;
  // Collect __xlx_b_6__tmp_vec
std::vector<Byte<4>> __xlx_b_6__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_6)[i]);
}
  int __xlx_size_param_b_6 = 84;
  int __xlx_offset_param_b_6 = 0;
  int __xlx_offset_byte_param_b_6 = 0*4;
  // Collect __xlx_b_7__tmp_vec
std::vector<Byte<4>> __xlx_b_7__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_7)[i]);
}
  int __xlx_size_param_b_7 = 84;
  int __xlx_offset_param_b_7 = 0;
  int __xlx_offset_byte_param_b_7 = 0*4;
  // Collect __xlx_b_8__tmp_vec
std::vector<Byte<4>> __xlx_b_8__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_8__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_8)[i]);
}
  int __xlx_size_param_b_8 = 84;
  int __xlx_offset_param_b_8 = 0;
  int __xlx_offset_byte_param_b_8 = 0*4;
  // Collect __xlx_b_9__tmp_vec
std::vector<Byte<4>> __xlx_b_9__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_9__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_9)[i]);
}
  int __xlx_size_param_b_9 = 84;
  int __xlx_offset_param_b_9 = 0;
  int __xlx_offset_byte_param_b_9 = 0*4;
  // Collect __xlx_b_10__tmp_vec
std::vector<Byte<4>> __xlx_b_10__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_10__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_10)[i]);
}
  int __xlx_size_param_b_10 = 84;
  int __xlx_offset_param_b_10 = 0;
  int __xlx_offset_byte_param_b_10 = 0*4;
  // Collect __xlx_b_11__tmp_vec
std::vector<Byte<4>> __xlx_b_11__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_11__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_11)[i]);
}
  int __xlx_size_param_b_11 = 84;
  int __xlx_offset_param_b_11 = 0;
  int __xlx_offset_byte_param_b_11 = 0*4;
  // Collect __xlx_b_12__tmp_vec
std::vector<Byte<4>> __xlx_b_12__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_12__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_12)[i]);
}
  int __xlx_size_param_b_12 = 84;
  int __xlx_offset_param_b_12 = 0;
  int __xlx_offset_byte_param_b_12 = 0*4;
  // Collect __xlx_b_13__tmp_vec
std::vector<Byte<4>> __xlx_b_13__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_13__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_13)[i]);
}
  int __xlx_size_param_b_13 = 84;
  int __xlx_offset_param_b_13 = 0;
  int __xlx_offset_byte_param_b_13 = 0*4;
  // Collect __xlx_b_14__tmp_vec
std::vector<Byte<4>> __xlx_b_14__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_14__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_14)[i]);
}
  int __xlx_size_param_b_14 = 84;
  int __xlx_offset_param_b_14 = 0;
  int __xlx_offset_byte_param_b_14 = 0*4;
  // Collect __xlx_b_15__tmp_vec
std::vector<Byte<4>> __xlx_b_15__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_15__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_15)[i]);
}
  int __xlx_size_param_b_15 = 84;
  int __xlx_offset_param_b_15 = 0;
  int __xlx_offset_byte_param_b_15 = 0*4;
  // Collect __xlx_b_16__tmp_vec
std::vector<Byte<4>> __xlx_b_16__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_16__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_16)[i]);
}
  int __xlx_size_param_b_16 = 84;
  int __xlx_offset_param_b_16 = 0;
  int __xlx_offset_byte_param_b_16 = 0*4;
  // Collect __xlx_b_17__tmp_vec
std::vector<Byte<4>> __xlx_b_17__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_17__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_17)[i]);
}
  int __xlx_size_param_b_17 = 84;
  int __xlx_offset_param_b_17 = 0;
  int __xlx_offset_byte_param_b_17 = 0*4;
  // Collect __xlx_b_18__tmp_vec
std::vector<Byte<4>> __xlx_b_18__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_18__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_18)[i]);
}
  int __xlx_size_param_b_18 = 84;
  int __xlx_offset_param_b_18 = 0;
  int __xlx_offset_byte_param_b_18 = 0*4;
  // Collect __xlx_b_19__tmp_vec
std::vector<Byte<4>> __xlx_b_19__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_19__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_19)[i]);
}
  int __xlx_size_param_b_19 = 84;
  int __xlx_offset_param_b_19 = 0;
  int __xlx_offset_byte_param_b_19 = 0*4;
  // Collect __xlx_b_20__tmp_vec
std::vector<Byte<4>> __xlx_b_20__tmp_vec;
for (size_t i = 0; i < 84; ++i){
__xlx_b_20__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_b_20)[i]);
}
  int __xlx_size_param_b_20 = 84;
  int __xlx_offset_param_b_20 = 0;
  int __xlx_offset_byte_param_b_20 = 0*4;
  // Collect __xlx_c__tmp_vec
std::vector<Byte<4>> __xlx_c__tmp_vec;
for (size_t i = 0; i < 1764; ++i){
__xlx_c__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_c)[i]);
}
  int __xlx_size_param_c = 1764;
  int __xlx_offset_param_c = 0;
  int __xlx_offset_byte_param_c = 0*4;
  // DUT call
  mmult_hw(__xlx_a_0__tmp_vec.data(), __xlx_a_1__tmp_vec.data(), __xlx_a_2__tmp_vec.data(), __xlx_a_3__tmp_vec.data(), __xlx_a_4__tmp_vec.data(), __xlx_a_5__tmp_vec.data(), __xlx_a_6__tmp_vec.data(), __xlx_a_7__tmp_vec.data(), __xlx_a_8__tmp_vec.data(), __xlx_a_9__tmp_vec.data(), __xlx_a_10__tmp_vec.data(), __xlx_a_11__tmp_vec.data(), __xlx_a_12__tmp_vec.data(), __xlx_a_13__tmp_vec.data(), __xlx_a_14__tmp_vec.data(), __xlx_a_15__tmp_vec.data(), __xlx_a_16__tmp_vec.data(), __xlx_a_17__tmp_vec.data(), __xlx_a_18__tmp_vec.data(), __xlx_a_19__tmp_vec.data(), __xlx_a_20__tmp_vec.data(), __xlx_b_0__tmp_vec.data(), __xlx_b_1__tmp_vec.data(), __xlx_b_2__tmp_vec.data(), __xlx_b_3__tmp_vec.data(), __xlx_b_4__tmp_vec.data(), __xlx_b_5__tmp_vec.data(), __xlx_b_6__tmp_vec.data(), __xlx_b_7__tmp_vec.data(), __xlx_b_8__tmp_vec.data(), __xlx_b_9__tmp_vec.data(), __xlx_b_10__tmp_vec.data(), __xlx_b_11__tmp_vec.data(), __xlx_b_12__tmp_vec.data(), __xlx_b_13__tmp_vec.data(), __xlx_b_14__tmp_vec.data(), __xlx_b_15__tmp_vec.data(), __xlx_b_16__tmp_vec.data(), __xlx_b_17__tmp_vec.data(), __xlx_b_18__tmp_vec.data(), __xlx_b_19__tmp_vec.data(), __xlx_b_20__tmp_vec.data(), __xlx_c__tmp_vec.data());
// print __xlx_apatb_param_a_0
for (size_t i = 0; i < __xlx_size_param_a_0; ++i) {
((Byte<4>*)__xlx_apatb_param_a_0)[i] = __xlx_a_0__tmp_vec[__xlx_offset_param_a_0+i];
}
// print __xlx_apatb_param_a_1
for (size_t i = 0; i < __xlx_size_param_a_1; ++i) {
((Byte<4>*)__xlx_apatb_param_a_1)[i] = __xlx_a_1__tmp_vec[__xlx_offset_param_a_1+i];
}
// print __xlx_apatb_param_a_2
for (size_t i = 0; i < __xlx_size_param_a_2; ++i) {
((Byte<4>*)__xlx_apatb_param_a_2)[i] = __xlx_a_2__tmp_vec[__xlx_offset_param_a_2+i];
}
// print __xlx_apatb_param_a_3
for (size_t i = 0; i < __xlx_size_param_a_3; ++i) {
((Byte<4>*)__xlx_apatb_param_a_3)[i] = __xlx_a_3__tmp_vec[__xlx_offset_param_a_3+i];
}
// print __xlx_apatb_param_a_4
for (size_t i = 0; i < __xlx_size_param_a_4; ++i) {
((Byte<4>*)__xlx_apatb_param_a_4)[i] = __xlx_a_4__tmp_vec[__xlx_offset_param_a_4+i];
}
// print __xlx_apatb_param_a_5
for (size_t i = 0; i < __xlx_size_param_a_5; ++i) {
((Byte<4>*)__xlx_apatb_param_a_5)[i] = __xlx_a_5__tmp_vec[__xlx_offset_param_a_5+i];
}
// print __xlx_apatb_param_a_6
for (size_t i = 0; i < __xlx_size_param_a_6; ++i) {
((Byte<4>*)__xlx_apatb_param_a_6)[i] = __xlx_a_6__tmp_vec[__xlx_offset_param_a_6+i];
}
// print __xlx_apatb_param_a_7
for (size_t i = 0; i < __xlx_size_param_a_7; ++i) {
((Byte<4>*)__xlx_apatb_param_a_7)[i] = __xlx_a_7__tmp_vec[__xlx_offset_param_a_7+i];
}
// print __xlx_apatb_param_a_8
for (size_t i = 0; i < __xlx_size_param_a_8; ++i) {
((Byte<4>*)__xlx_apatb_param_a_8)[i] = __xlx_a_8__tmp_vec[__xlx_offset_param_a_8+i];
}
// print __xlx_apatb_param_a_9
for (size_t i = 0; i < __xlx_size_param_a_9; ++i) {
((Byte<4>*)__xlx_apatb_param_a_9)[i] = __xlx_a_9__tmp_vec[__xlx_offset_param_a_9+i];
}
// print __xlx_apatb_param_a_10
for (size_t i = 0; i < __xlx_size_param_a_10; ++i) {
((Byte<4>*)__xlx_apatb_param_a_10)[i] = __xlx_a_10__tmp_vec[__xlx_offset_param_a_10+i];
}
// print __xlx_apatb_param_a_11
for (size_t i = 0; i < __xlx_size_param_a_11; ++i) {
((Byte<4>*)__xlx_apatb_param_a_11)[i] = __xlx_a_11__tmp_vec[__xlx_offset_param_a_11+i];
}
// print __xlx_apatb_param_a_12
for (size_t i = 0; i < __xlx_size_param_a_12; ++i) {
((Byte<4>*)__xlx_apatb_param_a_12)[i] = __xlx_a_12__tmp_vec[__xlx_offset_param_a_12+i];
}
// print __xlx_apatb_param_a_13
for (size_t i = 0; i < __xlx_size_param_a_13; ++i) {
((Byte<4>*)__xlx_apatb_param_a_13)[i] = __xlx_a_13__tmp_vec[__xlx_offset_param_a_13+i];
}
// print __xlx_apatb_param_a_14
for (size_t i = 0; i < __xlx_size_param_a_14; ++i) {
((Byte<4>*)__xlx_apatb_param_a_14)[i] = __xlx_a_14__tmp_vec[__xlx_offset_param_a_14+i];
}
// print __xlx_apatb_param_a_15
for (size_t i = 0; i < __xlx_size_param_a_15; ++i) {
((Byte<4>*)__xlx_apatb_param_a_15)[i] = __xlx_a_15__tmp_vec[__xlx_offset_param_a_15+i];
}
// print __xlx_apatb_param_a_16
for (size_t i = 0; i < __xlx_size_param_a_16; ++i) {
((Byte<4>*)__xlx_apatb_param_a_16)[i] = __xlx_a_16__tmp_vec[__xlx_offset_param_a_16+i];
}
// print __xlx_apatb_param_a_17
for (size_t i = 0; i < __xlx_size_param_a_17; ++i) {
((Byte<4>*)__xlx_apatb_param_a_17)[i] = __xlx_a_17__tmp_vec[__xlx_offset_param_a_17+i];
}
// print __xlx_apatb_param_a_18
for (size_t i = 0; i < __xlx_size_param_a_18; ++i) {
((Byte<4>*)__xlx_apatb_param_a_18)[i] = __xlx_a_18__tmp_vec[__xlx_offset_param_a_18+i];
}
// print __xlx_apatb_param_a_19
for (size_t i = 0; i < __xlx_size_param_a_19; ++i) {
((Byte<4>*)__xlx_apatb_param_a_19)[i] = __xlx_a_19__tmp_vec[__xlx_offset_param_a_19+i];
}
// print __xlx_apatb_param_a_20
for (size_t i = 0; i < __xlx_size_param_a_20; ++i) {
((Byte<4>*)__xlx_apatb_param_a_20)[i] = __xlx_a_20__tmp_vec[__xlx_offset_param_a_20+i];
}
// print __xlx_apatb_param_b_0
for (size_t i = 0; i < __xlx_size_param_b_0; ++i) {
((Byte<4>*)__xlx_apatb_param_b_0)[i] = __xlx_b_0__tmp_vec[__xlx_offset_param_b_0+i];
}
// print __xlx_apatb_param_b_1
for (size_t i = 0; i < __xlx_size_param_b_1; ++i) {
((Byte<4>*)__xlx_apatb_param_b_1)[i] = __xlx_b_1__tmp_vec[__xlx_offset_param_b_1+i];
}
// print __xlx_apatb_param_b_2
for (size_t i = 0; i < __xlx_size_param_b_2; ++i) {
((Byte<4>*)__xlx_apatb_param_b_2)[i] = __xlx_b_2__tmp_vec[__xlx_offset_param_b_2+i];
}
// print __xlx_apatb_param_b_3
for (size_t i = 0; i < __xlx_size_param_b_3; ++i) {
((Byte<4>*)__xlx_apatb_param_b_3)[i] = __xlx_b_3__tmp_vec[__xlx_offset_param_b_3+i];
}
// print __xlx_apatb_param_b_4
for (size_t i = 0; i < __xlx_size_param_b_4; ++i) {
((Byte<4>*)__xlx_apatb_param_b_4)[i] = __xlx_b_4__tmp_vec[__xlx_offset_param_b_4+i];
}
// print __xlx_apatb_param_b_5
for (size_t i = 0; i < __xlx_size_param_b_5; ++i) {
((Byte<4>*)__xlx_apatb_param_b_5)[i] = __xlx_b_5__tmp_vec[__xlx_offset_param_b_5+i];
}
// print __xlx_apatb_param_b_6
for (size_t i = 0; i < __xlx_size_param_b_6; ++i) {
((Byte<4>*)__xlx_apatb_param_b_6)[i] = __xlx_b_6__tmp_vec[__xlx_offset_param_b_6+i];
}
// print __xlx_apatb_param_b_7
for (size_t i = 0; i < __xlx_size_param_b_7; ++i) {
((Byte<4>*)__xlx_apatb_param_b_7)[i] = __xlx_b_7__tmp_vec[__xlx_offset_param_b_7+i];
}
// print __xlx_apatb_param_b_8
for (size_t i = 0; i < __xlx_size_param_b_8; ++i) {
((Byte<4>*)__xlx_apatb_param_b_8)[i] = __xlx_b_8__tmp_vec[__xlx_offset_param_b_8+i];
}
// print __xlx_apatb_param_b_9
for (size_t i = 0; i < __xlx_size_param_b_9; ++i) {
((Byte<4>*)__xlx_apatb_param_b_9)[i] = __xlx_b_9__tmp_vec[__xlx_offset_param_b_9+i];
}
// print __xlx_apatb_param_b_10
for (size_t i = 0; i < __xlx_size_param_b_10; ++i) {
((Byte<4>*)__xlx_apatb_param_b_10)[i] = __xlx_b_10__tmp_vec[__xlx_offset_param_b_10+i];
}
// print __xlx_apatb_param_b_11
for (size_t i = 0; i < __xlx_size_param_b_11; ++i) {
((Byte<4>*)__xlx_apatb_param_b_11)[i] = __xlx_b_11__tmp_vec[__xlx_offset_param_b_11+i];
}
// print __xlx_apatb_param_b_12
for (size_t i = 0; i < __xlx_size_param_b_12; ++i) {
((Byte<4>*)__xlx_apatb_param_b_12)[i] = __xlx_b_12__tmp_vec[__xlx_offset_param_b_12+i];
}
// print __xlx_apatb_param_b_13
for (size_t i = 0; i < __xlx_size_param_b_13; ++i) {
((Byte<4>*)__xlx_apatb_param_b_13)[i] = __xlx_b_13__tmp_vec[__xlx_offset_param_b_13+i];
}
// print __xlx_apatb_param_b_14
for (size_t i = 0; i < __xlx_size_param_b_14; ++i) {
((Byte<4>*)__xlx_apatb_param_b_14)[i] = __xlx_b_14__tmp_vec[__xlx_offset_param_b_14+i];
}
// print __xlx_apatb_param_b_15
for (size_t i = 0; i < __xlx_size_param_b_15; ++i) {
((Byte<4>*)__xlx_apatb_param_b_15)[i] = __xlx_b_15__tmp_vec[__xlx_offset_param_b_15+i];
}
// print __xlx_apatb_param_b_16
for (size_t i = 0; i < __xlx_size_param_b_16; ++i) {
((Byte<4>*)__xlx_apatb_param_b_16)[i] = __xlx_b_16__tmp_vec[__xlx_offset_param_b_16+i];
}
// print __xlx_apatb_param_b_17
for (size_t i = 0; i < __xlx_size_param_b_17; ++i) {
((Byte<4>*)__xlx_apatb_param_b_17)[i] = __xlx_b_17__tmp_vec[__xlx_offset_param_b_17+i];
}
// print __xlx_apatb_param_b_18
for (size_t i = 0; i < __xlx_size_param_b_18; ++i) {
((Byte<4>*)__xlx_apatb_param_b_18)[i] = __xlx_b_18__tmp_vec[__xlx_offset_param_b_18+i];
}
// print __xlx_apatb_param_b_19
for (size_t i = 0; i < __xlx_size_param_b_19; ++i) {
((Byte<4>*)__xlx_apatb_param_b_19)[i] = __xlx_b_19__tmp_vec[__xlx_offset_param_b_19+i];
}
// print __xlx_apatb_param_b_20
for (size_t i = 0; i < __xlx_size_param_b_20; ++i) {
((Byte<4>*)__xlx_apatb_param_b_20)[i] = __xlx_b_20__tmp_vec[__xlx_offset_param_b_20+i];
}
// print __xlx_apatb_param_c
for (size_t i = 0; i < __xlx_size_param_c; ++i) {
((Byte<4>*)__xlx_apatb_param_c)[i] = __xlx_c__tmp_vec[__xlx_offset_param_c+i];
}
}
