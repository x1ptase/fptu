package dll;

public class Node {
    String infor;
    Node prev, next;
    
    public Node(){
    }
    
    public Node(String infor){
        this.infor = infor;
        this.prev = this.next = null;
    }
}
