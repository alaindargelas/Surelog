// Under -nobuiltin a system call in a class method is not undefined
// (was CP0333): with no builtin `system` class there is nothing to check it
// against, so even an unknown one is accepted in this mode.
class c;
  local int x;
  function void f();
    $display("%0d", x);
  endfunction
  function void g();
    $foo_bar(1);
  endfunction
endclass
module top;
  initial begin
    c o = new;
    o.f();
  end
endmodule
