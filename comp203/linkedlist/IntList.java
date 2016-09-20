import java.util.*;
	public class IntList{
		static int comparisonsCount;
		public Node HEAD = null;
		private int listcount = 0;

		public int Length(){
			return listcount;
		}

		public IntList(){
			
		}

		//produce a list of unsorted random number with a length specified by the argument num
		public IntList(int num){
			if(num < 1) {throw new IllegalArgumentException("number must be above or equal to 1");}

			Random rn = new Random();
			 //rn.NEXTInt(num)+1 means generates random number between 1 and num
			for(int i=0;i<num;i++){ //num times
				Add(rn.nextInt(num)+1);
			}
		}
		
		//add a new node with value key to the start of the IntList
		public void Add(int key){
			if(IsEmpty()){
				HEAD = new Node(key);
			}else{
				HEAD = new Node(key,HEAD);
			}
			listcount++;
		}

		//remove this node from list, the reason we use Node as parameter rather than value is that 
		//this one only removes the same node, so BOTH next and value are compared rather than value being compared only
		//if it finds nothing to be removed, it throws exception
		public void Remove(Node ToRemove){
			if(ToRemove == null){ throw new RuntimeException("parameter cannot be null");}	
			if(!Contains(ToRemove)){
				throw new RuntimeException("nothing found to be deleted");	
			}

			if(HEAD.equals(ToRemove)){
				HEAD = HEAD.NEXT;
				
			}else{

				Node curr = HEAD;
				Node prev = null;

				while(!(curr.equals(ToRemove)) && curr != null){
					comparisonsCount++;
					prev = curr;
					curr = curr.NEXT;
				}
				//delete node
				//curr can't be null because we're already checked if IntList contains ToRemove, so ToRemove must exist in the IntList
				prev.NEXT = curr.NEXT;
			
			}
			listcount--;
		}

		//find a node with value that is bigger than key, then insert the key before that node
		public void Insert(int key){
			if(IsEmpty()){
				HEAD = new Node(key);
				return;
			}
			if(HEAD.Value() >= key){//if the first value is bigger than key, then we insert it at the element 0
				comparisonsCount++;
				Add(key);
				return;
			}
			else{
				Node curr = HEAD;
				Node prev = null;

				//find the node with the key
				while(curr!=null && curr.Value() < key){
					prev = curr;
					curr = curr.NEXT;
					comparisonsCount++;
				}
				if(curr != null){

					prev.NEXT = new Node(key,curr);
				}
				else{ //if curr is null, then that means we are at the end of the IntList, there is no place we can insert, so we'll insert at the last one
					prev.NEXT = new Node(key);
				}

			}
			
			
			
		}

		//return true if it can find the node
		//otherwise, it reutrns false
		public boolean Contains(Node node){
			if(this.IsEmpty()){
				return false;
			}
			Node curr = HEAD;
			while(curr!=null){
				if(curr.equals(node)){
					return true;
				}
				curr = curr.NEXT;
			}
			return false;
		}

		//return true if the IntList is empty, otherwise false
		public boolean IsEmpty(){
			if(HEAD == null){
				return true;
			}
			else{
				return false;
			}
		}

		//append a new IntList to this IntList at the end

		public IntList Append(IntList nlist){
			if(nlist == null){
				throw new RuntimeException("appending list cannot be null");
			}
			if(nlist.IsEmpty()){ //if the new list is empty, then there is nothing to add
				return this;
			}
			if(IsEmpty()){ //if this list is empty, then simply return the other list
				return nlist;
			}
			//nlist is neither null or of 0 length
			Node curr = HEAD;
			while(curr.NEXT != null){curr = curr.NEXT;}
			
			//append the new list's head to this one's end
			curr.NEXT = nlist.HEAD;
			listcount += nlist.Length();
			return this;
		}

		//print all the value in the IntList in the command line
		public void Dump(){
			if(IsEmpty()){System.out.println("the list is empty");return;}
			Node curr = HEAD;
			while(curr != null){
				System.out.print(curr.Value() + " ");
				curr = curr.NEXT;
			}
			System.err.println("No. of Comparisons: "+comparisonsCount);
		}

		//sort nlist using quicksort
		public IntList qsort(){
			if(listcount <= 1){ //if there is less or equal than one node in the list (or empty) , then its not ncessary to sort it	
				return this;
			}

			Node pivot = HEAD;//choose a random pivot, say the first element
			IntList smaller = new IntList();
			IntList bigger = new IntList();

			Node nextCompare = pivot.NEXT;
			
			while(nextCompare != null){
				if(nextCompare.Value() >= pivot.Value()){
					bigger.Add(nextCompare.Value());//add to bigger
				}
				else {
					smaller.Add(nextCompare.Value());//add to smaller
				}
				nextCompare = nextCompare.NEXT;
				comparisonsCount++;
			}
		

			smaller = smaller.qsort();
			bigger = bigger.qsort();
			return smaller.Append(pivot.Append(bigger));
		}

		//insertion sort
		public IntList isort(){
			if(this.listcount <= 1){return this;} //if there is less or equal than one node in the list (or empty), then its not ncessary to sort it
			IntList newlist = new IntList();
			Node curr = HEAD;
			while(curr != null){
				//store the next one for iteration
				Node nex = curr.NEXT;
				
				//we use removeNode in this case because, suppose there are multiple nodes with the same value, and suppose we were to remove one of them,
				//using Remove by value will always end up removing the first node rather than the other ones with the same value
				newlist.insertKey(curr.Value());
				Remove(curr);
				
				//inerate next one
				curr = nex;
			}
			return newlist;

		}
		public void insertKey(int key1){
			if(HEAD == null){HEAD = new Node();HEAD.value = key1;return;}
			if(HEAD.value >= key1){
				Node temp = HEAD;
				HEAD = new Node();
				HEAD.value = key1;
				HEAD.NEXT = temp;
				return;}

			Node curr = HEAD;Node prev = null;
			while(curr != null && curr.value <= key1){prev = curr;curr = curr.NEXT;}
			if(curr == null){prev.NEXT = new Node();prev.NEXT.value = key1;}
			else{prev.NEXT = new Node();prev.NEXT.value = key1;prev.NEXT.NEXT = curr;}
		}

		public IntList makeCopy(){

			IntList nlist = new IntList();
			nlist.HEAD = HEAD;
			Node curr1 = nlist.HEAD;
			Node curr2 = HEAD;
			while(curr2.NEXT != null){curr1.NEXT = curr2.NEXT;curr1 = curr1.NEXT;curr2 = curr2.NEXT;}
			return nlist;
		}

		public Boolean hasDumplicatekey(){

			if(HEAD == null){return false;}
			Node curr = HEAD;
			IntList prevlist = new IntList();
			while(curr != null){if(prevlist.Contains1(curr.value)){return true;} prevlist.Add(curr.value);curr = curr.NEXT;}
			return false;
		}

		public boolean Contains1(int key){
			if(this.IsEmpty()){
				return false;
			}
			Node curr = HEAD;
			while(curr!=null){
				if(curr.value == key){
					return true;
				}
				curr = curr.NEXT;
			}
			return false;
		}

		


	}
