import java.io.*;
import java.util.Scanner;
class TestHash{
  public static void main(String[] args){
    if (args.length != 3) {
      System.out.println("please provide three arguments: a single letter L or K that indicates whether linear-probing or key-offset probing should be used; a positive integer specifying the initial capacity of the hashtable; and the name of a transaction file to be used as input.");
      return;
    }
    String collisionSolution = args[0];
    if (!collisionSolution.equals("L") && !collisionSolution.equals("K"))   {
      System.out.println("please provide L or K for the first parameter");
      return;
    }
     int capacity = Integer.parseInt(args[1]);
    // if (capacity < 0) {
    //   System.out.println("please provide a positive number for the constructor of MyHashTable");
    //   return;
    // }
    try{
      TestHash testhash = new TestHash(collisionSolution,capacity,args[2]);
    }catch (Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace(System.out);
		}
  }
  public TestHash(String collisionSolution,int capacity, String input){
    MyHashTable htable = new MyHashTable(capacity, collisionSolution);
    try{

      Scanner sc = new Scanner(new File(input));
      String line;
      while(sc.hasNext()){
        int key = 0;
        String method = "";
        float balance = 0;
        line = sc.nextLine();
        try{
          String[] splited = line.split("\\s+");
          if(splited.length != 3){throw new RuntimeException();}
          //separate the line by space
          //[0] is the key
          //[1] is the method, d for deposit, w for withdrawl, c for remove
          //[2] is the balance
          key = Integer.parseInt(splited[0]);
          method = splited[1];
          balance = Float.parseFloat(splited[2]);
          if(!method.equals("d") &&!method.equals("w") &&!method.equals("c")){
            throw new RuntimeException();
          }
        }catch(Exception e){
          //if the format of the input line is not correct, it will simply jump to the next line
          continue;
        }

        Account found = htable.get(key);
        //found is null if it can't find the key, otherwise its a reference to the found Account

        if(method.equals("c")){
          if (found == null) {
            continue;
          }
          htable.Remove(found.hashcode());
        }else{//d or w
          if(found == null){
            Account ac = new Account(key,0);
            htable.put(ac.hashcode(),ac);
            if (htable.getLoadFactor() > 0.8) {
              System.out.println("load factor above 0.8");
              break;
            }
            found = htable.get(ac.hashcode());
          }
          found.setBalance(balance,method);
        }
      }

    }catch (FileNotFoundException e){
			System.out.println("file not found");
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace(System.out);
		}finally{
      System.out.println("Collsions");
      System.out.println(htable.getCollisions());
    }


  }


}
