// =============================================================================
// Testbench: tb_half_adder
// Description: 半加算器のテストベンチ
//   - 全入力パターン (00, 01, 10, 11) を網羅的にテスト
//   - 期待値と比較して PASS/FAIL を自動判定
// =============================================================================
`timescale 1ns / 1ps

module tb_half_adder;

    // --- 信号宣言 ---
    reg  a, b;
    wire sum, carry;

    // --- テスト対象モジュール (DUT) のインスタンス化 ---
    half_adder dut (
        .a     (a),
        .b     (b),
        .sum   (sum),
        .carry (carry)
    );

    // --- テスト用変数 ---
    integer pass_count = 0;
    integer fail_count = 0;

    // --- 検証タスク ---
    task check;
        input exp_sum, exp_carry;
        begin
            #10;  // 伝搬遅延待ち
            if (sum === exp_sum && carry === exp_carry) begin
                $display("PASS: a=%b b=%b -> sum=%b carry=%b", a, b, sum, carry);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL: a=%b b=%b -> sum=%b carry=%b (expected sum=%b carry=%b)",
                         a, b, sum, carry, exp_sum, exp_carry);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // --- 波形ダンプ (GTKWave用) ---
    initial begin
        $dumpfile("sim/half_adder.vcd");
        $dumpvars(0, tb_half_adder);
    end

    // --- テストシナリオ ---
    initial begin
        $display("===== Half Adder Test Start =====");

        // パターン1: 0 + 0 = 0, carry = 0
        a = 0; b = 0;
        check(0, 0);

        // パターン2: 0 + 1 = 1, carry = 0
        a = 0; b = 1;
        check(1, 0);

        // パターン3: 1 + 0 = 1, carry = 0
        a = 1; b = 0;
        check(1, 0);

        // パターン4: 1 + 1 = 0, carry = 1
        a = 1; b = 1;
        check(0, 1);

        // --- 結果サマリー ---
        $display("===== Half Adder Test End =====");
        $display("Result: %0d PASSED, %0d FAILED", pass_count, fail_count);

        if (fail_count == 0)
            $display("*** ALL TESTS PASSED ***");
        else
            $display("*** SOME TESTS FAILED ***");

        $finish;
    end

endmodule
