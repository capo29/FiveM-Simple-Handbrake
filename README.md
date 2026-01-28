# Handbrake Script.

<img width="275" height="183" alt="image" src="https://github.com/user-attachments/assets/731de637-23e9-49dc-a1af-5d42cb0ad3b0" />


Simple handbrake toggle script for FiveM with a basic HUD indicator. Works with InteractSounds for audio.

## What it does

Adds a handbrake toggle to vehicles that shows a "P" (Park) or "D" (Drive) indicator on your screen. When you're in Park mode, the handbrake is engaged. When you're in Drive mode, it's disengaged.

The script also makes vehicles roll forward slightly when you exit them in Drive mode, which is a nice touch for realism.

## Installation

1. Drop the `handbrake` folder into your `resources` directory
2. Add `ensure handbrake` to your `server.cfg`
3. Make sure you have `InteractSounds` installed and running (for the park/drive sound effects)

## Controls

- Press **SPACEBAR** to toggle between Park and Drive modes

## Features

- Visual HUD indicator showing current mode (P in red, D in white)
- Speed check - you need to be going slower than ~6 mph to engage Park mode
- Audio feedback when switching modes (requires InteractSounds)
- Vehicles roll forward when you exit them in Drive mode

## Notes

- You need to be the driver to toggle the handbrake
- The script won't let you engage Park if you're moving too fast
- Make sure InteractSounds is running or the audio won't work (script will still function though)

