# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\diskio.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ff.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ffconf.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\sleep.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs_config.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilrsa.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xiltimer.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xtimer_config.h"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilffs.a"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilrsa.a"
  "C:\\INF3610_Lab2\\platform_float32_A\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxiltimer.a"
  )
endif()
