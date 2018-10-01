module convertidorFrecuenciaVGA(input logic  clk_referencia,
										  output logic clk_VGA);
			
			

		//--------------------Convertidor de 50Mhz a 25 Mhz-----------------------------
		logic pixel_temp, pixel_siguiente, pixel_tick;
		
		always_ff @(posedge clk_referencia)
			pixel_temp <= pixel_siguiente;
		
		assign pixel_siguiente = ~pixel_temp; // next state is complement of current
		
		assign pixel_tick = (pixel_temp == 0); // assert tick half of the time
		//------------------------------------------------------------------------------
		assign clk_VGA = pixel_tick;
			
endmodule 