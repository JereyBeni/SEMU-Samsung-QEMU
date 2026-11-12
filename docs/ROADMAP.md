# SEMU milestones

## M0 — Repository and hardware definition
- [x] Establish the Samsung ARM source layout.
- [x] Record target device order and SoC separation.
- [ ] Verify the exact QEMU base revision and build integration point.
- [ ] Collect reliable memory maps, interrupt maps, and boot requirements for GT-S5830 and GT-I8150.

## M1 — Galaxy Ace (GT-S5830)
- [ ] Define the MSM7227T/ARM11 board model.
- [ ] Implement CPU, RAM, interrupt controller, timer, and UART path.
- [ ] Add a minimal firmware/boot-image loader.
- [ ] Build and run a serial-only smoke test.
- [ ] Validate against a known boot log before claiming Android boot support.

## M2 — Galaxy W (GT-I8150)
- [ ] Define the MSM8255T/Scorpion board model separately.
- [ ] Implement its CPU, RAM, interrupt/timer, and UART path.
- [ ] Add firmware loading and serial smoke tests.
- [ ] Validate boot behavior independently of the Ace.

## M3 — SEMU application
- [ ] Device library and device metadata.
- [ ] Create/edit device configuration.
- [ ] Detect QEMU executable and acceleration availability (WHPX/KVM).
- [ ] Launch/stop process and stream serial/log output.
- [ ] Store local firmware paths without copying firmware into the repository.

## M4 — Samsung Galaxy S family
- [ ] Galaxy S (GT-I9000 / S5PC110 family).
- [ ] Galaxy S II (GT-I9100 / Exynos 4210).
- [ ] Galaxy S III (GT-I9300 / Exynos 4412).

## Definition of done
A device is not marked supported merely because its QEMU machine type registers or its window opens. The CPU must execute the intended boot path, the serial output must be captured, and the result must be reproducible with documented firmware inputs.
