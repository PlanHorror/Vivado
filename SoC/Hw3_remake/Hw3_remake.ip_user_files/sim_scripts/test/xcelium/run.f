-makelib xcelium_lib/xilinx_vip -sv \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_13 -sv \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_13 -sv \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test/ip/test_zynq_ultra_ps_e_0_0/sim/test_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
  "../../../bd/test/ipshared/54a5/hdl/Compute_v1_0_S00_AXI.v" \
  "../../../bd/test/ipshared/54a5/hdl/Compute_v1_0.v" \
  "../../../bd/test/ip/test_Compute_0_0/sim/test_Compute_0_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_27 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_26 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_28 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test/ip/test_xbar_0/sim/test_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_27 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_26 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_27 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test/ip/test_auto_ds_0/sim/test_auto_ds_0.v" \
  "../../../bd/test/ip/test_auto_pc_0/sim/test_auto_pc_0.v" \
  "../../../bd/test/ip/test_auto_ds_1/sim/test_auto_ds_1.v" \
  "../../../bd/test/ip/test_auto_pc_1/sim/test_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test/ip/test_rst_ps8_0_99M_0/sim/test_rst_ps8_0_99M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test/sim/test.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

