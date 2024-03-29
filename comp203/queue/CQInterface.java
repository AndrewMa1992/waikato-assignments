public interface CQInterface{

  // add a client to the end of the queue
 void enqueue(Client c);

  // remove and return the client at the head of the queue
 Client dequeue();

  // get a reference to the first item in the queue without removing it
  Client peek();

  // test if the queue is empty
 boolean isEmpty();

  // return the number of clients in the queue
 int length();

}
