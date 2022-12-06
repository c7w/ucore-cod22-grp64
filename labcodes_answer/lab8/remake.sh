riscv64-unknown-elf-gcc -std=c17 -march=rv32im -mabi=ilp32 scripts/vga.c -S
mv vga.s scripts/
riscv64-unknown-elf-gcc scripts/vga.s -march=rv32i -mabi=ilp32 -static -fno-pic -fno-builtin -nostdlib  -nostdinc -g -o scripts/vga.elf  -Wl,-Ttext,0x0
riscv64-unknown-elf-objcopy -j .text -O binary -S scripts/vga.elf scripts/vga.bin