package dll;

public class Node {
    char infor;
    Node prev, next;
    
    public Node(){
    }
    
    public Node(char infor){
        this.infor = infor;
        this.prev = this.next = null;
    }
}
