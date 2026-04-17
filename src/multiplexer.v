// =============================================================================
// Module: multiplexer
// Description: マルチプレクサ (Multiplexer)
//   - 複数の入力の中から1つを選択して出力する基本的な組み合わせ回路
//   - 入力: a, b, sel
//   - 出力: y
// =============================================================================

module multiplexer (
    input wire input_0,      // 入力a
    input wire input_1,      // 入力b
    input wire sel,    // 選択信号
    output wire y      // 出力y
);

    // selが0のときはinput_0を、selが1のときはinput_1を出力する
    assign y = (sel == 0) ? input_0 : input_1;

endmodule


module multiplexer4to1 (
    input wire [3:0] inputs, // 4つの入力
    input wire [1:0] sel,    // 2ビットの選択信号
    output wire y            // 出力y
);

    // selの値に応じて対応する入力を出力する
    assign y = (sel == 2'b00) ? inputs[0] :
               (sel == 2'b01) ? inputs[1] :
               (sel == 2'b10) ? inputs[2] :
                                inputs[3];

endmodule