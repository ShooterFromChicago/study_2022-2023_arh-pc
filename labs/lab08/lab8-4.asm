%include 'in_out.asm'

SECTION .data
msg_input_x db "Введите x: ",0h
msg_input_a db "Введите a: ",0h
msg_out_x db "x = "
msg_out_a db "a = "

SECTION .bss
x resb 10
a resb 10

SECTION .text

GLOBAL _start
_start:
;вывод сообщения 'Введите х: '
mov eax, msg_input_x
call sprint
;ввод х
mov ecx,x
mov edx, 10
call sread
;преобразование х в число
mov eax,x
call atoi
mov [x],eax
;вывод сообщения 'Введите а: '
mov eax, msg_input_a
call sprint
;ввод а
mov ecx,a
mov edx,10
call sread
;преобразование а в число
mov eax, a
call atoi
mov [a],eax
;сравниваем а и х
mov eax, a
mov ebx, x
cmp ebx,eax
jl _inc_a
mov eax, x
add eax,10
mov [x],eax

_inc_a:
mov eax, a
add eax,10
mov [a],eax
;вывод х
mov eax,msg_out_x
call sprint
mov eax,[x]
call iprintLF
;вывод а
mov eax,msg_out_a
call sprint
mov eax,[a]
call iprintLF