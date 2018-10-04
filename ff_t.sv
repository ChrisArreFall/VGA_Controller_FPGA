module ff_t(output logic q,
				input logic t,clk,s);
    initial 
     begin 
      q=s;
     end
    always_ff @ (posedge clk)
    begin
        if (t==1'b0) 
			  begin 
				q<=q; 
			  end
        else 
			  begin 
				q<=~q;  
			  end
    end
endmodule