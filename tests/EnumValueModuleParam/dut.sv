// An enum value may read a module parameter (was EL0514); a genuinely
// undeclared name in an enum value is still reported.
module top(output int o1, output int o2, output int o3);
  localparam S = 2;
  parameter P = 5;
  enum logic [3:0] { A = S + 1, B } e1;
  typedef enum logic [3:0] { C = S, D = P } e_t;
  e_t e2;
  typedef enum logic [3:0] { E = NOPE } bad_t;   // EL0514 NOPE
  assign o1 = B;
  assign o2 = D;
  assign o3 = A;
endmodule
