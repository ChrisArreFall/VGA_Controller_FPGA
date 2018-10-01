module color_xy(input logic clk, reset,
				    input logic [9:0] x, y,
					 input logic [1:0] cuadrante,
					 output logic [7:0] r_out,g_out,b_out);
		
			logic [7:0] r_new,g_new,b_new;
			
			random_color temp_color_r(clk,~reset,r_new);
			random_color temp_color_g(clk,~reset,g_new);
			random_color temp_color_b(clk,~reset,b_new);
					 
//			always_ff @(posedge clk, posedge reset)
//				begin
//					if (clk)
//						begin
//							r_out <= r_in;
//							g_out <= r_in;
//							b_out <= r_in;
//						end
//					else
//						begin
//							if (cuadrante == 2'b00&&x<368 &&y<273)
//								begin
//									r_out <= r_new;
//									g_out <= g_new;
//									b_out <= b_new;
//								end
//							if (cuadrante == 2'b01&&x>368 &&y<273)
//								begin
//									r_out <= r_new;
//									g_out <= g_new;
//									b_out <= b_new;
//								end
//							if (cuadrante == 2'b10&&x<368 &&y>273)
//								begin
//									r_out <= r_new;
//									g_out <= g_new;
//									b_out <= b_new;
//								end
//							if (cuadrante == 2'b11&&x>368 &&y>273)
//								begin
//									r_out <= r_new;
//									g_out <= g_new;
//									b_out <= b_new;
//								end
//							else
//								begin
//									r_out <= r_in;
//									g_out <= r_in;
//									b_out <= r_in;
//								end
//						end			
//					end
			
endmodule
