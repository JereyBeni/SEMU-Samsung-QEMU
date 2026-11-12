# SEMU-Samsung-QEMU

SEMU is a QEMU-based experimental emulator project for classic Samsung Galaxy devices, targeting Windows (WHPX) and Linux/WSL (KVM).

## Development order

1. **Galaxy Ace (GT-S5830)** — Qualcomm MSM7227T / ARM11 baseline.
2. **Galaxy W (GT-I8150)** — Qualcomm MSM8255T / Scorpion baseline.
3. **SEMU desktop application** — device library, per-device configuration, QEMU launch/stop, and logs.
4. **Galaxy S family** — Galaxy S (GT-I9000), Galaxy S II (GT-I9100), then Galaxy S III (GT-I9300).

The first milestone is hardware research and a bootable QEMU board skeleton. A registered machine is not considered working until its CPU, memory, interrupt/timer path, console, and boot flow are validated.

## Repository layout

- `hw/arm/samsung/` — Samsung/Qualcomm board and SoC models.
- `hw/arm/include/samsung/` — shared model declarations and register definitions.
- `roms/` — local firmware images (not committed).
- `scripts/` — build and launch helpers.
- `docs/` — hardware matrix, research notes, and milestones.

## Important

SEMU does not bundle Samsung firmware, bootloaders, Android system images, or proprietary device assets. Configure locally obtained images through the device profiles. Hardware support is incremental and experimental; do not assume that a profile can boot Android until its milestone says so.
