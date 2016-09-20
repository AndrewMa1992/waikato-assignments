import java.lang.Math;
public class AccountAVLBST{
	private Account root = null;
	private AccountAVLBST left = null;
	private AccountAVLBST right = null;

	public AccountAVLBST(){
		
	}

	public AccountAVLBST(Account root1){
		root = root1;
	}

	private int Height(){
		p(this);
		print("height");
		if(isLeaf()){print("leaf");return 0;}
		else {  
			return 1+ Math.max( (left == null)?0:left.Height(), (right==null)?0:right.Height());
		}
	}

	private int balancefactor(AccountAVLBST ac){
		print("balance factor");
		p(this);
		int lefth = -1;
		int righth = -1;//-1 for null child nodes
		if(!isLeaf()){
			if(left != null){
				lefth = left.Height();
				
			}
			if(ac.right != null){
				righth = right.Height();
			}
		}
		int balancedFactor = Math.abs(lefth - righth);
		return balancedFactor;
	}

	private void rebalance(AccountAVLBST ac){
		
	}

	private void rotateRight(AccountAVLBST parent, AccountAVLBST child){
		
	}
	
	public AccountAVLBST getParent(AccountAVLBST child){
		if(right != null){
			if(right == child){
				return this;
			}else{
				 return right.getParent(child);
			}
		}else if(left != null){
			if(left == child){
				return this;
			}else{
				return left.getParent(child);
			}
		}
		return null;
	}

	public void p(AccountAVLBST a){
		if(a != null){System.out.print(a.root.getKey());}else{System.out.println(a.toString() + "is null");}
		if(left != null){System.out.println(" left " + a.left.root.getKey());}
		if(right != null){System.out.println(" right "+a.right.root.getKey());}
	}

	
	public void swap(AccountAVLBST parent, AccountAVLBST child){

		if(parent.left != child && parent.right != child){throw new RuntimeException("sencond paremter is not the child of the first parameter for swap function");}

		int pkey = parent.root.getKey();
		float pbalance = parent.root.getBalance();
		int ckey = child.root.getKey();
		float cbalance = child.root.getBalance();

		AccountAVLBST grandparent = getParent(parent);

		if(parent.left == child){
			AccountAVLBST childLeft = child.left;
			if(grandparent != null){
				grandparent.left = child;
				grandparent.left.left = parent;
				grandparent.left.left.left = childLeft;
				
			}else{	
				root.setKey(ckey);
				root.setBalance(cbalance);
				left.root.setKey(pkey);
				left.root.setBalance(pbalance);
				left.left = childLeft;
				
			}
			
		}else{
			AccountAVLBST childRight = child.right;
			if(grandparent != null){
				grandparent.right = child;
				grandparent.right.right = parent;
				grandparent.right.right.right = childRight;
			}else{
				root.setKey(ckey);
				root.setBalance(cbalance);
				right.root.setKey(pkey);
				right.root.setBalance(pbalance);
				right.right = childRight;
			}
		}
	}

	//return the reference of Account with respect to the key, return null if nothing can be found
	public Account find(int key){
		if(root == null){ 
			
		} //if root is null, it means this is an empty binary tree, it returns the default value of ac, which is null
		else if(key == root.getKey()){
			return root;
		}
		else if(key < root.getKey() && left != null){
			return left.find(key);
		}
		else if (key > root.getKey() && right != null){ 
			return right.find(key);
		}
		//if it is leaf, and it's key does not equal to the parameter keyit returns null, by default
		return null;
	}
	//balanced insert, it inserts a new AccountAVLBST into the tree with key and balance used for creating the Account of it
	//I initially created the balanced insert, but then I realised it's not necessary after rereading the specification.
	//Since I don't wanna delete my fruitful work, so I'll just leave it here
	public void binsert(int key, float balance){
		if(root == null){root = new Account(key,balance);return;}

		AccountAVLBST curr = this;
		AccountAVLBST parent = null;
		while(true){
			if(key < curr.root.getKey()){
				if(parent !=null){
					if(key > parent.root.getKey()){
						//insert the new key between the parentious (which is smaller than curr) and curr (which is bigger than curr)
						parent.right = new AccountAVLBST(new Account(key,balance));
						parent.right.right = curr;
						//set curr to the biggest leaf to its right side for further rebalancing 
						curr = getBiggestLeaf(parent);
						break;
					}
					else{
						
					}
				}
				//insert new key if there's no left child
				if(curr.left == null){
					curr.left = new AccountAVLBST(new Account(key,balance));
					break;
				}else{
					parent = curr;
					curr = curr.left;
				}
			}
			else{// key >= curr.root.getKey()
				if(parent !=null){
					if(key < parent.root.getKey()){
						//insert the new key between the parentious (which is bigger than curr) and curr (which is smaller than curr)
						parent.left = new AccountAVLBST(new Account(key,balance));
						parent.left.left = curr;
						//set curr to the smallest leaf to its right side for further rebalancing 
						curr = getSmallestLeaf(parent);
						break;
					}
					else{
						
					}
				}
				//insert new key if there's no right child
				if(curr.right == null){
					curr.right = new AccountAVLBST(new Account(key,balance));
					break;
				}else{
					parent = curr;
					curr = curr.right;
				}
			}
		}

		AccountAVLBST parent = null;
		
		while((parent = getParent(curr)) != null){
			if(Math.abs(balancefactor(curr)) > 1){
				
				if(curr.left.left.root.getKey() == key){//left of left subtree
					rotateright(curr);
				}
				if(curr.right.right.root.getKey() == key){//right of right subtree
					rotateleft(curr);
				}
				if(curr.right.left.root.getKey() == key){//left of right subtree
					rotateright(curr);
				}
				if(curr.left.right.root.getKey() == key){//right of left subtree
					rotateright(curr);
				}
			}

			curr = parent;
		}
	}
	//non-balanced insert, it inserts a new AccountAVLBST into the tree with key and balance used for creating the Account of it
	public void insert(int key, float balance){
		if(root == null){root = new Account(key,balance);return;}

		AccountAVLBST curr = this;
		while(true){
			if(key < curr.root.getKey()){
				//insert new key if there's no left child
				if(curr.left == null){
					curr.left = new AccountAVLBST(new Account(key,balance));
					curr = curr.left;//set curr to the new leaf so as to get ready for rebalance checking later
					break;
				}else{
					curr = curr.left;
				}
			}
			else{// key >= curr.root.getKey()
				//insert new key if there's no right child
				if(curr.right == null){
					curr.right = new AccountAVLBST(new Account(key,balance));
					
					curr = curr.right;
					break;
				}else{
					curr = curr.right;
				}
			}
		}
		
	}

