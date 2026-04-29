// =============================================================================
// Module: adder4
// Description: 4ビット加算器 (4-bit Adder)
//   - 4ビットの加算を行う基本的な組み合わせ回路
//   - 入力: a, b
//   - 出力: sum (和), carry (桁上げ)
// =============================================================================

module adder4 (
    input  wire [3:0] a, // 4ビットの入力a
    input  wire [3:0] b, // 4ビットの入力b
    output wire [3:0] sum, // 4ビットの出力sum
    output wire carry // 桁上げ出力
);

    wire [0:4] result; // 各ビットの加算結果とキャリーを格納するワイヤ

    assign result[4:0] = a + b; // 4ビットの加算を行う
    assign sum = result[3:0]; // 和の出力
    assign carry = result[4]; // 桁上げ出力
    
endmodule