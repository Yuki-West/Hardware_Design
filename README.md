# HW設計 — Verilog / SystemVerilog 学習環境

Verilog・SystemVerilog の回路設計を学習するための作業環境です。  
参考書の回路を記述し、Icarus Verilog でシミュレーション、TerosHDL で構文チェック・回路図表示を行います。

## ディレクトリ構成

```
HW設計/
├── src/           RTLソースコード (.v, .sv)
├── tb/            テストベンチ (tb_<モジュール名>.v)
├── sim/           シミュレーション出力 (VCDファイル等)
├── docs/          ドキュメント・メモ
├── sim.ps1        シミュレーション実行スクリプト
└── .vscode/       VS Code / TerosHDL 設定
```

## 必要なツール

| ツール | 用途 |
|---|---|
| [Icarus Verilog](http://iverilog.icarus.com/) | Verilog コンパイル・シミュレーション (`iverilog`, `vvp`) |
| [GTKWave](http://gtkwave.sourceforge.net/) | 波形ビューア |
| [VS Code](https://code.visualstudio.com/) + [TerosHDL](https://teroshdl.com/) | エディタ・リンター・回路図表示 |

## 使い方

### 1. 新しい回路を追加する

1. `src/` にモジュールを作成する（例: `src/full_adder.v`）
2. `tb/` にテストベンチを作成する（例: `tb/tb_full_adder.v`）

### 2. シミュレーションを実行する

```powershell
.\sim.ps1 <モジュール名>
```

例:

```powershell
.\sim.ps1 half_adder
```

コンパイル → シミュレーション実行 → 結果表示が一括で行われます。

### 3. 波形を確認する

シミュレーション後に VCD ファイルが `sim/` に生成されます。

```powershell
gtkwave sim\half_adder.vcd
```

## 命名規則

| 種類 | ファイル名 | 例 |
|---|---|---|
| ソース | `src/<モジュール名>.v` | `src/half_adder.v` |
| テストベンチ | `tb/tb_<モジュール名>.v` | `tb/tb_half_adder.v` |
| 波形出力 | `sim/<モジュール名>.vcd` | `sim/half_adder.vcd` |

## テストベンチの書き方

サンプル（`tb/tb_half_adder.v`）を参考にしてください。ポイント:

- **`$dumpfile` / `$dumpvars`** を記述しておくと VCD 波形が出力される
- **`check` タスク** で期待値と比較し PASS/FAIL を自動判定する
- 順序回路の場合はクロック生成を追加する:
  ```verilog
  reg clk = 0;
  always #5 clk = ~clk;  // 100MHz
  ```

## サンプル回路

| モジュール | 説明 |
|---|---|
| `half_adder` | 半加算器 — XOR で和、AND で桁上げを出力する基本組み合わせ回路 |
