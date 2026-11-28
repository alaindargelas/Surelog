// Built-in methods without parentheses (LRM 13.4.1) are method calls, not
// unresolved hierarchical references (was UH0725); a struct member with a
// method name, read through an array element, stays a member.
module top(output int o1, output int o2, output int o3, output int o4,
           output int o5);
  typedef enum logic [1:0] {A, B, C} e_t;
  typedef struct packed { logic [3:0] size; } s_t;
  e_t c1;
  int b [3] = '{1, 2, 3};
  int q[$];
  s_t arr [2];
  initial begin
    c1 = c1.first;
    o1 = c1.num;
    o2 = b.sum;
    o3 = b.product;
    q.push_back(1);
    o4 = q.pop_back;
  end
  assign o5 = arr[1].size;
endmodule
