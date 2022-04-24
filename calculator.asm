extern printf
extern scanf

global main



section .text


main: 
  ; print a prompt asking for that number
  mov rdi, numberPrompt
  push rbx
  call printf
  pop rbx

  ; read in that number
  ; scanf(%d, &number)
  mov rdi, numberFormat
  mov rsi, number
  push rbx
  call scanf
  pop rbx

  ; print a prompt asking for that number
  mov rdi, number2Prompt
  push rbx
  call printf
  pop rbx

  ; read in that number
  ; scanf(%d, &number)
  mov rdi, number2Format
  mov rsi, number2
  push rbx
  call scanf
  pop rbx

  ; print a prompt asking for the operation
  mov rdi, operationPrompt
  push rbx
  call printf
  pop rbx

  ; scan the operation prompt
  ; scanf("%s", operation)
  mov rdi, operationFormat
  mov rsi, operation
  push rbx
  call scanf
  pop rbx
  
  
  ; work needs to be done on the if statement


; ;   ; if/else
; ;   cmp rdx, "+"
; ;   ; call the addition -- jump if equal to
; ;   je AdditionOp
; ;   jne Multiplication

; ; Multiplication:
;   ; if/else
;   cmp rdx, "*"
;   ; call the addition -- jump if equal to
;   je MultOp

; ; Division:
;   ; if/else
;   cmp rdx, "/"
;   ; call the addition -- jump if equal to
;   je DivOp

  ; Subtraction:
  ; if/else
  cmp rdx, "-"
  ; call the addition -- jump if equal to
  je SubtractOp
  
  

AdditionOp:
  ; addition
  mov rax, [number]
  add rax, [number2]
  mov [calculatedNumber], rax
  jmp OutMessage

SubtractOp:
  ; addition
  mov rax, [number]
  sub rax, [number2]
  mov [calculatedNumber], rax
  jmp OutMessage


MultOp:
  ; multiplication 
    mov rax, [number]
    mov rbx, [number2]
    imul rbx
    mov [calculatedNumber], rax
    jmp OutMessage

DivOp:
  ; multiplication 
    mov rax, [number]
    mov rbx, [number2]
    idiv rbx
    mov [calculatedNumber], rax
    jmp OutMessage

  

OutMessage:
  ; calling the function
  mov rdi, outpmessage
  mov rsi, [calculatedNumber]
  push rbx
  call printf
  pop rbx

; "exitProgram" is a label 
exitProgram:
  ret


section .data
; can use "%d" but "%lli" is a huge number
  numberPrompt db "Enter a number: ", 0
  number2Prompt db "Enter another number: ", 0
  operationPrompt db "Enter an operation: ", 0

  numberFormat db "%d", 0
  number2Format db "%d", 0
  operationFormat db "%s", 0
  

  outpmessage db "result: %d", 0ah, 0dh, 0



section .bss
  number resq 1
  number2 resq 1
  operation resb 2
  calculatedNumber resq 1
