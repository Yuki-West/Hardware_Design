// =============================================================================
// Module: Counter4
// Description: 4ビットカウンタ (4-bit Counter)
//   - 4ビットのカウンタで、クロック信号に同期してカウントアップする順序回路
//   - レジスタを使用して現在のカウント値を保持し、クロックの立ち上がりでカウントアップする
//   - 入力: clk (クロック), rst (リセット) 
//   - 出力: count (4ビットのカウント値)
//
// Module: Counter4_with_enable
// Description: 4ビットカウンタ (4-bit Counter) with Enable
//   - 4ビットのカウンタで、クロック信号に同期してカウントアップする順序回路
//   - レジスタを使用して現在のカウント値を保持し、クロックの立ち上がりでカウントアップする
//   - enable信号が有効なときのみカウントアップする
//   - 入力: clk (クロック), rst (リセット), enable (カウント有効信号)
//   - 出力: count (4ビットのカウント値)
//
// Module: CountdownCounter4_with_enable
// Description: 4ビットカウントダウンカウンタ (4-bit Countdown Counter) with Enable
//   - 4ビットのカウンタで、クロック信号に同期してカウントダウンする順序回路
//   - レジスタを使用して現在のカウント値を保持し、クロックの立ち上がりでカウントダウンする
//   - enable信号が有効なときのみカウントダウンする
//   - 入力: clk (クロック), rst (リセット), enable (カウント有効信号)
//   - 出力: count (4ビットのカウント値)
// =============================================================================
module counter4 (
    input wire clock, // クロック信号
    input wire reset_N, // リセット信号
    output reg [3:0] count // 4ビットのカウント値
);
    // クロックの立ち上がりでカウントアップする
    always @(posedge clock or negedge reset_N) begin
        if (!reset_N) begin
            count <= 4'b0000; // リセット時はカウントを0にする
        end else begin
            count <= count + 1; // クロックの立ち上がりでカウントアップする
        end
    end
endmodule

module counter4_with_enable (
    input wire clock, // クロック信号
    input wire reset_N, // リセット信号
    input wire enable, // カウント有効信号
    output reg [3:0] count // 4ビットのカウント値
);
    // クロックの立ち上がりでカウントアップする
    always @(posedge clock or negedge reset_N) begin
        if (!reset_N) begin
            count <= 4'b0000; // リセット時はカウントを0にする
        end else if (enable) begin
            count <= count + 1; // クロックの立ち上がりでカウントアップする
        end
    end
endmodule

module countdown_counter4_with_enable (
    input wire clock, // クロック信号
    input wire reset_N, // リセット信号
    input wire enable, // カウント有効信号
    output reg [3:0] count // 4ビットのカウント値
);
    // クロックの立ち上がりでカウントダウンする
    always @(posedge clock or negedge reset_N) begin
        if (!reset_N) begin
            count <= 4'b1111; // リセット時はカウントを15にする
        end else if (enable) begin
            count <= count - 1; // クロックの立ち上がりでカウントダウンする
        end
    end
endmodule