// LRM 23.2.2.1: one direction declaration and at most one net/variable
// declaration per non-ANSI port; a typed direction declaration is complete.
module dup_dir(x);        // CP0346
  input x;
  input x;
endmodule
module dup_body(x);       // CP0346
  input x;
  wire x;
  reg x;
endmodule
module typed_dir(x);      // CP0346
  input integer x;
  wire x;
endmodule
module body_first(x);     // CP0346
  real x;
  output integer x;
endmodule
module legal(a, b, c);    // legal completions: no error
  input a;
  wire a;
  output [3:0] b;
  reg [3:0] b;
  output c;
  real c;
endmodule
module task_dup;          // CP0346
  task t;
    input x;
    input x;
  endtask
endmodule
module top;
endmodule
