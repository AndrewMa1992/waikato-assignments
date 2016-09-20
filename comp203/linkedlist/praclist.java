public class IntList{
    public Node head = null;
    public int length = 0;
    public IntList(){

    }

    public Boolean IsEmpty(){
        if (head == null) {
            return true;
        }
        else{
            return false;
        }
    }
    public Boolean Contain(Node nf){
        //Node temp = head;
        //while(temp != null && !temp.equals(nf)){
        //    temp = temp.next;
        //}
        //if (temp != null) {
        //    return true;
        //}
        //else {
        //    return false;
        //}

        if (IsEmpty()) {
            return false;
        }
        Node curr = head;
        while(curr != null){
            if (curr.equals(nf)) {
                return true;
            }
            curr = curr.next;
        }
        return false;
    }

    public IntList Append(IntList nlist){
        //IMPORTANT
        //IMPORTANT
        //IMPORTANT
        //IMPORTANT
        if (nlist == null) {
            throw new RuntimeException("nlist cannot be null");
        }
        if (IsEmpty()) {
            return nlist;
        }
        if (nlist.IsEmpty()) {
            return this;
        }
        Node temp = head;
        while(temp != null){
            temp = temp.next;
        }
        temp.next = nlist.head;
        length += nlist.length;
    }

    public void Add(int val){
        if (IsEmpty()) {
            head = newnode(val);
        }
        else {
            Node temp = head;
            head = new Node(val);
            head.next = temp;
        }
        length++;
    }

    public void Remove(Node toremove){
        if (IsEmpty()) {
            throw new Exception("IntList is IsEmpty");
        }
        if (head.equals(toremove)) {
            head = head.next;
        }
        Node curr = head;
        Node prev = null;
        //curr != toremove
        while(!curr.equals(toremove) && curr != null){
            prev = curr;
            curr = curr.next;
        }
        if (curr == null) {
            throw new Exception("nothing found to be deleted");
        }
        else {
            prev.next = curr.next;
        }
        length--;
    }

    public IntList qsort(){
        if (length <= 1) {
            return this;
        }
        Node pivot = head;
        IntList smaller = new IntList();
        IntList bigger = new IntList();

        Node curr = head.next;
        while(curr != null){
            if (curr.value < pivot.value) {
                smaller.Add(curr.value);
            }
            else {
                bigger.Add(curr.value);
            }
            curr = curr.next;
            //important
        }

        smaller = qsort(smaller);
        bigger = qsort(bigger);

        return smaller.Append(pivot.Append(bigger));
    }

    public void Insert(int val){
        if (IsEmpty()) {
            head = new Node(val);
            return;
        }
        if (head.value > val) {
            head = new Node(val,head);
            return;
        }
        Node curr = head;
        Node prev = null;
        while(curr != null && curr.value < val){
            prev = curr;
            curr = curr.next;
        }
        if (curr == null) {
            prev.next = new Node(val);
        }
        else{
            //prev.next = new Node(val);
            prev.next = new Node(val,curr);
        }
    }

    public IntList isort(){
        Node curr = head;
        IntList newlist = new IntList();

        while(curr != null){

            newlist.Insert(curr);
            curr = curr.next;

        }
        this = newlist;
        return this;

    }
}


