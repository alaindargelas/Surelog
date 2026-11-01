// An element select of a PACKAGE-qualified packed table must fold to the
// element, not to a bit of the packed value: `sbox::T[4'd10]` on a
// `logic [15:0][3:0]` table is element 10 (4'hF), and `T[1]` is 4'h5.
// Before the fix both folded to ONE bit (bit 10 = 1'b1, bit 1 = 1'b0) because
// getParamTypespec never looked in the package for the table's declared type.
package sbox;
  parameter logic [15:0][3:0] T = {4'h2, 4'h1, 4'h7, 4'h4, 4'h8, 4'hF, 4'hE, 4'h3,
                                   4'hD, 4'hA, 4'h0, 4'h9, 4'hB, 4'h6, 4'h5, 4'hC};
endpackage
module top(output logic [3:0] o10, o1, o15, o0);
  assign o10 = sbox::T[4'd10];   // 4'hF
  assign o1  = sbox::T[1];       // 4'h5
  assign o15 = sbox::T[15];      // 4'h2
  assign o0  = sbox::T[0];       // 4'hC
endmodule
