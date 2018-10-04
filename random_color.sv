module random_color(input logic clk,reset,
						  input logic [31:0] count,
						  output logic [31:0] color_out_r,color_out_g,color_out_b,count_after);
			 
		always_ff @(posedge clk)
		begin
			color_out_r = count+5;
			color_out_g = count+10;
			color_out_b = count+20;
			count_after <= count + 1;
		end
endmodule

