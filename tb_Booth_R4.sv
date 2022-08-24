`timescale 1ns/1ps
module stimulus;

   logic [7:0] x_in;   
   logic [11:0] y_out;
   
   logic 	clk;
   
   integer 	 handle3;
   integer 	 i; 

   Booth_R4 dut (x_in,y_out);
   

   // 1 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end
	
	initial
     begin
	handle3 = $fopen("Booth_R4.out","w");
     end

   initial
     begin
		for(i=0; i<10; i=i+1)
		begin
			@(posedge clk)
			begin
				x_in = $random;
			end
			@(negedge clk)
			begin
				#0 $fdisplay(handle3, "%b || %b", 
						x_in, y_out);
			end	
		end
	$finish;
     end // initial begin   

endmodule // stimulus
