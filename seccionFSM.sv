module seccionFSM(input logic        clk,reset,
					 input logic  [2:0] estado_actual,
					 output logic [2:0] estado_siguiente);
					 
	logic [2:0] A,B,C,D,E;
	assign A=0, B=1, C=2, D=3, E=4;
	
	logic [2:0] estadoSiguiente;
	
	always_ff @(posedge clk)
		if(reset) 
			estadoSiguiente <= A;
		else if(estado_actual==A)
			estadoSiguiente <= B;
		else if(estado_actual==B)
			estadoSiguiente <= C;
		else if(estado_actual==C)
			estadoSiguiente <= D;
		else if(estado_actual==D)
			estadoSiguiente <= E;
		else if(estado_actual==E)
			estadoSiguiente <= A;
			
		else 		 
			estadoSiguiente <= A;
		
	
	assign estado_siguiente = estadoSiguiente;
endmodule
