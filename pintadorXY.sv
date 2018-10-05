module pintadorXY(input logic clk,clk2,reset,reset_color,
						input logic [2:0] seccion_actual,
						input logic [9:0] x, y,
						output logic [7:0] r,g,b);
						
						
				localparam H_CENTRO = 320;
				localparam V_CENTRO = 240;
				
				logic [7:0] r_0=0,g_0=0,b_0=0,r_1=0,g_1=0,b_1=0,r_2=0,g_2=0,b_2=0,r_3=0,g_3=0,b_3=0,r_4=0,g_4=0,b_4=0,r_elec,g_elec,b_elec;
				
				logic [31:0] count_temp;
				
				always_ff @(posedge clk)
					count_temp = count_temp + 1;
				
				
			
				always_ff @(posedge clk2,posedge reset_color)
					if(reset_color)
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
							r_1 = count_temp;
							g_1 = count_temp * 20;
							b_1 = g_1 + r_1;
						end
					else if(seccion_actual==3'b010)
						begin
							r_2 = g_2 + r_2;
							g_2 = count_temp * 22;
							b_2 = count_temp;
						end
					else if(seccion_actual==3'b011)
						begin
							r_3 = count_temp * 24;
							g_3 = count_temp;
							b_3 = g_3 + r_3;
						end
					else if(seccion_actual==3'b100)
						begin
							r_4 = count_temp * 26;
							g_4 = g_4 + r_4;
							b_4 = count_temp;
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
					else if(x>H_CENTRO&&y<=V_CENTRO)
						begin
							r_elec = r_2;
							g_elec = g_2;
							b_elec = b_2;
						end
					else if(x<=H_CENTRO&&y>V_CENTRO)
						begin
							r_elec = r_3;
							g_elec = g_3;
							b_elec = b_3;
						end
					else if(x>H_CENTRO&&y>V_CENTRO)
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