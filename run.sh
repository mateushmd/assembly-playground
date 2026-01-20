#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
    echo "Usage: ./run.sh path/to/file.asm"
fi

BASENAME=$(basename "$1" .asm)
DIRNAME=$(dirname "$1")
DIRNAME="${DIRNAME#*/}"
TARGET="$DIRNAME/$BASENAME"

mkdir -p ".obj/$DIRNAME"
mkdir -p "bin/$DIRNAME"

nasm -f elf64 "$1" -o ".obj/$TARGET.o"

ld ".obj/$TARGET.o" -o "bin/$TARGET"

"bin/$TARGET"
