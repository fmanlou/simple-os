[org 0x7e00]
[bits 16]

; 清屏
mov ah, 0x00
mov al, 0x03
int 0x10

cli ; 关中断
lgdt [GDT_Descriptor]   ; 加载GDT表到寄存器中

; 设置cr0寄存器最后一位为0
mov eax, cr0
or eax, 1
mov cr0, eax

; 进入32位模式
jmp CODE_SEG:main

[bits 32]
main:
    mov al, 'A'         ; 字符
    mov ah, 0x0f        ; 字符颜色: 黑底白字
    mov [0xb8000], ax   ; 视频内存的起始地址
    hlt ; 停机

GDT_Start:
    null_descriptor:
        dd 0
        dd 0
    code_descriptor:
        dw 0xffff
        dw 0
        db 0
        db 10011010b
        db 11001111b
        db 0
    data_descriptor:
        dw 0xffff
        dw 0
        dw 0
        db 10010010b
        db 11001111b
        db 0
GDT_End:

GDT_Descriptor:
    dw GDT_End - GDT_Start - 1  ;   GDT表的大小
    dd GDT_Start                ;   GDT表的起始地址

CODE_SEG equ code_descriptor - GDT_Start
DATA_SEG equ data_descriptor - GDT_Start

times 512-($-$$) db 0