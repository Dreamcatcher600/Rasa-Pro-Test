$ErrorActionPreference = "Stop"

if (-not $env:RASA_LICENSE) {
    throw "Set RASA_LICENSE before running this script."
}

if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    throw "uv is not installed. See https://docs.astral.sh/uv/getting-started/installation/"
}

if (Test-Path "appointment-assistant") {
    throw "The appointment-assistant directory already exists. Rename or remove it first."
}

New-Item -ItemType Directory -Path "appointment-assistant" | Out-Null
Push-Location "appointment-assistant"
uv venv --python 3.11
& .\.venv\Scripts\Activate.ps1
uv pip install rasa-pro
rasa init --no-prompt --template tutorial
Pop-Location

Copy-Item "template\domain.yml" "appointment-assistant\domain.yml" -Force
Copy-Item "template\data\flows.yml" "appointment-assistant\data\flows.yml" -Force

Write-Host "Project created in appointment-assistant"
Write-Host "Next: cd appointment-assistant; rasa train; rasa inspect"
