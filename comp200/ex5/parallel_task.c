#include "rex.h"
void parallel_main() {
	//Variables must be declared at the top of a block
	int switches = 0;
  int state = 16;//16 for base 16, 10 for base 10
  int leftssd = 0;
  int rightssd = 0;
  int pushbutton = 0;


	//Infinite loop
	while(1) {
    pushbutton = RexParallel->Buttons;
		if (pushbutton ==1) { //push 0, xor pushbutton and 1
      state = 16;
    }else if (pushbutton == 2) {//push 1
      state = 10;
    }else if (pushbutton == 3) {//both
			break;
		}
		//Read current value from parallel switch register
		switches = RexParallel->Switches;
    if (switches >= 100 && state == 10) {
      switches = switches % 100;
    }
    //if the switch values exceed 100, only remain the non-hundredth part
    if (state == 16) {
      leftssd = switches / 16;
      rightssd = switches % 16;
    }else if (state == 10) {
      leftssd = switches / 10;
      rightssd = switches % 10;
    }
    RexParallel->LeftSSD = leftssd;
    RexParallel->RightSSD = rightssd;

  }

}
