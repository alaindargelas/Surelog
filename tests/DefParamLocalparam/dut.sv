// A defparam whose value is a LOCALPARAM of the instantiating module, and a
// child parameter whose default depends on the defparam'd one.
// Expected: c2.Width = 5, c3.Width = 3, c1.Set = 4, c2.Set = 5.
module child(o);
  parameter Width = 32, Set = Width;
  output [7:0] o;
  assign o = Set;
endmodule
module top(o1, o2, o3);
  parameter P = 3;
  localparam L = P + 2;
  output [7:0] o1, o2, o3;
  child c1(.o(o1));
  defparam c1.Width = 4;
  child c2(.o(o2));
  defparam c2.Width = L;
  child c3(.o(o3));
  defparam c3.Width = P;
endmodule
