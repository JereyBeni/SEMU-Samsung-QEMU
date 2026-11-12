#!/usr/bin/env bash
set -euo pipefail

# Build a clean upstream QEMU ARM system emulator beside the SEMU checkout.
# The upstream source is deliberately kept outside this repository.

QEMU_VERSION="11.1.3"
QEMU_TAG="v${QEMU_VERSION}"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SEMU_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

QEMU_SOURCE_DIR="${SEMU_QEMU_SOURCE_DIR:-"${SEMU_ROOT}/../qemu-upstream"}"
QEMU_BUILD_DIR="${SEMU_QEMU_BUILD_DIR:-"${SEMU_ROOT}/../qemu-build-arm"}"

for tool in git ninja python3; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        printf 'Missing required tool: %s\n' "$tool" >&2
        exit 1
    fi
done

if [[ ! -d "${QEMU_SOURCE_DIR}/.git" ]]; then
    if [[ -e "$QEMU_SOURCE_DIR" ]]; then
        printf 'Source path exists but is not a Git checkout: %s\n' "$QEMU_SOURCE_DIR" >&2
        exit 1
    fi

    printf 'Cloning upstream QEMU %s...\n' "$QEMU_TAG"
    git clone --depth 1 --branch "$QEMU_TAG" --single-branch \
        https://gitlab.com/qemu-project/qemu.git "$QEMU_SOURCE_DIR"
else
    actual_tag="$(git -C "$QEMU_SOURCE_DIR" describe --tags --exact-match 2>/dev/null || true)"
    if [[ "$actual_tag" != "$QEMU_TAG" ]]; then
        printf 'Existing QEMU checkout is not exactly %s: %s\n' "$QEMU_TAG" "$QEMU_SOURCE_DIR" >&2
        printf 'Set SEMU_QEMU_SOURCE_DIR to a separate empty path to use a clean checkout.\n' >&2
        exit 1
    fi
fi

mkdir -p "$QEMU_BUILD_DIR"
cd "$QEMU_BUILD_DIR"

if [[ ! -f config-host.mak ]]; then
    printf 'Configuring QEMU for the ARM system emulator...\n'
    "$QEMU_SOURCE_DIR/configure" \
        --target-list=arm-softmmu \
        --disable-werror \
        --disable-docs
fi

printf 'Building qemu-system-arm...\n'
ninja

QEMU_BINARY="${QEMU_BUILD_DIR}/qemu-system-arm"
if [[ ! -x "$QEMU_BINARY" ]]; then
    printf 'Build completed but qemu-system-arm was not found at %s\n' "$QEMU_BINARY" >&2
    exit 1
fi

printf '\nBuild successful. QEMU version:\n'
"$QEMU_BINARY" --version
printf '\nAvailable machine types (first entries):\n'
"$QEMU_BINARY" -machine help | sed -n '1,35p'

printf '\nBinary: %s\n' "$QEMU_BINARY"
printf 'Note: this is the upstream ARM baseline. Android Goldfish hardware is a separate SEMU milestone.\n'
