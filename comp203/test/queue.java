class queue{
  Client head = null;
  Client tail = null;
  public queue(){

  }

  public void enqueue(Client n){
    if (head == null) {
      head = n;
      tail = head;
    }else{
      tail.setNext(n);
      tail = n;
    }
  }

  public Client dequeue(){
    Client temp = head;
    head = head.getNext();
    return temp;
  }
}
