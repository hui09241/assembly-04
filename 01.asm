INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
GCD PROTO
.data
	 Out1 BYTE "請輸入數字: ",0
	 Out2 BYTE "輸出結果: ",0
	 A    SDWORD 5d,24d,11d,432d,26d
	 B    SDWORD 20d,18d,7d,226d,13d
	 count SDWORD 0

.code
main PROC
	call   Clrscr      ;清除螢幕
	mov ecx,5
Cycle:
    mov edx,OFFSET Out1
	call WriteString
	call Crlf
	mov esi,OFFSET A
	mov eax,count
	add esi,eax
	mov eax,[esi]
	call writeint
	call crlf
	;call ReadInt
	push eax                ;放入數字A
	;mov A,eax

	mov edx,OFFSET Out1
	call WriteString
	call Crlf
	mov esi,OFFSET B
	mov eax,count
	add esi,eax
	mov eax,[esi]
	call writeint
	call crlf 
	push eax                ;放入數字B
	;mov B,eax
	
	call GCD
	

	mov edx,OFFSET Out2
	call WriteString
	call Crlf
	call WriteInt
	call Crlf
	add count,4
	loop Cycle

	INVOKE ExitProcess , 0
main ENDP
GCD PROC 
	
	;push ebp
	;mov ebp,esp
	enter 0,0       ;++

	mov eax,[ebp+8]
	;call writeint
	;call crlf
	mov ebx,[ebp+12]
	;mov eax,ebx
	;call writeint
	;call crlf
	;mov eax,[ebp+8]
	
.if(eax<ebx)         ;大值要當X
	mov eax,[ebp+12]
	mov ebx,[ebp+8]
.endif
	mov edx,0
	idiv ebx        ;做X%Y

.if(edx==0)         ;如果X%Y==0
	mov eax,ebx
	;call crlf
	;call writeint
	;call crlf
	jmp LEAD
	;pop ebp
	;ret 8
.elseif
	mov  eax,ebx
	push eax
	mov  eax,edx
	push eax
	call GCD
.endif	
LEAD:	
	leave     ;++
	ret       ;++
GCD ENDP
END main