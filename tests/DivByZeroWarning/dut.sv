// Division by zero is x (integer) or Inf (real), not an error: UH0722 is a
// warning (LRM 11.4.2).
module top(output int o);
  parameter offset = 10/0;
  parameter real pinf = 1.0/0.0;
  assign o = offset;
endmodule
