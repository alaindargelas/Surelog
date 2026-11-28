`default_nettype none
// foreach loop variables are declared by the foreach, not implicit nets
// (was EL0535 under `default_nettype none).
module top;
  reg [4:0] foo [0:3][0:7];
  initial begin
    foreach (foo[ia, ib]) foo[ia][ib] = ia + ib;
  end
endmodule
