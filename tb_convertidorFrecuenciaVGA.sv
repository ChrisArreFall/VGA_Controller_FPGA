module tb_convertidorFrecuenciaVGA();
	logic clk_referencia,clk_VGA,reset;
	
	// instantiate device under test 
	convertidorFrecuenciaVGA dut(clk_referencia,reset,clk_VGA); 
	
	initial 
		begin 
			clk_referencia=0;reset=1;#10;
				assert (clk_VGA === 0) else $error("Fallo debe ser 0."); 
	//primer periodo
			clk_referencia=0;reset=0;#10;
				assert (clk_VGA === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=1;reset=0;#10;
				assert (clk_VGA === 0) else $error("Fallo debe ser 0.");
			clk_referencia=0;reset=0;#10;
				assert (clk_VGA === 1) else $error("Fallo debe ser 1.");
			clk_referencia=1;reset=0;#10;
				assert (clk_VGA === 1) else $error("Fallo debe ser 1."); 
	//segundo periodo
			clk_referencia=0;reset=0;#10;
				assert (clk_VGA === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=1;reset=0;#10;
				assert (clk_VGA === 0) else $error("Fallo debe ser 0."); 
			clk_referencia=0;reset=0;#10;
				assert (clk_VGA === 1) else $error("Fallo debe ser 1."); 
			clk_referencia=1;reset=0;#10;
				assert (clk_VGA === 1) else $error("Fallo debe ser 1."); 
		end 
	
	
endmodule
