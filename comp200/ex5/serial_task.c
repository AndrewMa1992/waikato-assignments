#include "rex.h"
void printChar(int c) {
 	//Loop while the TDR bit is not set
 	while(!(RexSp2->Stat & 2));

 	//Write the character to the Tx register
 	RexSp2->Tx = c;
}
int counter;
int serial_state;

void serial_main() {
	//Variables must be declared at the top of a block

  int min = 0;
  int sec = 0;
  int val = 0;
  serial_state = 0;
  counter =0;
  // RexTimer->Iack = 0; //acknowledge interrupt
  // RexTimer->Load = 2400; //every 1 second
  // RexTimer->Ctrl = 3;//  set auto-restart mode but do not start the timer yet

	//Infinite loop
	while(1) {

    if (RexSp2->Stat & 1) {
      if (RexSp2->Rx == 49) {//1
        serial_state = 1;
      }else if (RexSp2->Rx == 50) {//2
        serial_state = 2;
      }else if (RexSp2->Rx == 51) {//3
        serial_state = 3;
      }else if (RexSp2->Rx == 113) {  //q
       break;
      }
    }

    if (serial_state == 1) { //1
      printChar('\r');//carriage \r
      val = counter /100;
      min = val / 60;
      sec = val % 60;
      val = min /10 + '0';
      printChar(val);
      val = min %10 + '0';
      printChar(val);
      printChar(':');// :
      val = sec /10 + '0';
      printChar(val);
      val = sec %10 + '0';
      printChar(val);
      printChar(' ');
      printChar(' ');
    }else if (serial_state == 2) { //2
      printChar('\r');//carriage \r
      val = counter/100000 + '0';
      printChar(val);
      val = counter/10000;
      val = val%10 + '0';
      printChar(val);
      val = counter/1000;
      val = val %10 + '0';
      printChar(val);
      val = counter/100;
      val = val %10 + '0';
      printChar(val);
      printChar('.');
      val = counter/10;
      val = val%10 + '0';
      printChar(val);
      val = counter%10 + '0';
      printChar(val);
    }else if(serial_state == 3){ //3
      printChar('\r');//carriage \r
      val = counter/100000 + '0';
      printChar(val);
      val = counter/10000;
      val = val%10 + '0';
      printChar(val);
      val = counter/1000;
      val = val %10 + '0';
      printChar(val);
      val = counter/100;
      val = val %10 + '0';
      printChar(val);
      val = counter/10;
      val = val%10 + '0';
      printChar(val);
      val = counter%10 + '0';
      printChar(val);
    }
  }
}
