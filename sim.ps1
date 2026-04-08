<# 
  Verilog シミュレーション実行スクリプト
  使い方: .\sim.ps1 <モジュール名>
  例:     .\sim.ps1 half_adder
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$ModuleName
)

$SrcFile = "src\$ModuleName.v"
$TbFile  = "tb\tb_$ModuleName.v"
$OutFile = "sim\tb_$ModuleName"

# ファイル存在チェック
if (-not (Test-Path $SrcFile)) { Write-Error "Source not found: $SrcFile"; exit 1 }
if (-not (Test-Path $TbFile))  { Write-Error "Testbench not found: $TbFile"; exit 1 }

# sim ディレクトリ確認
if (-not (Test-Path "sim")) { New-Item -ItemType Directory -Path "sim" | Out-Null }

Write-Host "=== Compiling ===" -ForegroundColor Cyan
iverilog -o $OutFile $SrcFile $TbFile
if ($LASTEXITCODE -ne 0) { Write-Error "Compilation failed."; exit 1 }

Write-Host "=== Running Simulation ===" -ForegroundColor Cyan
vvp $OutFile
if ($LASTEXITCODE -ne 0) { Write-Error "Simulation failed."; exit 1 }

$VcdFile = "sim\$ModuleName.vcd"
if (Test-Path $VcdFile) {
    Write-Host ""
    Write-Host "波形ファイル生成: $VcdFile" -ForegroundColor Green
    Write-Host "GTKWaveで開く: gtkwave $VcdFile" -ForegroundColor Yellow
}

Write-Host "`n=== Done ===" -ForegroundColor Cyan
