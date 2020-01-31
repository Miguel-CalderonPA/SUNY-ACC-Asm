; Miguel Calderon
; Magic 8 ball emulator
; Calling a subroutine in 64-bit mode    (eightBall.asm)

 ;Irvine64 Prototypes
 WriteString PROTO
 Random64 PROTO
 Randomize PROTO
 Crlf PROTO
 ReadString PROTO
 ExitProcess PROTO

 ;Add appropriate prompts:
.data
	prompt1 byte  "Pick your lucky number:  ", 0
	prompt2 byte  "What is your question?  ", 0
	prompt3 byte  "Magic 8 Ball says:  ", 0
	keyVal QWORD ?
	buffer QWORD ?
	answer0 byte  "Stay positive, All will fall into place", 0
	answer1 byte  "Hell no, not with that attitude", 0
	answer2 byte  "I'm sure Luke knows", 0
	answer3 byte  "When Hell freezes over", 0
	answer4 byte  "I don't know maybe, Not feeling it", 0
	answer5 byte  "Signs point to yes", 0
	answer6 byte  "Haha yea sure, keep thinking that", 0
	answer7 byte  "0", 0
	answer8 byte  "1", 0
	answer9 byte  "Count to 10 and then 10 to 1 Recursivly", 0
	answer10 byte "Ask Marc", 0
	answer11 byte "As I see it, YES!", 0
	answer12 byte "My sources can confirm this", 0
	answer13 byte "2+2=4 so yeah, you will", 0
	answer14 byte "You bet pal!", 0
	answer15 byte "Yes! with hardwork!", 0
	answer16 byte "Only if you do it right", 0
	answer17 byte "Your life is for you to decide", 0
	answer18 byte "Knowledge is power...and I just ran out", 0
	answer19 byte "Concentrate and ask again", 0
	answer20 byte "Patience, you must have padawan", 0
	
.code
DIVISOR EQU QWORD PTR 20						;Constant for divisor
 main PROC
 MOV RCX, 3										;# of Questions
 MAGIC0: 										;LABEL for start jump

	;Output message to ask for lucky number:
	MOV RDX, OFFSET prompt1						;Assign address of prompt1 to RDX
	CALL WriteString							;Write whats in RDX
	call Crlf									;newline

	; Determine random number:
	MOV RSI, RCX								;Preserve RCX before Rand
	CALL Randomize								;Random Seed
	CALL RANDOM64								;Grab pseudo random #
	call Crlf									;newline
	MOV RCX, RSI								;Preserve RCX after Rand
	JMP SKIPMAGIC0								;jump over Do While condition

MAGIC1: LOOP MAGIC0								; loop up one
JMP ENDIF2										;Jump to end of program

	SKIPMAGIC0:
	; Convert number to the appropriate range:
	MOV RDX, 0									;Assign RDX 0
	MOV RBX, DIVISOR							;Assign RBX what to # of prompts -1
	DIV RBX										;Divide RAX by Divisor
	MOV keyVal, RDX								;Assign KeyVal the remainder

	MOV RSI, RCX								;Preserve RCX after ReadString

	;Output message to ask for question:
	MOV RDX, OFFSET prompt2						;Assign address of prompt2 to RDX
	CALL WriteString							;Write whats in the EDX
	;call Crlf									;newline
	call Crlf									;newline
	MOV EDX, OFFSET buffer						;set EDX to elements of buffer
	MOV ECX, SIZEOF buffer						;set ECX to size of buffer
	CALL ReadString

	MOV RCX, RSI								;Preserve RCX after ReadString

	;Output message to to answer question:	
	MOV RDX, OFFSET prompt3						;Assign address of prompt3 to RDX
	CALL WriteString							;write prompt3 to screen
	call Crlf									;newline
	JMP ANS20									;Jump to first Prompt

MAGIC2: JMP MAGIC1								;last cutoff jump from bottom
;JMP ENDIF2										;Jump to end of program


		;_______Answer 20________			
		ANS20:						;Go to (jump to) for 20
		CMP keyVal, 20				;Compare RAX with 20
		JNE	ANS19					;If less GO TO next down
		MOV RDX, OFFSET answer20	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 19________	
		ANS19:						;Go to (jump to) for 19
		CMP keyVal, 19				;Compare RAX with 19
		JNE	ANS18					;If less GO TO next down
		MOV RDX, OFFSET answer19	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 18________	
		ANS18:						;Go to (jump to) for 18
		CMP keyVal, 18				;Compare RAX with 18
		JNE	ANS17					;If less GO TO next down
		MOV RDX, OFFSET answer18	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 17________	
		ANS17:						;Go to (jump to) for 17
		CMP keyVal, 17				;Compare RAX with 17
		JNE	ANS16					;If less GO TO next down
		MOV RDX, OFFSET answer17	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 16________	
		ANS16:						;Go to (jump to) for 16
		CMP keyVal, 16				;Compare RAX with 16
		JNZ	ANS15					;If less GO TO next down
		MOV RDX, OFFSET answer16	;Assign prompt to RAX
		JMP ENDIF1					;break

