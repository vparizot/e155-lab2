// Victoria Parizot
// vparizot@g.hmc.edu
// 09/06/2024

// descr: top module for lab 2, calls sub modules for multiplexed display
module top(
	input logic [3:0] s1, s2,
	output logic [6:0] segOut,
	output logic [4:0] led,
	output logic selector, selector2
);

// define middle variables
logic [3:0] sy = 0;

//oscilate selector variable
hsoscEnable m1(selector); // create selector signal
 
// deliver sy
mux2 m2(s1, s2, selector, sy);

// pass sy to read into hex output
sevensegments m3(sy, segOut);

// call led sum
sum2 m4(s1, s2, led);

assign selector2 = ~selector; 

endmodule