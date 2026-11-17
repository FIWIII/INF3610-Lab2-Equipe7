# 2026-11-16T20:40:43.140453200
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/INF3610_Lab2")

comp = client.create_hls_component(name = "hls_A_float32_algo",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

cfg = client.get_config_file(path="/c:/INF3610_Lab2/hls_A_float32_algo/hls_config.cfg")

cfg.set_value(section="hls", key="syn.compile.pipeline_loops", value="0")

comp = client.get_component(name="hls_A_float32_algo")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

