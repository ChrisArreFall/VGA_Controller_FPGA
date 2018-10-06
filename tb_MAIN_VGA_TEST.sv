module tb_MAIN_VGA_TEST();
	logic clk=1,reset=1,reset_color,cuadrante;
	logic hsync, vsync, n_sync, n_blanc, n25MHZCLK;
	logic [7:0] r,g,b;
	logic [2:0] cuadrante_actual;
	
	logic [31:0] x;
	
	// instantiate device under test 
	MAIN_VGA_TEST dut(clk,reset,reset_color,cuadrante,hsync, vsync, n_sync, n_blanc, n25MHZCLK,r,g,b,cuadrante_actual); 

	initial 
	for (x=0; x < 2500; x= x+1)
	begin : static_loop;
	begin 
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado.");
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
			
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=1; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
						
			
		clk=0; reset=0; reset_color=0; cuadrante = 0; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
		clk=1; reset=0; reset_color=0; cuadrante = 1; #10;
			assert (cuadrante_actual === 0) else $error("cuadrante equivocado."); 
			
		end
		end 
	

endmodule 