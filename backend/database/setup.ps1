param(
    [string]$Database = "learnit",
    [string]$PsqlPath = "C:\Program Files\PostgreSQL\17\bin\psql.exe"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $PsqlPath)) {
    throw "psql.exe tidak ditemukan. Sesuaikan parameter PsqlPath."
}

Write-Host "Membuat struktur database..."
& $PsqlPath -U postgres -d $Database -v ON_ERROR_STOP=1 -f "$PSScriptRoot\schema.sql"

if ($LASTEXITCODE -ne 0) {
    throw "Gagal menjalankan schema.sql"
}

Write-Host "Memasukkan data awal..."
& $PsqlPath -U postgres -d $Database -v ON_ERROR_STOP=1 -f "$PSScriptRoot\seed.sql"

if ($LASTEXITCODE -ne 0) {
    throw "Gagal menjalankan seed.sql"
}

Write-Host "Database LearnIT berhasil disiapkan!"
