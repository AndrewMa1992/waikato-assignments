class TestHash{
  public static void main(String[] args){
    MyHashTable h = new MyHashTable(20);
    Account a = new Account((float)2);
    h.put(1,a);
    h.put(10,a);
    System.out.println(g.get(1).getBalance());
    System.out.println(g.get(10).getBalance());
    h.remove(1);
    if (h.get(1)==null) {
      System.out.println("remvoe suc");
    }
  }
  public TestHash(){

  }
}
