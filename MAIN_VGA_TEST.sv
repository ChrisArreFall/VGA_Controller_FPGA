module MAIN_VGA_TEST(input  logic clk, reset, reset_color, cuadrante,
							output logic hsync, vsync, n_sync, n_blanc, n25MHZCLK,
							output logic [7:0] r,g,b,
							output logic [2:0] cuadrante_actual);
	
	logic [9:0] x, y;
	logic [7:0] r_siguiente,g_siguiente,b_siguiente;
	// Satus de la salida de video al monitor
	logic video_on;

	// se instansea HV_sync
	HV_sync 		vga_sync_unit 		(.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync), .enable(video_on), .clk_out(n25MHZCLK), .x(x), .y(y));
	// se elige la seccion a partir de el boton y la maquina de estados						  
	seccionFSM 	seccionFSM_unit 	(cuadrante,reset,cuadrante_actual,cuadrante_actual);
	// se pinta depende de la x y el cuadrante en el que estemos
	pintadorXY 	pintadorXY_unit	(n25MHZCLK,cuadrante,reset,reset_color,cuadrante_actual,x,y,r_siguiente,g_siguiente,b_siguiente);
	
	
	
	assign r = (video_on) ? r_siguiente : 8'b0;
	assign g = (video_on) ? g_siguiente : 8'b0;
	assign b = (video_on) ? b_siguiente : 8'b0;
	assign n_sync  =  1'b0;
	assign n_blanc =  1'b1;
		  
endmodule
