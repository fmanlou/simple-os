; 设置程序起始地址
[org 0x7c00]

mov ah, 0x2         ; 设置功能号，表示进行磁盘读取操作
mov al, 0x01        ; 设置读取的扇区数
xor ch, ch          ; 设置磁道号 Cylinder 0
mov cl, 2           ; 设置扇区号 Sector 2
xor dh, dh          ; 设置磁头号 Head 0
mov dl, 0x0         ; 设置驱动器号（0 表示第一个硬盘）
mov bx, 0x7e00      ; 设置缓冲区地址
int 0x13            ; 调用BIOS的磁盘服务

jmp 0x7e00

times 510-($-$$) db 0
db 0x55, 0xaa