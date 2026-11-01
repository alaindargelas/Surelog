// A sized literal's signedness is its OWN: `2'b11` is unsigned (3), `2'sb11`
// is signed (-1), whatever type the parameter it initialises has.  Each `o*`
// must read the value in its comment; before the fix every unsigned binary
// literal whose MSB was set came out as -1 (the parameter's `int` typespec
// was read back as "the constant is signed" by adjustSize).
parameter int unit_foo = 1'b1;                    // 1 (was -1)
module test(output int o1, o2, o3, o4, o5, o6, o7, o8,
            output logic [31:0] o9, output byte o10);
  parameter int    p_1b1   = 1'b1;                 // 1   (was -1)
  parameter int    p_2b11  = 2'b11;                // 3   (was -1)
  parameter int    p_4b1111 = 4'b1111;             // 15  (was -1)
  parameter int    p_2b01  = 2'b01;                // 1
  parameter int    p_sb1   = 1'sb1;                // -1  (signed literal)
  parameter int    p_4sb1111 = 4'sb1111;           // -1  (signed literal)
  parameter int    p_8h88  = 8'h88;                // 136
  parameter        p_untyped = 1'b1;               // 1   (was -1)
  parameter logic [31:0] p_logic = 1'b1;           // 1
  parameter byte   p_byte  = 2'b11;                // 3
  assign o1 = p_1b1;
  assign o2 = p_2b11;
  assign o3 = p_4b1111;
  assign o4 = p_2b01;
  assign o5 = p_sb1;
  assign o6 = p_4sb1111;
  assign o7 = p_8h88;
  assign o8 = unit_foo + p_untyped;                // 2
  assign o9 = p_logic;
  assign o10 = p_byte;
endmodule
