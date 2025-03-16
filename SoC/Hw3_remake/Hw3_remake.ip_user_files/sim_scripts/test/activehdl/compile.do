vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_13
vlib activehdl/zynq_ultra_ps_e_vip_v1_0_13
vlib activehdl/xil_defaultlib
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_27
vlib activehdl/fifo_generator_v13_2_7
vlib activehdl/axi_data_fifo_v2_1_26
vlib activehdl/axi_crossbar_v2_1_28
vlib activehdl/axi_protocol_converter_v2_1_27
vlib activehdl/axi_clock_converter_v2_1_26
vlib activehdl/blk_mem_gen_v8_4_5
vlib activehdl/axi_dwidth_converter_v2_1_27
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 activehdl/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 activehdl/zynq_ultra_ps_e_vip_v1_0_13
vmap xil_defaultlib activehdl/xil_defaultlib
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 activehdl/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 activehdl/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 activehdl/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 activehdl/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 activehdl/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 activehdl/axi_clock_converter_v2_1_26
vmap blk_mem_gen_v8_4_5 activehdl/blk_mem_gen_v8_4_5
vmap axi_dwidth_converter_v2_1_27 activehdl/axi_dwidth_converter_v2_1_27
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13

vlog -work xilinx_vip  -sv2k12 "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13  -sv2k12 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/test/ip/test_zynq_ultra_ps_e_0_0/sim/test_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/test/ipshared/54a5/hdl/Compute_v1_0_S00_AXI.v" \
"../../../bd/test/ipshared/54a5/hdl/Compute_v1_0.v" \
"../../../bd/test/ip/test_Compute_0_0/sim/test_Compute_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/test/ip/test_xbar_0/sim/test_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_27  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_26  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_5  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_27  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/test/ip/test_auto_ds_0/sim/test_auto_ds_0.v" \
"../../../bd/test/ip/test_auto_pc_0/sim/test_auto_pc_0.v" \
"../../../bd/test/ip/test_auto_ds_1/sim/test_auto_ds_1.v" \
"../../../bd/test/ip/test_auto_pc_1/sim/test_auto_pc_1.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/test/ip/test_rst_ps8_0_99M_0/sim/test_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/ec67/hdl" "+incdir+../../../../Hw3_remake.gen/sources_1/bd/test/ipshared/abef/hdl" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/test/sim/test.v" \

vlog -work xil_defaultlib \
"glbl.v"