MAGIC3: JMP MAGIC2					;cutoff from bottom

		;_______Answer 15________	
		ANS15:						;Go to (jump to) for 15
		CMP keyVal, 15				;Compare RAX with 15
		JNE	ANS14					;If less GO TO next down
		MOV RDX, OFFSET answer15	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 14________	
		ANS14:						;Go to (jump to) for 14
		CMP keyVal, 14				;Compare RAX with 14
		JNE	ANS13					;If less GO TO next down
		MOV RDX, OFFSET answer14	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 13________	
		ANS13:						;Go to (jump to) for 13
		CMP keyVal, 13				;Compare RAX with 13
		JNE	ANS12					;If less GO TO next down
		MOV RDX, OFFSET answer13	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 12________	
		ANS12:						;Go to (jump to) for 12
		CMP keyVal, 12				;Compare RAX with 12
		JNE	ANS11					;If less GO TO next down
		MOV RDX, OFFSET answer12	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 11________	
		ANS11:						;Go to (jump to) for 11
		CMP keyVal, 11				;Compare RAX with 11
		JNZ	ANS10					;If less GO TO next down
		MOV RDX, OFFSET answer11	;Assign prompt to RAX
		JMP ENDIF1					;break

MAGIC4:JMP MAGIC3					;cutoff jump from bottom

		;_______Answer 10________	
		ANS10:						;Go to (jump to) for 10
		CMP keyVal, 10				;Compare RAX with 10
		JNE	ANS9					;If less GO TO next down
		MOV RDX, OFFSET answer10	;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 9________	
		ANS9:						;Go to (jump to) for 9
		CMP keyVal, 9				;Compare RAX with 9
		JNE	ANS8					;If less GO TO next down
		MOV RDX, OFFSET answer9		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 8________	
		ANS8:						;Go to (jump to) for 8
		CMP keyVal, 8				;Compare RAX with 8
		JNE	ANS7					;If less GO TO next down
		MOV RDX, OFFSET answer8		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 7________	
		ANS7:						;Go to (jump to) for 7
		CMP keyVal, 7				;Compare RAX with 7
		JNE	ANS6					;If less GO TO next down
		MOV RDX, OFFSET answer7		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 6________	
		ANS6:						;Go to (jump to) for 6
		CMP  keyVal, 6				;Compare RAX with 6
		JNZ	ANS5					;If less GO TO next down
		MOV RDX, OFFSET answer6		;Assign prompt to RAX
		JMP ENDIF1					;break

MAGIC5: JMP MAGIC4					;cutoff from bottom

		;_______Answer 5________	
		ANS5:						;Go to (jump to) for 5
		CMP keyVal, 5				;Compare RAX with 5
		JNE	ANS4					;If less GO TO next down
		MOV RDX, OFFSET answer5		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 4________	
		ANS4:						;Go to (jump to) for 4
		CMP keyVal, 4				;Compare RAX with 4
		JNE	ANS3					;If less GO TO next down
		MOV RDX, OFFSET answer4		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 3________	
		ANS3:						;Go to (jump to) for 3
		CMP keyVal, 3				;Compare RAX with 3
		JNE	ANS2					;If less GO TO next down
		MOV RDX, OFFSET answer3		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 2________	
		ANS2:						;Go to (jump to) for 2
		CMP keyVal, 2				;Compare RAX with 2
		JNE	ANS1					;If less GO TO next down
		MOV RDX, OFFSET answer2		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 1________	
		ANS1:						;Go to (jump to) for 1
		CMP keyVal, 1				;Compare RAX with 1
		JNE	ANS0					;If less GO TO next down
		MOV RDX, OFFSET answer1		;Assign prompt to RAX
		JZ ENDIF1					;break

		;_______Answer 0________	
		ANS0:						;Go to (jump to) for 0
		CMP keyVal, 0				;Compare RAX with 0
		MOV RDX, OFFSET answer0		;Assign prompt to RAX


		ENDIF1:						;the break

	;Determine result:

	;Output the message
	call WriteString			;Output message
	call Crlf					;newline
	call Crlf					;newline
	call Crlf					;newline

JMP MAGIC5				;Start Island Hopping upwards
	ENDIF2:				;end all jump

;CALL ReadString

 mov  ecx,0				; Process return code
 call    ExitProcess	;exit

main ENDP				;goodbye
END						;good day

comment HeyGui$e
~Apparently Do While Jumps have a max, so I had to Island Hop~

Output:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pick your lucky number:

What is your question?

Magic 8 Ball says:
My sources can confirm this


Pick your lucky number:

What is your question?

Magic 8 Ball says:
Count to 10 and then 10 to 1


Pick your lucky number:

What is your question?

Magic 8 Ball says:
Your life is for you to decide

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pick your lucky number:

What is your question?

Magic 8 Ball says:
Hell no, not with that attitude


Pick your lucky number:

What is your question?

Magic 8 Ball says:
I'm sure Luke knows


Pick your lucky number:

What is your question?

Magic 8 Ball says:
Concentrate and ask again

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pick your lucky number:

What is your question?

Magic 8 Ball says:
Concentrate and ask again


Pick your lucky number:

What is your question?

Magic 8 Ball says:
Yes with hardwork!


Pick your lucky number:

What is your question?

Magic 8 Ball says:
When Hell freezes over

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You could say CIS 244 was a "Ball" 

Thanks for teaching us Marc!

HeyGui$e