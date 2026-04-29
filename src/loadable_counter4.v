// Module: loadable_counter4
// Description: 4ビットカウンタ (4-bit Counter) with Load
//   - 4ビットのカウンタで、クロック信号に同期してカウントアップする順序回路
//   - レジスタを使用して現在のカウント値を保持し、クロックの立ち上がりでカウントアップする
//   - load信号が有効なときに、外部からの入力値をカウンタにロードすることができる
//   - 入力: clk (クロック), rst (リセット), load (ロード信号), data_in (ロードするデータ)
//   - 出力: count (4ビットのカウント値)

module loadable_counter4 (
    input wire clock, // クロック信号
    input wire reset_N, // リセット信号
    input wire load, // ロード信号
    input wire [3:0] data_in, // ロードするデータ
    output reg [3:0] count // 4ビットのカウント値
);
    // クロックの立ち上がりでカウントアップするか、ロードするかを制御する
    always @(posedge clock or negedge reset_N) begin
        if (!reset_N) begin
            count <= 4'b0000; // リセット時はカウントを0にする
        end else if (load) begin
            count <= data_in; // load信号が有効なときはdata_inをカウンタにロードする
        end else begin
            count <= count + 1; // クロックの立ち上がりでカウントアップする
        end
    end
endmodule