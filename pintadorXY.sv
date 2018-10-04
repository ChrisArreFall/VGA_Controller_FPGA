module pintadorXY(input logic clk,clk2,reset,
						input logic [2:0] seccion_actual,
						input logic [9:0] x, y,
						output logic [7:0] r,g,b);
						
						
				localparam H_CENTRO = 320;
				localparam V_CENTRO = 240;
				
				logic [7:0] r_0,g_0,b_0,r_1,g_1,b_1,r_2,g_2,b_2,r_3,g_3,b_3,r_4,g_4,b_4,r_elec,g_elec,b_elec;
				
			
				always_ff @(negedge clk2)
					if(seccion_actual==3'b000) 
						begin
							r_0 = 0;
							g_0 = 0;
							b_0 = 0;
							r_1 = 0;
							g_1 = 0;
							b_1 = 0;
							r_2 = 0;
							g_2 = 0;
							b_2 = 0;
							r_3 = 0;
							g_3 = 0;
							b_3 = 0;
							r_4 = 0;
							g_4 = 0;
							b_4 = 0;
						end
					else if(seccion_actual==3'b001) 
						begin
							r_1 = 8'b11111111;
							g_1 = 0;
							b_1 = 0;
						end
					else if(seccion_actual==3'b010)
						begin
							r_2 = 0;
							g_2 = 8'b11111111;
							b_2 = 0;
						end
					else if(seccion_actual==3'b011)
						begin
							r_3 = 0;
							g_3 = 0;
							b_3 = 8'b11111111;
						end
					else if(seccion_actual==3'b100)
						begin
							r_4 = 8'b11111111;
							g_4 = 0;
							b_4 = 8'b11111111;
						end
					else
						begin
						end
				always_ff @(posedge clk)
					if(reset) 
						begin
							r_elec = 0;
							g_elec = 0;
							b_elec = 0;
						end
					else if(x<=H_CENTRO&&y<=V_CENTRO)
						begin
							r_elec = r_1;
							g_elec = g_1;
							b_elec = b_1;
						end
					else if(x>H_CENTRO&&y<V_CENTRO)
						begin
							r_elec = r_2;
							g_elec = g_2;
							b_elec = b_2;
						end
					else if(x<H_CENTRO&&y>V_CENTRO)
						begin
							r_elec = r_3;
							g_elec = g_3;
							b_elec = b_3;
						end
					else if(x>=H_CENTRO&&y>=V_CENTRO)
						begin
							r_elec = r_4;
							g_elec = g_4;
							b_elec = b_4;
						end
					else
						begin
							r_elec = r_0;
							g_elec = g_0;
							b_elec = b_0;
						end
				assign r = r_elec;
				assign g = g_elec;
				assign b = b_elec;
						
				
endmodule