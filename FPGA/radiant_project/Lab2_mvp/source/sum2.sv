// Victoria Parizot
// vparizot@g.hmc.edu
// 9/6/2024

// descr: sums 4-bit signal s1 and s2 and outputs result in 5-bit led
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