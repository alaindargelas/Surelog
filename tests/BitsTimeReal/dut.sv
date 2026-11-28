// `$bits(time)` (was UH0700) is 64.
module top(output int o1, output int o2);
  time t;
  assign o1 = $bits(time);
  assign o2 = $bits(t);
endmodule
