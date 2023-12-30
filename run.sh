nasm -f bin -o bootloader.bin bootloader.asm
nasm -f bin -o kernel.bin kernel.asm
cat bootloader.bin > image
cat kernel.bin >> image
qemu-system-x86_64 -fda image