//id:1260430 name:bruce tan
public class AccountBST implements BTinterface{
	private Account root = null;
	private AccountBST left = null;
	private AccountBST right = null;

	public AccountBST(){

	}

	public AccountBST(Account root1){
		//we don't throw error if the parameter is null in this case, because root is null by default anyway, and it doesn't crash the program
		root = root1;
	}



	//return the reference of Account with respect to the key, return null if nothing can be found
	public Account find(int key){
		AccountBST curr = this;
		String output = "";
		//output is only printed is we find the key
		if(root== null){return null;}
		while(true){
			output += Integer.toString(curr.root.getKey()) + " ";

			if(key == curr.root.getKey()){
				break;
			}
			else if(key < curr.root.getKey()){
				if(curr.left == null){return null;}
				//if curr.left is null, then we reach the end, nothing has been found, so we return null
				curr = curr.left;
			}
			else if (key > curr.root.getKey()){
				if(curr.right == null){return null;}
				curr = curr.right;
			}
		}
		System.out.print(output);
		return curr.root;

	}

	//non-balanced insert, it inserts a new AccountBST into the tree with key and balance used for creating the Account of it
	public void insert(int key, float balance){
		if(root == null){root = new Account(key,balance);return;}

		AccountBST curr = this;
		while(true){
			if(key < curr.root.getKey()){
				//insert new key if there's no left child
				if(curr.left == null){
					curr.left = new AccountBST(new Account(key,balance));
					break;
				}else{
					curr = curr.left;
				}
			}
			else{// key >= curr.root.getKey()
				//insert new key if there's no right child
				if(curr.right == null){
					curr.right = new AccountBST(new Account(key,balance));
					break;
				}else{
					curr = curr.right;
				}
			}
		}
	}

	//find the smallest child on the left side of this AcountBST, and return it
	//if this has no left child, it return this AccountBST by default
	private AccountBST getleftmost(){
		if(left != null){
			return left.getleftmost();
		}
		return this;
		//if left == null, it means we've found the smallest node, it returns this by default
	}

	private AccountBST min(AccountBST t){
		if (t == null) {
			return null;
		}else{
			if (t.left != null) {
				return min(t.left);
			}
			return t;
		}
	}

	//return true is this AccountBST has no children, that is both left and right are null
	private Boolean isLeaf(){
		if(left == null && right == null){
			return true;
		}
		else{return false;}
	}

	//return true if this AccountBST has only one child, either left or right
	private Boolean hasOneChild(){
		if(left == null && right != null){return true;}
		else if(left != null && right == null){return true;}
		else {return false;}
	}

	public void remove(int key){
		if(root == null){return;}
		if (key > root.getKey() && right != null)  {
				if(right.isLeaf() && right.root.getKey() ==  key){right = null;}
				else{right.remove(key);}
		}else if (key < root.getKey() && left != null) {
			if(left.isLeaf() && left.root.getKey() ==  key){left = null;}
			else{left.remove(key);}
		}else{
				if (right == null) {
					root = left.root;
					right = left.right;
					left = left.left;
				}else{
					Account s = min(right).root;
					remove(s.getKey());
					root = s;
				}
		}
	}

	//remove the node in the BT with respect to parameter key, do nothing if nothing can be deleted
	public void remove1(int key){
		AccountBST curr = this;
		AccountBST parent = null;
		Boolean turnedLeft = false;

		while(true){
			if(curr.root.getKey() == key){

				if(curr.isLeaf()){
					if(parent == null){
					//if this a leaf and the top root, then that means there is only one node in the BT
						root = null;
					}else{
						//if turnedLeft is true, that means we just turned left from the parent to reach the curr node, so we simply delete the left child of the parent
						if(turnedLeft){parent.left = null;}
						else{parent.right = null;}
					}

				}
				else if(curr.hasOneChild()){
					if(curr.right != null){
						if(parent == null){
							//if curr is the top root, then we replace curr with its child, depending on whether we turned left or right
							root = curr.right.root;
							right = null;
						}else{
							//if curr is not the top root, we replace this one with the curr's child
							AccountBST temp = curr.right;
							if(turnedLeft){parent.left = temp;}
							else{parent.right = temp;}
						}
					}else if(curr.left != null){
						if(parent == null){
							root = curr.left.root;
							left = null;
						}else{
							AccountBST temp = curr.left;
							if(turnedLeft){parent.left = temp;}
							else{parent.right = temp;}

						}
					}

				}
				else{//curr has two children
					AccountBST SmallestChildOnRight = curr.right.getleftmost();
					remove(SmallestChildOnRight.root.getKey());
					//rightchild cannot be null because with isLeaf and hasOneChild called, we can be certain that curr has two children

					if(parent == null){
						//if this is the top root, we simply copy the root, there's no need to copy the left and right node
						root = SmallestChildOnRight.root;
					}else{
						//if curr is not the top root, replace the current one with the smallest child on the right, depending on if we turned left or right from the parent
						if(turnedLeft){
							parent.left.root = SmallestChildOnRight.root;

						}else{
							parent.right.root = SmallestChildOnRight.root;
						}

					}
				}
				break;
			}else if(key < curr.root.getKey()){
				parent = curr;
				curr = curr.left;
				turnedLeft = true;
			}else if(key > curr.root.getKey()){
				parent = curr;
				curr = curr.right;
				turnedLeft = false;
			}
		}
	}

	//an in-order traversal, it prints all the key and balance of all the AccountBST in this tree
	public void traverse(){
		if(root == null){return;}
		//if root is null, then there's nothing here, we simply return an empty string

		if(left != null){
		   left.traverse();
		}
		System.out.println(root.getKey() + " " + String.format("%.2f", root.getBalance()));
		if(right != null){
		  right.traverse();
		}
	}

	private void print(String s){
		System.out.print(s);
	}
	public void printTree() {
		if (right != null) {
				right.printTree(true, "");
		}
		printNodeValue();
		if (left != null) {
				left.printTree(false, "");
		}
		System.out.println();
	 }
	 private void printNodeValue(){
		if (root == null) {
				print("<null>");
		} else {
				System.out.print(root.getKey());
		}
		print("\n");
	 }
			// use string and not stringbuffer on purpose as we need to change the indent at each recursion
	 private void printTree(boolean isRight, String indent) {
		if (right != null) {
				right.printTree(true, indent + (isRight ? "        " : " |      "));
		}
		print(indent);
		if (isRight) {
				print(" /");
		} else {
				print(" \\");
		}
		print("----- ");
		printNodeValue();
		if (left != null) {
				left.printTree(false, indent + (isRight ? " |      " : "        "));
		}
	 }

}
