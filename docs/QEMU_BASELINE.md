# QEMU ARM baseline

This milestone builds an unmodified upstream `qemu-system-arm` outside the SEMU
repository. SEMU keeps its hardware models and integration changes separate
from the upstream checkout.

## Pinned upstream version

- QEMU: **11.1.3**
- Upstream: https://gitlab.com/qemu-project/qemu
- Target: `arm-softmmu`
- Output: `qemu-system-arm`

The version is pinned so builds are reproducible. Upgrade it deliberately after
checking compatibility with SEMU's machine models.

## Fedora / WSL build dependencies

On Fedora, install the build tools and core development libraries:

```bash
sudo dnf install git gcc gcc-c++ make ninja-build python3 meson \
  pkgconf-pkg-config glib2-devel pixman-devel zlib-ng-compat-devel
```

If Fedora does not provide `zlib-ng-compat-devel` in the enabled repositories,
install the matching zlib development package instead.

## Build

From the SEMU repository root:

```bash
chmod +x scripts/build-qemu-linux.sh
./scripts/build-qemu-linux.sh
```

By default, the script creates two sibling directories:

- `../qemu-upstream/`: clean upstream QEMU source checkout.
- `../qemu-build-arm/`: configured build tree and resulting binary.

To use different locations:

```bash
SEMU_QEMU_SOURCE_DIR="$HOME/src/qemu-11.1.3" \
SEMU_QEMU_BUILD_DIR="$HOME/build/qemu-arm" \
  ./scripts/build-qemu-linux.sh
```

The script refuses to reuse a source directory that is not checked out at the
pinned tag. It does not modify or copy files into upstream QEMU.

## What this milestone proves

A successful build proves that the host can compile QEMU's ARM full-system
emulator. It does **not** prove Android can boot yet.

## Android 2.3.x compatibility work still required

The historical Android ARM emulator platform uses Goldfish virtual hardware.
A Gingerbread kernel built for Goldfish expects those devices and their
register interfaces. An arbitrary upstream ARM machine such as `versatilepb`
or `virt` is not a drop-in replacement.

The next SEMU milestone is to integrate the required Goldfish board/device
models with the pinned upstream QEMU build, then boot a matching Android 2.3.x
ARM image. Only after that reference boot works should we begin replacing the
reference board with the Galaxy Ace MSM7227T hardware model.

Do not label a generic ARM Linux boot as an Android boot.
