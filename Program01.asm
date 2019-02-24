TITLE Programming Assignment #1     (Program01.asm)

; Author: Jordan Hamilton
; Last Modified: 1/20/2019
; OSU email address: hamiltj2@oregonstate.edu
; Course number/section: CS271-400
; Project Number: 1                Due Date: 1/20/2019
; Description: This program will introduce the program and programmer, get two numbers from the user,
; perform addition, subtraction, multiplication and division on the numbers, and then display the results.

INCLUDE Irvine32.inc

.data

intro               BYTE      "Programming assignment #1 by Jordan Hamilton",0
description         BYTE      "Enter two numbers when prompted to display the sum, difference, product, quotient and remainder.",0
prompt1             BYTE      "Enter the first number (this should be more than the second number): ",0
prompt2             BYTE      "Enter the second number: ",0
outro               BYTE      "Goodbye!",0

addSign             BYTE      " + ",0
subtractSign        BYTE      " - ",0
multiplySign        BYTE      " * ",0
divideSign          BYTE      " / ",0
remainderSign       BYTE      " remainder ",0
equalSign           BYTE      " = ",0

num1                DWORD     ?
num2                DWORD     ?
sum                 DWORD     ?
difference          DWORD     ?
product             DWORD     ?
quotient            DWORD     ?
remainder           DWORD     ?

.code

main PROC

; Display an introduction

     ; Introduce the program (and programmer)
     mov      edx, OFFSET intro
     call     WriteString
     call     Crlf
     
     ; Display the instructions and the output to expect
     mov      edx, OFFSET description
     call     WriteString
     call     Crlf

; Get user input

     ; Ask the user to enter the first number, then store it in num1
     call     Crlf
     mov      edx, OFFSET prompt1
     call     WriteString
     call     ReadDec
     mov      num1, eax

     ; Ask the user to enter the second number, then store it in num2
     mov      edx, OFFSET prompt2
     call     WriteString
     call     ReadDec
     mov      num2, eax
     call     Crlf
     
; Start calculations

     ; Calculate the sum of num1 and num2, then store the result in sum
     mov      eax, num1
     add      eax, num2
     mov      sum, eax

     ; Calculate the difference between num1 and num2, then store the result in difference
     mov      eax, num1
     sub      eax, num2
     mov      difference, eax
     
     ; Calculate the product of num1 and num2, then store the result in product
     mov      eax, num1
     mov      ebx, num2
     mul      ebx
     mov      product, eax

     ; Calculate the quotient and remainder of num1 and num2, then store the results in quotient and remainder
     mov      eax, num1
     mov      ebx, num2
     div      ebx
     mov      quotient, eax
     mov      remainder, edx

; Display results

     ; Output the sum to the screen
     mov      eax, num1
     mov      edx, OFFSET addSign
     call     WriteDec
     call     WriteString
     mov      eax, num2
     mov      edx, OFFSET equalSign
     call     WriteDec
     call     WriteString
     mov      eax, sum
     call     WriteDec
     call     Crlf

     ; Output the difference to the screen
     mov      eax, num1
     mov      edx, OFFSET subtractSign
     call     WriteDec
     call     WriteString
     mov      eax, num2
     mov      edx, OFFSET equalSign
     call     WriteDec
     call     WriteString
     mov      eax, difference
     call     WriteDec
     call     Crlf

     ; Output the product to the screen
     mov      eax, num1
     mov      edx, OFFSET multiplySign
     call     WriteDec
     call     WriteString
     mov      eax, num2
     mov      edx, OFFSET equalSign
     call     WriteDec
     call     WriteString
     mov      eax, product
     call     WriteDec
     call     Crlf

     ; Output the quotient and remainder to the screen
     mov      eax, num1
     mov      edx, OFFSET divideSign
     call     WriteDec
     call     WriteString
     mov      eax, num2
     mov      edx, OFFSET equalSign
     call     WriteDec
     call     WriteString
     mov      eax, quotient
     call     WriteDec
     mov      eax, remainder
     mov      edx, OFFSET remainderSign
     call     WriteString
     call     WriteDec
     call     Crlf

; Say goodbye

     ; Display the exit message
     mov      edx, OFFSET outro
     call     Crlf
     call     WriteString

     ; Exit to the operating system
	INVOKE ExitProcess,0
	
main ENDP

END main
