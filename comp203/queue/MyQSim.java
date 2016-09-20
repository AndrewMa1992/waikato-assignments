import java.util.Random;
public class MyQSim {
	
	public static void main(String[] args){
		if(args.length == 1){
			try{
				int num = Integer.parseInt(args[0]);
				Simulator sim = new Simulator(num);
			}
			catch(NumberFormatException e){
				System.out.println("please provide a number");
				System.out.println(e.getMessage());
			}
			catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace(System.out);
			}
		}
		else{
			System.out.println("please provide a number specifying the number of Clients passing through the queue");
		}
	}
	
}



