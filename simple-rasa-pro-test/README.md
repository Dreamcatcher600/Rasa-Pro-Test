# Simple Rasa Pro Test Project

This creates a very small Rasa Pro CALM assistant for booking an appointment.
It asks for a service and preferred date, asks for confirmation, and then
returns either a booking confirmation or a cancellation message.

## Prerequisites

- A Rasa Developer Edition license key
- `uv` installed
- Python 3.11 (the setup command lets `uv` install it when needed)

## Windows PowerShell

```powershell
$env:RASA_LICENSE="YOUR_LICENSE_KEY"
./setup-windows.ps1
cd appointment-assistant
rasa train
rasa inspect
```

If PowerShell blocks the script, run it once with:

```powershell
powershell -ExecutionPolicy Bypass -File ./setup-windows.ps1
```

## macOS or Linux

```bash
export RASA_LICENSE="YOUR_LICENSE_KEY"
chmod +x setup.sh
./setup.sh
cd appointment-assistant
rasa train
rasa inspect
```

The setup script uses Rasa's official `tutorial` template first, so the
generated `config.yml` stays compatible with the installed Rasa Pro version.
It then replaces only `domain.yml` and `data/flows.yml` with this example.

## Try these messages

- `I want to book an appointment`
- `Haircut`
- `Tomorrow`
- `Yes`

Also test cancellation by answering `No` at the confirmation step.

## Important

This is a test-only project. It does not save appointments to a database or
call an external API.
