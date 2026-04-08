// =============================================================================
// Module: half_adder
// Description: 半加算器 (Half Adder)
//   - 1ビットの加算を行う基本的な組み合わせ回路
//   - 入力: a, b
//   - 出力: sum (和), carry (桁上げ)
// =============================================================================
module half_adder (
    input  wire a,
    input  wire b,
    output wire sum,
    output wire carry
);

    assign sum   = a ^ b;   // XOR
    assign carry = a & b;   // AND

endmodule
