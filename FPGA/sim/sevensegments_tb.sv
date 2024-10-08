// Victoria Parizot
// vparizot@g.hmc.edu
// 09/09/2024

// descr: testbench for sevensegment module of lab 2

`timescale 1ns/1ns

module sevensegments_tb();
 // Set up test signals
	logic clk;
	logic [3:0] sy;
	logic [6:0] segOut;
	logic [6:0] segOut_expected;


 // Instantiate the device under test
 sevensegments dut(.sy(sy), .segOut(segOut));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end
  
 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin

   	sy = 4'b0000;
	segOut_expected = ~7'b0100011;

	#100;

	sy = 4'b0001;
	segOut_expected = ~7'b1111001;

	#100;

	sy = 4'b0010;
	segOut_expected = ~7'b0100100;

	#100;

	sy = 4'b0011;
	segOut_expected = ~7'b0110000;

	#100;

	sy = 4'b0100;
	segOut_expected = ~7'b0011001;

	#100;

	sy = 4'b0101;
	segOut_expected = ~7'b0010010;

	#100;
	sy = 4'b0110;
	segOut_expected =~7'b0000010; 

	#100;
	sy = 4'b0111;
	segOut_expected = ~7'b1111000;

	#100;


	sy = 4'b1001;
	segOut_expected = ~7'b0011000;

	#100;

	
	
   end
endmodule
