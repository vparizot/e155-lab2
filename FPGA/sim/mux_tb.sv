`timescale 1ns/1ns

module mux_tb();
 // Set up test signals
	logic clk, reset;
	logic [3:0] s1, s2;
	logic selector;
	logic [3:0] sy;
	logic [3:0] sy_expected;


 // Instantiate the device under test
 mux dut(.s1(s1), .s2(s2), .selector(selector), .sy(sy));

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
   	s1 = 4'b0011;
	s2 = 4'b0101;
	selector = 1;
	sy_expected = 4'b0011;

	#100;

	s1 = 4'b0011;
	s2 = 4'b0101;
	selector = 0;
	sy_expected = 4'b0101;

	#100;
	
	s1 = 4'b1000;
	s2 = 4'b1111;
	selector = 0;
	sy_expected = 4'b1111;

	#100;

   	s1 = 4'b1111;
	s2 = 4'b1111;
	selector = 1;
	sy_expected = 4'b1111;

	#100;

	s1 = 4'b1111;
	s2 = 4'b1111;
	selector = 0;
	sy_expected = 4'b1111;

	#100;
	
	s1 = 4'b0001;
	s2 = 4'b0010;
	selector = 1;
	sy_expected = 4'b0001;

	
	
   end
endmodule