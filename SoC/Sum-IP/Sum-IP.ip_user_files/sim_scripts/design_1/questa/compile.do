vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_13
vlib questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_27
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/axi_data_fifo_v2_1_26
vlib questa_lib/msim/axi_crossbar_v2_1_28
vlib questa_lib/msim/axi_protocol_converter_v2_1_27
vlib questa_lib/msim/axi_clock_converter_v2_1_26
vlib questa_lib/msim/blk_mem_gen_v8_4_5
vlib questa_lib/msim/axi_dwidth_converter_v2_1_27
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 questa_lib/msim/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 questa_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 questa_lib/msim/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 questa_lib/msim/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 questa_lib/msim/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 questa_lib/msim/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 questa_lib/msim/axi_clock_converter_v2_1_26
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5
vmap axi_dwidth_converter_v2_1_27 questa_lib/msim/axi_dwidth_converter_v2_1_27
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"F:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/sim/design_1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new/sum.v" \
"../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new/myip_v1_0_S00_AXI.v" \
"../../../bd/design_1/ip/design_1_MY_IP_v1_0_S00_AXI_0_0/sim/design_1_MY_IP_v1_0_S00_AXI_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93  \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_26  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_5  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_ds_0/sim/design_1_auto_ds_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/ip/design_1_auto_ds_1/sim/design_1_auto_ds_1.v" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/design_1/ip/design_1_rst_ps8_0_99M_0/sim/design_1_rst_ps8_0_99M_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/abef/hdl" "+incdir+../../../bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+../../../../Sum-IP.gen/sources_1/bd/design_1/ipshared/91e5/sum.srcs/sources_1/new" "+incdir+F:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

