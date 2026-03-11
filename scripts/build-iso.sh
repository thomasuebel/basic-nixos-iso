#!/usr/bin/env bash
set -euo pipefail

nix build .#iso
echo "ISO built: $(readlink -f result)/iso/"
ls -lh result/iso/*.iso
