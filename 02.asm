INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
SWAP PROTO,pValX:SDWORD,pValy:SDWORD
.data
	 out1		 BYTE    "���}�C�Ҧ��}�C�ơG", 0
	 out2		 BYTE    "��X�}�C�B�}�C���̤j������̤j���ަ�m�G", 0
	 A           SDWORD    100 DUP(?)  ;�ҨD�}�C
	 countout    SDWORD    0  ;�~�j��
	 countin     SDWORD    0  ;���j��
	 temp        SDWORD    0
	 count       SDWORD    99
.code
main PROC

	mov edx , OFFSET out1 ;�i���ϥΪ̦��}�C�Ҧ��}�C��
	call WriteString
	call Crlf

	mov     esi  , OFFSET A
	call    Randomize
	mov ecx,100                    ;Loop�]�X��

L1:                               ;���Ͱ}�C����
	mov   eax,100
	call  Randomrange
	mov     [esi],eax
	add     esi ,TYPE A
	loop L1

	mov   esi  , OFFSET A
	mov ecx,100         
L2:                              ;�}�C������X
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
	add esi,temp         ;��Ӫ�
	mov ebx,[esi]
	mov edi,OFFSET A     ;�U�@��
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

	mov edx , OFFSET out2 ;�i���ϥΪ̦��}�C�Ҧ��}�C��
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