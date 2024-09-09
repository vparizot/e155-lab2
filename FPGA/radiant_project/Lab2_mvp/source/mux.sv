// Victoria Parizot
// vparizot@g.hmc.edu
// 9/6/2024
// This code was taken from Digital Design and Computer Architecture by Harris

// descr: selects s1 or s2 to output to sy depending on selector signal
module mux2 (
	input logic [3:0] s1, s2,
	input logic selector,
	output logic [3:0] sy);

	assign sy = selector? s1:s2;

endmodule