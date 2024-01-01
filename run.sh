nasm -f bin -o bootloader.bin bootloader.asm
nasm -f bin -o kernel.bin kernel.asm
g++ -Wall -Wextra -O2 -fno-exceptions -fno-rtti -ffreestanding -c main.cpp -o main.o
ld -e kernel_main -Ttext 0x8000 -o main.bin.o main.o
objcopy -R .note -R .comment -S -O binary main.bin.o main.bin

cat bootloader.bin > image
cat kernel.bin >> image
cat main.bin >> image

qemu-system-x86_64 -fda image