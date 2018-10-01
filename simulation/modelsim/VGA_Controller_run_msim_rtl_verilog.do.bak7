transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Chris/Documents/TEC/Taller/LAB_5/VGA_Controller_FPGA {C:/Users/Chris/Documents/TEC/Taller/LAB_5/VGA_Controller_FPGA/random_color.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/TEC/Taller/LAB_5/VGA_Controller_FPGA {C:/Users/Chris/Documents/TEC/Taller/LAB_5/VGA_Controller_FPGA/tb_random_color.sv}

