#include <reg51.h>

sbit R=P2^0;				
sbit W=P2^1;
sbit INTR=P2^2;

void main(void)
	{
		P1 = 0xFF;
		TMOD=0x20; //use Timer 1, mode 2
		TH1=0xFD; //9600 for normal
		SCON=0x50;	//enable receive
		TR1=1; //start timer
			while(1)
			{  
			//ADC conversion code
				INTR = 1;
				W=0;
				W=1;
				while(INTR==1);
				R=0;
				R=1;
			    //Saving converted value to accumulator
				ACC=P1;	
				SBUF=ACC; //place value in buffer
				while(TI==0); //wait for transmit
				TI=0;
				
			
			}
	}