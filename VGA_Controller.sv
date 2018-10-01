
module HV_sync(input  logic clk, reset,
					output logic hsync, vsync, enable, clk_out,
				   output logic [9:0] x, y);

			// constantes de la pantalla
			localparam H_PINTABLE       		= 640; // tamano de pantalla visible HORIZONTAL
			localparam H_BORDE_IZQUIERDO     =  48; // pixeles extra en el lado izquierdo
			localparam H_BORDE_DERECHO      	=  16; // pixeles extra en el lado izquierdo
			localparam H_RETRACE       		=  96; //retrace horizontal
			localparam H_TOTAL           		= H_PINTABLE + H_BORDE_IZQUIERDO + H_BORDE_DERECHO + H_RETRACE - 1;
			localparam INICIO_H_RETRACE 		= H_PINTABLE + H_BORDE_DERECHO;
			localparam FIN_H_RETRACE   		= H_PINTABLE + H_BORDE_DERECHO + H_RETRACE - 1;
			
			localparam V_PINTABLE       		= 480; // tamano de pantalla visible VERTICAL
			localparam V_BORDE_ARRIBA      	=  10; // pixeles extra en el lado de arriba
			localparam V_BORDE_ABAJO      	=  33; // pixeles extra en el lado abajo
			localparam V_RETRACE       		=   2; // retrace vertical
			localparam V_TOTAL           		= V_PINTABLE + V_BORDE_ARRIBA + V_BORDE_ABAJO + V_RETRACE - 1;
			localparam INICIO_V_RETRACE 		= V_PINTABLE + V_BORDE_ABAJO;
			localparam FIN_V_RETRACE   		= V_PINTABLE + V_BORDE_ABAJO + V_RETRACE - 1;
			
			//--------------------Convertidor de 50Mhz a 25 Mhz(Divisor de frecuencia)------
			logic pixel_temp, pixel_siguiente, pixel_pos_clk;
			
			always @(posedge clk)
				pixel_temp <= pixel_siguiente;
			
			assign pixel_siguiente = ~pixel_temp; // siguiente estado es el complemento del actual
			
			assign pixel_pos_clk = (pixel_temp == 0); 
			//------------------------------------------------------------------------------
			
			
			// Variables para mantener la localizacion de los pixeles
			logic [9:0] h_count_temp, h_count_siguiente, v_count_temp, v_count_ssiguiente;
			
			//Variables para guardar los estados vsync y hsync
			logic vsync_temp, hsync_reg;
			logic vsync_siguiente, hsync_siguiente;
		 
			
			always_ff @(posedge clk, posedge reset)
				if(reset)
					 begin
								  v_count_temp <= 0;
								  h_count_temp <= 0;
								  vsync_temp   <= 0;
								  hsync_reg    <= 0;
							end
				else
					 begin
								  v_count_temp <= v_count_ssiguiente;
								  h_count_temp <= h_count_siguiente;
								  vsync_temp   <= vsync_siguiente;
								  hsync_reg   <= hsync_siguiente;
							end
					
			// logica de los contadores en V
			always_ff @*
				begin
				h_count_siguiente = pixel_pos_clk ? 
									h_count_temp == H_TOTAL ? 0 : h_count_temp + 1
							 : h_count_temp;
				
				v_count_ssiguiente = pixel_pos_clk && h_count_temp == H_TOTAL ? 
									(v_count_temp == V_TOTAL ? 0 : v_count_temp + 1) 
							 : v_count_temp;
				end
		
        
        // senal hsync mantenido durante retrace horizontal
        assign hsync_siguiente = h_count_temp >= INICIO_H_RETRACE 
                            && h_count_temp <= FIN_H_RETRACE;
   
        // senal vsync mantenido durante retrace vertical
        assign vsync_siguiente = v_count_temp >= INICIO_V_RETRACE 
                            && v_count_temp <= FIN_V_RETRACE;

        // solo permite pintar cuando los contadores estan en la region de pantalla
        assign enable = (h_count_temp < H_PINTABLE) 
                           && (v_count_temp < V_PINTABLE);

        
        assign hsync  = hsync_reg;
        assign vsync  = vsync_temp;
        assign x      = h_count_temp;
        assign y      = v_count_temp;
        assign clk_out = pixel_pos_clk;
endmodule