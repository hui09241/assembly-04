INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	 Out1  BYTE "�п�JN��(N���һݶ��h��)�G",0
	 Out2  BYTE "���G�G",0
	 Out3  BYTE "���~:���ͷ���",0 
	 N     SDWORD   0
	 sum   DWORD    1
	 count SDWORD   1
 
.code
main PROC
	call   Clrscr      ;�M���ù�
	mov edx,OFFSET Out1
	call WriteString
	call Crlf
	call ReadInt
	mov  N,eax

	mov ecx,N
	mov edx,0
factorial:
		mov edx,0
		mov eax,sum
		mov ebx,count
		mul ebx
		mov sum,eax
	.if(edx>0) 
		 mov edx,OFFSET Out3
		 call WriteString
	     call Crlf
		 jmp L5
	.endif
		add count,1
	loop factorial

	mov edx,OFFSET Out2
	call WriteString
	call Crlf
	mov eax,sum
	call writedec
L5:
	
 INVOKE ExitProcess , 0
main ENDP
END main