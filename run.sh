nasm -f bin -o bootloader.bin bootloader.asm
cat bootloader.bin > image
qemu-system-x86_64 -fda image
