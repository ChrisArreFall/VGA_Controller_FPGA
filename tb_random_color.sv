module tb_random_color();
	logic [7:0] data;
	logic clk_referencia,reset;
	
	// instantiate device under test 
	random_color dut(clk_referencia,reset,data); 
	
	initial 
		begin 
			clk_referencia=0;reset=0;#10;
				assert (data === 0) else $error("Fallo debe ser 0."); 
	//primer periodo
			clk_referencia=1;reset=0;#10;
				assert (data === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=0;reset=0;#10;
				assert (data === 0) else $error("Fallo debe ser 0.");
			clk_referencia=1;reset=0;#10;
				assert (data === 1) else $error("Fallo debe ser 1.");
			clk_referencia=0;reset=0;#10;
				assert (data === 1) else $error("Fallo debe ser 1."); 
	//segundo periodo
			clk_referencia=1;reset=0;#10;
				assert (data === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=0;reset=0;#10;
				assert (data === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=0;reset=0;#10;
				assert (data === 1) else $error("Fallo debe ser 1."); 
			clk_referencia=0;reset=0;#10;
				assert (data === 1) else $error("Fallo debe ser 1."); 
		end 
	
	
endmodule
