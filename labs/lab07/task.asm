%include 'in_out.asm'

SECTION .data
msg DB 'Введите x: ', 0
ans DB 'Ответ: ', 0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

mov ebx, 5
add eax, ebx
mul eax
mov ebx, 3
sub eax, ebx

mov ebx, eax
mov eax, ans
call sprint
mov eax, ebx
call iprintLF

call quit