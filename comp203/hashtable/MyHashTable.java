class MyHashTable{
    private Boolean UseDoubleHashing = true;
    private float loadfactor;
    private int capacity;
    private int slotsUsed;
    private int collisions;
    private int[] keys;
    private Account[] accounts;
    //parameter must be above 0
    public MyHashTable(int capacity){
      if (capacity <= 0) {
        throw new RuntimeException("please provide a positive number for the constructor of MyHashTable");
      }
      this.capacity = capacity;
      //slotsUsed and collisions are automatically set to 0
      keys = new int[capacity];
      accounts = new Account[capacity];
    }
    //multiple constructor, second parameter must be either K or L
    public MyHashTable(int capacity, String method){
      this(capacity);
      if (method.equals("L")) {
        UseDoubleHashing = false;
      }else if(method.equals("K")){
        UseDoubleHashing = true;
      }else{
        throw new RuntimeException("please provide either L or K for the second parameter of the constructor of MyHashTable");
      }
    }

    //puts the data at location given by the hashcode computed from the key
    public void put(int key, Account data){
      //if data is null, then it just means delete, since put method is only meant to insert new data, so we don't accept null in this case
      if (data == null) {
        throw new RuntimeException("second parameter for put method cannot be null");
      }
      //there are two cases of put, one is inserting new data, two is replacing the old data
      //Only in case of inserting new data, should the slotsUsed be incremented

      int hashcode = key%capacity;
      int offset = getOffsetForCollision(key);
      while (keys[hashcode]!=0) {
        //avoid stucking in infinite loop for key-offset hashing
        if (((hashcode + offset) % capacity) == hashcode) {
          offset = 3;
        }
        hashcode = (hashcode+offset) % capacity;
        collisions++;
      }
      keys[hashcode] = key;
      accounts[hashcode] = data;

      slotsUsed++;
      loadfactor =  (float)slotsUsed/(float)capacity;
    }
    //return the data reference with the given key, or null its not found
    public Account get(int key){
      int offset = getOffsetForCollision(key);
      for (int i = key%capacity; keys[i] != 0; i = (i + offset) % capacity){
        if (keys[i] == key) {
          return accounts[i];
        }
        if (((i + offset) % capacity) == i) {
          offset = 3;
        }
        collisions++;
      }
      return null;
    }
    //remove the data reference in the second array with the given key
    public void Remove(int key){
      int offset = getOffsetForCollision(key);
      int i;
      for (i = key%capacity; keys[i] != 0; i = (i + offset) % capacity){
        if (keys[i] == key) {
          accounts[i] = null;
          keys[i] = 0;
          break;
        }
        if (((i + offset) % capacity) == i) {
          offset = 3;
        }
        collisions++;
      }
      slotsUsed--;

    }
    //return the offset number depending the current collision solution
    private int getOffsetForCollision(int key){
      int offset;
      if (UseDoubleHashing) { //key-offset
        offset = key/capacity;
        if (offset == 0) {
          offset = 7;//set the offset to a prime number to differentiate the hashing code
        }
      }else{ //linear probing
        offset = 1;
      }
      return offset;
    }

    //return the number of collisions
    public int getCollisions(){
      return collisions;

    }
    public float getLoadFactor(){
      return loadfactor;
    }
}
