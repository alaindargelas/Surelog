// A variable of a TYPE PARAMETER type declared in a disabled generate branch
// parses as a net declaration; it must still be declared in the module
// definition, or the statements using it report UH0737 (CVA6 hpdcache_memctrl).
package p;
  typedef struct packed { bit eccEn; int ways; } u_t;
  typedef struct packed { u_t u; } cfg_t;
endpackage
module m import p::*; #(parameter cfg_t C = '0, parameter type row_t = logic [3:0])
  (input logic clk, input logic [3:0] a, output logic [3:0] o);
  if (C.u.eccEn) begin : g
    row_t q;
    always_ff @(posedge clk) q <= a;
    always_comb begin : c
      for (int w = 0; w < 4; w++) o[w] = q[w];
    end
  end else begin : g2
    assign o = '0;
  end
endmodule
module top import p::*; (input logic clk, input logic [3:0] a, output logic [3:0] o);
  localparam cfg_t C = '{u: '{eccEn: 1'b0, ways: 4}};
  m #(.C(C)) u (.*);
endmodule
