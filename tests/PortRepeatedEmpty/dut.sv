// A port listed twice, and an empty port, are legal non-ANSI port lists
// (was CP0340 "Port of unspecified type").
module id(a, a);
  inout a;
endmodule
module gap(d1, , in, d2);
  input [7:0] in;
  output d1;
  output d2;
  assign d1 = in[0];
  assign d2 = in[1];
endmodule
module top;
endmodule
