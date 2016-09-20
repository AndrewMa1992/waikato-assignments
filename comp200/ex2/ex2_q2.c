#include "/home/comp200/ex2/lib_ex2.h"

void count(int start, int end){
	if( 0<=start && 0<=end && start<100 && end < 100 && start != end){
		if(start < end){
			for(;start<=end;start++){
				writessd(start);
				delay();
			}	
		}
		else{
			for(;start>=end;start--){
				writessd(start);
				delay();
			}

		}

	}else{
		writessd(0);
	}

}

