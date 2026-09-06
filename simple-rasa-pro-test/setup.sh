#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${RASA_LICENSE:-}" ]]; then
  echo "Set RASA_LICENSE before running this script." >&2
  exit 1
fi

if ! command -v uv >/dev/null 2>&1; then
  echo "uv is not installed. See https://docs.astral.sh/uv/getting-started/installation/" >&2
  exit 1
fi

if [[ -e "appointment-assistant" ]]; then
  echo "The appointment-assistant directory already exists. Rename or remove it first." >&2
  exit 1
fi

mkdir appointment-assistant
cd appointment-assistant
uv venv --python 3.11
source .venv/bin/activate
uv pip install rasa-pro
rasa init --no-prompt --template tutorial
cd ..

cp template/domain.yml appointment-assistant/domain.yml
cp template/data/flows.yml appointment-assistant/data/flows.yml

echo "Project created in appointment-assistant"
echo "Next: cd appointment-assistant && rasa train && rasa inspect"
