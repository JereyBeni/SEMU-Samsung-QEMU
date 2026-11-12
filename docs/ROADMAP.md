# SEMU milestones

## M0 — Repository and hardware definition
- [x] Establish the Samsung ARM source layout.
- [x] Record target device order and SoC separation.
- [x] Pin the initial upstream QEMU baseline (11.1.3).
- [x] Add a reproducible Linux ARM-system-emulator build script.
- [ ] Verify the upstream QEMU build on the development host.
- [ ] Collect reliable memory maps, interrupt maps, and boot requirements for GT-S5830 and GT-I8150.

## M1 — Android 2.3.x reference boot
- [ ] Build upstream `qemu-system-arm` for `arm-softmmu`.
- [ ] Integrate the Goldfish virtual board/devices needed by a matching Android Gingerbread ARM kernel.
- [ ] Prepare a legally obtained, compatible Android 2.3.x ARM system image and kernel locally.
- [ ] Boot through the Android boot animation and reach the launcher.
- [ ] Document the exact image, kernel, machine, and command-line requirements.

## M2 — Galaxy Ace (GT-S5830)
- [ ] Define the MSM7227T/ARM11 board model.
- [ ] Implement CPU, RAM, interrupt controller, timer, and UART path.
- [ ] Add a minimal firmware/boot-image loader.
- [ ] Build and run a serial-only smoke test.
- [ ] Validate against a known boot log before claiming Android boot support.

## M3 — Galaxy W (GT-I8150)
- [ ] Define the MSM8255T/Scorpion board model separately.
- [ ] Implement its CPU, RAM, interrupt/timer, and UART path.
- [ ] Add firmware loading and serial smoke tests.
- [ ] Validate boot behavior independently of the Ace.

## M4 — SEMU application
- [ ] Device library and device metadata.
- [ ] Create/edit device configuration.
- [ ] Detect QEMU executable and acceleration availability (WHPX/KVM).
- [ ] Launch/stop process and stream serial/log output.
- [ ] Store local firmware paths without copying firmware into the repository.

## M5 — Samsung Galaxy S family
- [ ] Galaxy S (GT-I9000 / S5PC110 family).
- [ ] Galaxy S II (GT-I9100 / Exynos 4210).
- [ ] Galaxy S III (GT-I9300 / Exynos 4412).

## Definition of done
A device is not marked supported merely because its QEMU machine type registers or its window opens. The CPU must execute the intended boot path, the serial output must be captured, and the result must be reproducible with documented firmware inputs.
