public class test{

	public static void main(String[] args){
		AccountBST ac = new AccountBST();
		ac.insert(6,(float)2);
		ac.insert(3,(float)2);
		ac.insert(4,(float)2);
		ac.insert(2,(float)2);
		ac.insert(8,(float)2);
		ac.insert(7,(float)2);
		ac.insert(9,(float)2);
		ac.insert(10,(float)2);

		ac.printTree();
		ac.remove(6);
		ac.printTree();
		ac.remove(3);
		ac.printTree();
		ac.remove(4);
		ac.printTree();
		ac.remove(8);
		ac.printTree();
		// ac.remove(9);
		// ac.printTree();
		// ac.remove(7);
		// ac.printTree();
		// ac.remove(2);
		// ac.printTree();

		//ac.traverse();

		//ac.swap(ac2,ac3);
		//ac.traverse();
		//ac.traverse();
	}
}
