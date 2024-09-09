
`timescale 1ns/1ns
`default_nettype none
`define N_TV 3

module labtwo_tb();
 // Set up test signals
 logic clk, reset;
 logic [3:0] s1;
 logic [3:0] s2;
 logic [4:0] led;
 logic [6:0] segOut;
 logic [4:0] led_expected;
 logic [6:0] segOut_expected;
 logic selector, selector2, selector_expected, selector2_expected;

 
 logic [31:0] vectornum, errors;
 logic [22:0] testvectors[10000:0]; // Vectors of format s1[3:0]_s2[3:0]_selector_selector2_led[4:0]_segOut[6:0]

 // Instantiate the device under test
 top dut(.s1(s1), .s2(s2), .clk(clk), .selector(selector), .selector2(selector2), .led(led), .segOut(segOut));

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
     $readmemb("labtwo.tv", testvectors, 0, `N_TV - 1);
     vectornum = 0; errors = 0;
     reset = 1; #28; reset = 0;
   end
  // Apply test vector on the rising edge of clk
 always @(posedge clk)
   begin
       #1; {s1, s2, selector, selector2, led_expected, segOut_expected} = testvectors[vectornum];
   end
  initial
 begin
   // Create dumpfile for signals
   $dumpfile("labtwo_tb.vcd");
   $dumpvars(0, labtwo_tb);
 end
  // Check results on the falling edge of clk
 always @(negedge clk)
   begin
     if (~reset) // skip during reset
       begin
         if (segOut != segOut_expected || led != led_expected)
           begin
             $display("Error: inputs: s1 = %b, s2 = %b, selector = %b, selector2 = %b", s1, s2, selector, selector2);
             $display(" outputs: led = %b (%b expected), segOut=%b (%b expected)", led, led_expected, segOut, segOut_expected);
             errors = errors + 1;
           end

      
       vectornum = vectornum + 1;
      
       if (testvectors[vectornum] === 11'bx)
         begin
           $display("%d tests completed with %d errors.", vectornum, errors);
           $finish;
         end
     end
   end
endmodule
