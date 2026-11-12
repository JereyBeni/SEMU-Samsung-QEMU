# SEMU-Samsung-QEMU

SEMU is a QEMU-based experimental emulator project for classic Samsung Galaxy devices, targeting Windows (WHPX) and Linux/WSL (KVM).

## Current development target

The first executable milestone is to build upstream QEMU's ARM system emulator, then integrate the Goldfish virtual hardware required by a reference Android 2.3.x ARM image. This gives SEMU a known Android boot target before we implement Samsung-specific hardware.

See [QEMU ARM baseline](docs/QEMU_BASELINE.md) for the pinned upstream version and build instructions.

## Development order

1. **QEMU ARM baseline + Android reference boot** — build `qemu-system-arm`, integrate compatible Goldfish hardware, and boot a matching Android 2.3.x ARM image.
2. **Galaxy Ace (GT-S5830)** — Qualcomm MSM7227T / ARM11 board and SoC model.
3. **Galaxy W (GT-I8150)** — Qualcomm MSM8255T / Scorpion board and SoC model.
4. **SEMU desktop application** — device library, per-device configuration, QEMU launch/stop, and logs.
5. **Galaxy S family** — Galaxy S (GT-I9000), Galaxy S II (GT-I9100), then Galaxy S III (GT-I9300).

A registered machine is not considered working until its CPU, memory, interrupt/timer path, console, and boot flow are validated. A generic ARM Linux boot is not counted as an Android boot.

## Repository layout

- `hw/arm/samsung/` — Samsung/Qualcomm board and SoC models.
- `hw/arm/include/samsung/` — shared model declarations and register definitions.
- `roms/` — local firmware and Android images (not committed).
- `scripts/` — build and launch helpers.
- `docs/` — hardware matrix, research notes, and milestones.

## Important

SEMU does not bundle Samsung firmware, bootloaders, Android system images, or proprietary device assets. Configure locally obtained images through the device profiles. Hardware support is incremental and experimental; do not assume that a profile can boot Android until its milestone says so.
