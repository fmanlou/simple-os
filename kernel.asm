; 清屏
mov ah, 0x00
mov al, 0x03
int 0x10

hlt ; 停机
times 512-($-$$) db 0