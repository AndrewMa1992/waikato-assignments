public class Node{
		public int value = 0;
		public Node NEXT = null;

		public Node(){
		}

		public Node(int i){
			value = i;
		}
		
		public Node(int i,Node nex){
			value = i;
			NEXT = nex;
		}

		public int Value(){
			return value;
		}

		public IntList Append(IntList nlist){
			nlist.Add(this.Value());
			return nlist;
		}
		
	}
