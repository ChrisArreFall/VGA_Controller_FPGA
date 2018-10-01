module colorFSM(input logic        clk,reset,
					 input logic  [2:0] estado_actual,
					 output logic [2:0] estado_siguiente);
					 
	typedef enum logic {A, B, C, D, E} Estado;
	
	Estado estadoActual, estadoSiguiente;
	
	always_ff @(posedge clk)
		if(reset) estadoActual <= A;
		else 		 estadoActual <= estadoSiguiente;
		
	always_comb
		case(estadoActual)
			A: if(estado_actual) estadoSiguiente = B;
				else					estadoSiguiente = A;
				
			B: if(estado_actual) estadoSiguiente = C;
				else					estadoSiguiente = A;
				
			C: if(estado_actual) estadoSiguiente = D;
				else					estadoSiguiente = A;
				
			D: if(estado_actual) estadoSiguiente = E;
				else					estadoSiguiente = A;
				
			E: if(estado_actual) estadoSiguiente = A;
				else					estadoSiguiente = A;
			
			default:					estadoSiguiente = A;
		endcase
endmodule
