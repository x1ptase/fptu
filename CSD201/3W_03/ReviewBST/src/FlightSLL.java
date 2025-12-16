class Node{
    Flight info;
    Node next;
    
    public Node(){
    }
    
    public Node(Flight flight){
        this.info = flight;
        this.next = null;
    }
    
    public Node(Flight flight, Node next){
        this.info = flight;
        this.next = next;
    }
}
public class FlightSLL {
    Node head, tail;
    int size = 0;
    
    public FlightSLL(){
        head = tail = null;
    }
}