	private void rotateright(AccountAVLBST curr){
		AccountAVLBST parent = getParent(curr);
		int key = curr.root.getKey();
		float balance = curr.root.getBalance();
		if(parent != null){
			if(parent.left == curr){
				parent.left = parent.left.left;
				parent.left.right = new AccountAVLBST(new Account(key,balance));
			}else{
				p(curr);
				throw new RuntimeException("parent.left != curr for rotateright");
			}
		}else{
			left = left.left;
			left.right = new AccountAVLBST(new Account(key,balance));
		}	
	}

	private void rotateleft(AccountAVLBST curr){
		AccountAVLBST parent = getParent(curr);
		int key = curr.root.getKey();
		float balance = curr.root.getBalance();
		if(parent != null){
			if(parent.right == curr){
				parent.right = parent.right.right;
				parent.right.left = new AccountAVLBST(new Account(key,balance));
			}else{
				p(curr);
				throw new RuntimeException("parent.right != curr for rotateleft");
			}
		}else{
			right = right.right;
			right.left = new AccountAVLBST(new Account(key,balance));
		}
	}

	//find the smallest child on the right side of this AcountBST, and return it
	//if this has no right child, it returns null
	private AccountAVLBST getSmallestLeaf(){
		if(left != null){
			return left.getSmallestLeaf();
		}
		return this;
		//if left == null, it means we've found the smallest node, it returns this by default
	}

	private AccountAVLBST getBiggestLeaf(){
		if(right != null){
			return right.getBiggestLeaf();
		}
		return this;
		//if left == null, it means we've found the smallest node, it returns this by default
	}
	
	//return true is this AccountAVLBST has no children, that is left and right are both null
	private Boolean isLeaf(){
		if(left == null && right == null){
			return true;
		}
		else{return false;}
	}

	//return true if this AccountAVLBST has only one child, either left or right
	private Boolean hasOneChild(){
		if(left == null && right != null){return true;}
		else if(left != null && right == null){return true;}
		else {return false;}
	}

	//remove the node in the BT with respect to parameter key, do nothing if nothing can be deleted
	public void remove(int key){
		AccountAVLBST curr = this;
		AccountAVLBST parent = null;
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
							AccountAVLBST temp = curr.right;
							if(turnedLeft){parent.left = temp;}
							else{parent.right = temp;}
						}
					}else if(curr.left != null){
						if(parent == null){
							root = curr.left.root;
							left = null;
						}else{
							AccountAVLBST temp = curr.left;
							if(turnedLeft){parent.left = temp;}
							else{parent.right = temp;}
							
						}
					}
					
				}
				else{//curr has two children
					AccountAVLBST SmallestChildOnRight = curr.right.getSmallestLeaf();
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

	//an in-order traversal, it returns the String of key and balance of all the AccountAVLBST in this tree
	public String traverseAccount(){
		
		String s = "";
		if(root == null){return s;}
		//if root is null, then there's nothing in the tree, we simply return an empty string

		if(left != null){
		   s = s + left.traverseAccount();
		}
		s += root.getKey()+" ";
		s += root.getBalance()+"\n";
		if(right != null){
		   s = s + right.traverseAccount();
		}
		return s;
	}

	//a in-order traverse that it return the string containing the keys from root to the target, separated by space
	public String traverseTarget(Account target){
		if(target == null){throw new RuntimeException("target cannot be null for traverseTarget function");}

		String s = "";
		if(root == null){return s;}

		if(target.getKey() < root.getKey() && left != null){
		   s = s + left.traverseTarget(target);
		}

		s += root.getKey();
		s += " ";
		
		
		if(target.getKey() > root.getKey() && right != null){
		   s = s + right.traverseTarget(target);
		}
		return s;
	}

	public void traverse(){
		if(root == null){return;}

		if(left != null){
			
		   left.traverse();
			System.out.print("left ");
			
		}
		System.out.println(root.getKey());

		if(right != null){
			System.out.print("right ");
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


