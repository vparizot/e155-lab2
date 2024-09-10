`timescale 1ns/1ns

module hsoscEnable_tb();
 // Set up test signals
	logic clk;
	logic selector;



 // Instantiate the device under test
 hsoscEnable dut(.clk(clk), .selector(selector));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #1;
     clk = 0; #1;
   end
  
 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin
   	
	
   end
endmodule
