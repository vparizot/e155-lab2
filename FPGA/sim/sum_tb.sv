// Victoria Parizot
// vparizot@g.hmc.edu
// 09/09/2024

// descr: testbench for sum module of lab 2

`timescale 1ns/1ns

module sum_tb();
 // Set up test signals
	logic clk, reset;
	logic [3:0] s1, s2;
	logic [4:0] led;
	logic [4:0] led_expected;


 // Instantiate the device under test
 sum dut(.s1(s1), .s2(s2), .led(led));

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
   	s1 = 4'b0000;
	s2 = 4'b0000;
	led_expected = 5'b00000;

	#100;

	s1 = 4'b0001;
	s2 = 4'b0000;
	led_expected = 5'b00001;

	#100;
	
	s1 = 4'b1111;
	s2 = 4'b1111;
	led_expected = 5'b11110;

	#100;

	s1 = 4'b0101;
	s2 = 4'b0101;
	led_expected = 5'b01010;

	#100;

	s1 = 4'b1000;
	s2 = 4'b0000;
	led_expected = 5'b10000;

	#100;
	
	s1 = 4'b1000;
	s2 = 4'b1000;
	led_expected = 5'b10000;

	#100;

	s1 = 4'b0100;
	s2 = 4'b0010;
	led_expected = 5'b00110;

	#100;

	
   end
endmodule