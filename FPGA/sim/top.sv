// Victoria Parizot
// vparizot@g.hmc.edu
// 09/06/2024

// descr: top module for lab 2, calls sub modules for multiplexed display

module top(
	input logic [3:0] s1, s2,
	input logic clk,
	output logic [6:0] segOut,
	output logic [4:0] led,
	output logic selector, selector2
);

// define middle variables
logic [3:0] sy = 0;

//oscilate selector variable
hsoscEnable m1(clk, selector); // create selector signal
 
// deliver sy
mux2 m2(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m3(sy, segOut);

// call led sum
sum2 m4(s1, s2, led);

assign selector2 = ~selector; 

endmodule

module hsoscEnable(
	input logic clk,
	output logic selector);

// variables
	//logic int_osc;
	logic pulse;
	logic led_state = 0;
	logic [24:0] counter = 0;
	
// Internal high-speed oscillator
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
// Simple clock divider
	always_ff @(posedge clk)
	begin
		counter <= counter + 1;
		// at hz
		if (counter == 10000)
		begin
			counter <= 0;
			if (selector == 0) selector <= 1 ; // turn on LED if off
			else selector <= 0; //turn OFF led
		end
	end


endmodule


module mux2 (
	input logic [3:0] s1, s2,
	input logic selector,
	output logic [3:0] sy);

	assign sy = selector? s1:s2;

endmodule

module sevensegments(
	input logic [3:0] sy,
	output logic [6:0] segOut);
// takes in dipswitch as 4 digit binary value and 
// outputs hexidecimal value on seven segment display

always_comb
	begin
		case (sy) 
			4'b0000 : segOut = ~7'b0100011; //1100010; 
			4'b0001 : segOut = ~7'b1111001; //b1111001;
			4'b0010 : segOut = ~7'b0100100; //b0010010;
			4'b0011 : segOut = ~7'b0110000; //b0000110;
			4'b0100 : segOut = ~7'b0011001; //b1001100;
			4'b0101 : segOut = ~7'b0010010; //b0100100;
			4'b0110 : segOut = ~7'b0000010; //b0100000;
			4'b0111 : segOut = ~7'b1111000; //b0001111;
			4'b1000 : segOut = ~7'b0000000; //b0000000;
			4'b1001 : segOut = ~7'b0011000; //b0001100;
			4'b1010 : segOut = ~7'b0100000; //b0000010;
			4'b1011 : segOut = ~7'b0000011; //b1100000;
			4'b1100 : segOut = ~7'b1000110; //b0110001;
			4'b1101 : segOut = ~7'b0100001; //b1100010;
			4'b1110 : segOut = ~7'b0000100; //b0010000;
			4'b1111 : segOut = ~7'b0001110; //b0111000;
			default: segOut = 7'b1111111;
		endcase
	end
endmodule

module sum2 (
	input logic [3:0] s1, s2,
	output logic [4:0] led);
	
	// define internal variable
	logic [4:0] sum;
	
	// comb logic
	always_comb
	begin
			sum = s1+s2;
	end
	
	
	assign led = sum;

endmodule