// LRM 26.3: an EXPLICIT `import pkg::name;` makes `name` local to the scope,
// so it shadows the same name brought in by a WILDCARD import -- in EITHER
// order.  Both packages here declare OtpWidth (2 vs 16); every module must
// read macro_pkg's 16, and `Other` still comes from the wildcard.  Before the
// fix the module kept BOTH copies of OtpWidth and every lookup found the first
// one inserted, so `import reg_pkg::*; import macro_pkg::OtpWidth;` folded
// `32 / OtpWidth - 1` to 15 (opentitan otp_ctrl_dai: otp_size_o 2'b11 for 01).
package reg_pkg;
  parameter int OtpWidth = 2;
  parameter int Other = 5;
  typedef logic [OtpWidth-1:0] narrow_t;
endpackage
package macro_pkg;
  parameter int OtpWidth = 16;
  parameter int Unused = 7;
endpackage
// wildcard first, explicit second
module wild_then_explicit
  import reg_pkg::*;
  import macro_pkg::OtpWidth;
(
  output logic [1:0] size_o,
  output logic [7:0] other_o
);
  assign size_o = 2'(unsigned'(32 / OtpWidth - 1));   // 32/16-1 = 1
  assign other_o = Other;                              // 5
endmodule
// explicit first, wildcard second
module explicit_then_wild
  import macro_pkg::OtpWidth;
  import reg_pkg::*;
(
  output logic [1:0] size_o,
  output logic [7:0] other_o
);
  assign size_o = 2'(unsigned'(32 / OtpWidth - 1));   // 1
  assign other_o = Other;                              // 5
endmodule
// the explicit import names ONE item: nothing else of macro_pkg leaks in
module explicit_is_narrow
  import reg_pkg::*;
  import macro_pkg::OtpWidth;
(
  output logic [7:0] w_o
);
  assign w_o = OtpWidth;                               // 16
endmodule
module top (
  output logic [1:0] a_size, b_size,
  output logic [7:0] a_other, b_other, c_w
);
  wild_then_explicit a (.size_o(a_size), .other_o(a_other));
  explicit_then_wild b (.size_o(b_size), .other_o(b_other));
  explicit_is_narrow c (.w_o(c_w));
endmodule
