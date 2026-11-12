# Initial Samsung device matrix

This document records the first target devices and distinguishes published specifications from emulation work still required.

## Phase 1

| Device | Board identifier | Application SoC | CPU family | Display | Initial target |
|---|---|---|---|---|---|
| Galaxy Ace | GT-S5830 | Qualcomm MSM7227T (Snapdragon S1) | ARM11 / ARMv6-class | 320x480 | First board prototype |
| Galaxy W | GT-I8150 (Ancora) | Qualcomm MSM8255T (Snapdragon S2) | Scorpion / ARMv7-A | 480x800 | Second board prototype |

Reference material:
- Galaxy Ace: https://www.phonemore.com/specs/samsung/galaxy-ace/gt-s5830/
- Galaxy Ace historical hardware overview: https://www.mclibre.org/descargar/docs/revistas/tuxinfo/tuxinfo-41-es-201110.pdf
- Galaxy W: https://phonedb.net/index.php?c=samsung_gt-i8150_galaxy_w__samsung_ancora&id=3084&m=device
- Galaxy W specifications: https://www.gsmarena.com/samsung_i8150_galaxy_w-4158.php

## Phase 2

| Device | Board identifier | SoC family | Initial target |
|---|---|---|---|
| Galaxy S | GT-I9000 | Samsung Exynos 3110 / S5PC110 family | Research and board definition |
| Galaxy S II | GT-I9100 | Samsung Exynos 4210 | Research and board definition |
| Galaxy S III | GT-I9300 | Samsung Exynos 4412 | Research and board definition |

The Galaxy S family uses different SoC platforms from the Qualcomm-based Ace and W. Do not force them into the MSM7227/MSM8255 implementation.

## Emulation requirements

A QEMU machine profile is only the board-level entry point. It must eventually describe and connect the relevant SoC and board devices, including:

- CPU model and boot configuration.
- RAM layout and boot ROM/firmware loading.
- Interrupt controller and timers.
- UART/serial console for early boot diagnostics.
- GPIO and board buttons.
- Storage controller and flash/eMMC or NAND representation, as appropriate.
- Display, framebuffer, and input/touch path.
- USB, audio, networking, sensors, and other peripherals as later milestones.

Exact register maps, interrupt wiring, memory addresses, and boot protocol must be verified from device sources, kernel trees, bootloader documentation, or hardware research before implementation. Unknown values must remain explicitly marked as unknown rather than guessed.

## ROM policy

Firmware and proprietary images are user-provided local files. Keep them out of Git and document only the expected paths and formats.
