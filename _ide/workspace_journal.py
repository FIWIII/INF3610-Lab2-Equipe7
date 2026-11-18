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

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp = client.create_hls_component(name = "hls_A_float32_interface",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

cfg = client.get_config_file(path="/c:/INF3610_Lab2/hls_A_float32_interface/hls_config.cfg")

cfg.set_value(section="hls", key="syn.compile.pipeline_loops", value="0")

comp = client.get_component(name="hls_A_float32_interface")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="PACKAGE")

comp.run(operation="PACKAGE")

platform = client.create_platform_component(name = "platform_float32_A",hw_design = "$COMPONENT_LOCATION/../implementation_systeme/float32_A.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform_float32_A")
status = platform.build()

comp = client.create_app_component(name="app_float32_A",platform = "$COMPONENT_LOCATION/../platform_float32_A/export/platform_float32_A/platform_float32_A.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.get_component(name="app_float32_A")
status = comp.import_files(from_loc="", files=["C:\INF3610_Lab2\sources\software\float32_A\lib_xmmult_hw.c", "C:\INF3610_Lab2\sources\software\float32_A\lib_xmmult_hw.h", "C:\INF3610_Lab2\sources\software\float32_A\main.c"], is_skip_copy_sources = False)

comp = client.get_component(name="app_float32_A")
comp.build()

