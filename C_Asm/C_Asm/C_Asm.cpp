// Miguel Calderon 4/11/19 

#include <iostream>
using namespace std;

const int ONE_BILL = 1000000000;
const int TWO_BILL = 2000000000;
int main()
{
	// debug then windows then disassembly
	int num1, num2, result; // intialize variables

	num1 = ONE_BILL; // set num1
	num2 = TWO_BILL;// set num2
	
	//~~~~~~~~~~~~Question 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	result = 5 * num2 / 5; // C++ math
	cout << "Question 1:" << endl;
	cout << "Without Assembly: " << result << endl;

	_asm
	{
		MOV EAX, 5			; Assign 5 to EAX
		IMUL num2			; Multiply by num2
		MOV ECX, 5			; Assign 5 to ECX
		IDIV ECX			; Divide EAX by ECX
		MOV result, EAX		;Assign result answer in EAX
	}

	cout << "With Assembly: " << result << endl<< endl;


	//~~~~~~~~~~~~Question 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	result = (num1 + num2) / 3; // math in C++
	cout << "Question 2:" << endl;
	cout << "Without Assembly: " << result << endl;

	_asm
	{
		MOV EDX, 0			; Assign 0 to EDX
		MOV EAX, num1		; Assign num1 to EAX
		ADC EAX, num2		; Add num2 using CF to EAX
		MOV ECX, 3			; Assign 3 to ECX
		IDIV ECX			; Divide EAX by ECX
		MOV result, EAX		;Assign result answer in EAX
	}
	cout << "With Assembly: " << result << endl << endl;

	//~~~~~~~~~~~~Question 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	result = (num1 * 30 - num2) / 14; // C++ math
	cout << "Question 3:" << endl;
	cout << "Without Assembly: " << result << endl;

	_asm
	{
		MOV EAX, num1		; Assign num1 to EAX
		MOV ECX, 30			; Assign 30 to ECX
		IMUL ECX			; Multiply by ECX
		SBB EAX, num2		; Sub num2 using CF from EAX
		MOV ECX, 14			; Assign 14 to ECX
		IDIV ECX			;Divide EAX by ECX
		MOV result, EAX		;Assign result answer in EAX
	}

	cout << "With Assembly: " << result << endl<< endl;

	//~~~~~~~~~~~~Question 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	result = (num1 * 53 - num2*30) / 9; // C++ math
	cout << "Question 4:" << endl;
	cout << "Without Assembly: " << result << endl ;

	_asm
	{
		MOV EAX, num1; Assign num1 to EAX
		MOV ECX, 53; Assign 53 to ECX
		IMUL ECX; Multiply EAX by ECX

		MOV ESI, EAX; Assign ESI to EAX
		MOV EBX, EDX; Assign EDX to EBX

		MOV EAX, num2; Assign num2 to EAX
		MOV ECX, 30; Assign 30 to ECX
		IMUL ECX; Multiply EAX by ECX

		XCHG EAX, ESI; Swap EAX & ESI
		XCHG EDX, EBX; Swap EDX & EDX

		SBB EAX, ESI; Sub ESI from ESI with CF
		SBB EDX, EBX; Sub EDX from EBX with CF

		MOV ECX, 9; Assign 9 to ECX
		IDIV ECX; Divide EAX by ECX

		MOV result, EAX;Assign answer to EAX
	}
	cout << "With Assembly: " << result << endl << endl;
	system("pause");
	return 0; // done!
}
/*
Question 1:
Without Assembly: 282013081
With Assembly: 2000000000

Question 2:
Without Assembly: -431655765
With Assembly: 1000000000

Question 3:
Without Assembly: -147483648
With Assembly: 1999999999

Question 4:
Without Assembly: 176659399
With Assembly: -777777777
*/