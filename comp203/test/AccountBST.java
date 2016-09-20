//id:1260430 name:bruce tan
public class AccountBST{
	private Account root = null;
	private AccountBST left = null;
	private AccountBST right = null;

	public AccountBST(){

	}

	public AccountBST(Account root1){
		//we don't throw error if the parameter is null in this case, because root is null by default anyway, and it doesn't crash the program
		root = root1;
	}

	public Account find(int key){
	  if (root == null) {
	    return null;
	  }
	  if (key > root.getKey() && right != null) {
	    return right.find(key);
	  }else if(key < root.getKey() && left != null){
	    return left.find(key);
	  }else if(key == root.getKey()){
	    return root;
	  }
	  return null;
	}

	public void insert(int key,float balance){
	  if (root == null) {
	    root = new Account(key,balance);return;
	  }
	  if (key >= root.getKey()) {
	    if (right == null) {
	      right = new AccountBST(new Account(key,balance));
				return;
	    }else{
	      right.insert(key,balance);
	    }
	  }else if(key < root.getKey()){
	    if (left == null) {
	      left = new AccountBST(new Account(key,balance));
				return;
	    }else{
	      left.insert(key,balance);
	    }
	  }

	}

	public void remove(int key){
	  if (root == null) {
	    return;
	  }
	  if (key > root.getKey() && right != null) {
	    if (right.left == null && right.right == null && right.root.getKey() == key) {
	      right = null;return;
	    }else{
	      right.remove(key);
	    }
	  }else if(key < root.getKey() && left != null){
	    if (left.left == null && left.right == null && left.root.getKey() == key) {
	      left = null;return;
	    }else{
	      left.remove(key);
	    }
	  }else if(root.getKey() == key){
	    if (right == null) {
	      root = left.root;
				right = left.right;
	      left = left.left;
	    }else{
				//AccountBST ac = right.min();
	      Account ac = right.min().root;
				//remove(ac.root.getKey());
				//remove(ac);
				remove(ac.getKey());
	      root = ac;
	    }
	  }
	}

	private AccountBST min(){
		if (left != null) {
			return left.min();
		}
		return this;
	}

	public void rotate(AccountBST parent,AccountBST child){
		AccountBST grandparnet = getparent(parent);
		if (grandparnet.left == parent) {

		}
	}

	private AccountBST getparent(AccountBST n){
		AccountBST temp;
		if (left != null) {
			if (left == n) {
				return n;
			}else{
				temp = left.getparent(n);
				if (temp != null) {
					return temp;
				}
			}

		}else if (right != null) {
			if (right == n) {
				return n;
			}else{
				temp = right.getparent(n);
				if (temp!= null) {
					return temp;
				}
			}
		}
		return null;
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
