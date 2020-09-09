INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
SWAP PROTO,pValX:SDWORD,pValy:SDWORD
.data
	 out1		 BYTE    "皚┮Τ皚计", 0
	 out2		 BYTE    "块皚皚い程じ程ま竚", 0
	 A           SDWORD    100 DUP(?)  ;┮―皚
	 countout    SDWORD    0  ;癹伴
	 countin     SDWORD    0  ;ず癹伴
	 temp        SDWORD    0
	 count       SDWORD    99
.code
main PROC

	mov edx , OFFSET out1 ;ㄏノ皚┮Τ皚计
	call WriteString
	call Crlf

	mov     esi  , OFFSET A
	call    Randomize
	mov ecx,100                    ;Loop禲碭Ω

L1:                               ;玻ネ皚じ
	mov   eax,100
	call  Randomrange
	mov     [esi],eax
	add     esi ,TYPE A
	loop L1

	mov   esi  , OFFSET A
	mov ecx,100         
L2:                              ;皚じ块
	mov     eax,[esi]
	call    writeint
	add     esi ,TYPE A
	loop L2
	call crlf
	mov eax,countout
L4:
	mov ecx,count
	mov temp,0
Inter:
	mov esi,OFFSET A	          
	add esi,temp         ;ㄓ
	mov ebx,[esi]
	mov edi,OFFSET A     ;
	add edi,temp         
	add edi,4
	mov edx,[edi]
	.if(ebx>edx)
		mov ebx,temp
		INVOKE Swap,ADDR [A+ebx],ADDR [A+ebx+4]
	.endif
	add temp,4
loop Inter
	sub count,1
	mov ecx,count
	.if(ecx>0)
		jmp L4
	.endif

	mov edx , OFFSET out2 ;ㄏノ皚┮Τ皚计
	call WriteString
	call Crlf

	mov   esi  , OFFSET A
	mov ecx,100          
L3:
	mov     eax,[esi]
	call    writeint
	add     esi ,TYPE A
	loop L3

	call    crlf 
	call WaitMsg
	INVOKE ExitProcess , 0
main ENDP
Swap PROC USES eax edi esi,pValX:SDWORD,pValy:SDWORD
	mov  esi,pValX
	mov  edi,pValY
	mov  eax,[esi]
	xchg eax,[edi]
	mov  [esi],eax
	ret
SWAP ENDP
END main