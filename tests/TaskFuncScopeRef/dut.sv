// Variables named through a task or a function (was UH0725).
module top(output integer o, output integer p, output integer q);
  task ok;
    reg error;
    error = 1;
  endtask
  function integer fun1(input integer a);
    integer tmp;
    tmp = a;
    fun1 = tmp;
  endfunction
  initial begin : sub
    static integer i = 1;
  end
  always @* o = sub.i;
  always @* p = ok.error;
  always @* q = fun1.tmp;
endmodule
