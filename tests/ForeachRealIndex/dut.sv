// A foreach loop variable over a `real` array is an integer index, not a
// real used as a bit select (was UH0714).
module top();
  function automatic real real_sum (input real driver[]);
    real_sum = 0.0;
    foreach (driver[i])
      real_sum += driver[i];
  endfunction
endmodule
