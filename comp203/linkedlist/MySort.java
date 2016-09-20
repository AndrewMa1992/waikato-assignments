//name: bruce tan
//id: 1260430
import java.util.*;
public class MySort {
	
	public static void main(String[] args){
		if(args.length == 2){
			try{
				String SortMethod = args[0];
				int num = Integer.parseInt(args[1]);
				
				MySort mysort = new MySort(SortMethod,num);
			}
			catch(NumberFormatException e){
				System.out.println("please provide a number after sorting method");
				System.out.println(e.getMessage());
			}
			catch(Exception exx){
				System.out.println(exx.getMessage());
			}
		}else{
			System.out.println("please provide sorting method and length");
		}
	}

	public MySort(String method,int num){
		try{
			IntList list = new IntList(num);

			if(method.equals("q")) {
				list = list.qsort();
			}
			else if(method.equals("i")){
				list = list.isort();
			}
			
			else {throw new IllegalArgumentException("method must be either q or i");}

			
			list.Dump();
			IntList newlist = list.makeCopy();	
			newlist.Dump();

			System.out.println("duplicates: "+list.hasDumplicatekey());

		}catch(Exception e){
			System.out.println(e.getMessage());
		}

	}

	






}

