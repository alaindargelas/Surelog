// A port read in a constant expression is reported in a module DEFINITION
// too (the port's net carries no typespec there), without -elabuhdm.
module top(input wire [2:0] N, input wire [7:0] In, output wire [7:0] o);
  wire [7:0] A [1:0];
  assign A[0][7:1] = In[7:N];   // UH0734 N
  assign o = A[0];
endmodule
