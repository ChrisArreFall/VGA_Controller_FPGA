module contador_cuadrante(input  logic clk, reset,
							input  logic [1:0] entrada,
							output logic [1:0] salida);
							
			always_ff @(posedge clk, posedge reset)
				if (reset)
						salida <= 0;
				else
						salida <= entrada+1;
endmodule
