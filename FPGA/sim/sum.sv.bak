module sum (
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