module tb_seccionFSM();
	logic [2:0] estadoActual, estadoSiguiente;
	logic clk_referencia,reset;
	
	
	// instantiate device under test 
	seccionFSM dut(clk_referencia,reset,estadoActual,estadoSiguiente); 
	
	initial 
		begin 
			clk_referencia=1;reset=0;estadoActual=0;#10;
				assert (estadoSiguiente === 1) else $error("Fallo debe ser 1.");
			clk_referencia=0;reset=0;estadoActual=0;#10;
				assert (estadoSiguiente === 1) else $error("Fallo debe ser 1.");
			clk_referencia=1;reset=0;estadoActual=1;#10;
				assert (estadoSiguiente === 2) else $error("Fallo debe ser 2.");
			clk_referencia=0;reset=0;estadoActual=1;#10;
				assert (estadoSiguiente === 2) else $error("Fallo debe ser 2.");
			clk_referencia=1;reset=0;estadoActual=2;#10;
				assert (estadoSiguiente === 3) else $error("Fallo debe ser 3.");
			clk_referencia=0;reset=0;estadoActual=2;#10;
				assert (estadoSiguiente === 3) else $error("Fallo debe ser 3.");
			clk_referencia=1;reset=1;estadoActual=3;#10;
				assert (estadoSiguiente === 0) else $error("Fallo debe ser 0.");
			clk_referencia=0;reset=1;estadoActual=3;#10;
				assert (estadoSiguiente === 0) else $error("Fallo debe ser 0.");
			clk_referencia=1;reset=0;estadoActual=2;#10;
				assert (estadoSiguiente === 3) else $error("Fallo debe ser 3.");	
			clk_referencia=0;reset=0;estadoActual=2;#10;
				assert (estadoSiguiente === 3) else $error("Fallo debe ser 3.");	
			clk_referencia=1;reset=0;estadoActual=4;#10;
				assert (estadoSiguiente === 0) else $error("Fallo debe ser 0.");
			clk_referencia=0;reset=0;estadoActual=4;#10;
				assert (estadoSiguiente === 0) else $error("Fallo debe ser 0.");
				
		end 
	
	
endmodule
