public class Node {
    Event info;
    Node next;
    
    public Node(){
    }
    
    public Node(Event info, Node next){
        this.info = info;
        this.next = next;
    }
}
