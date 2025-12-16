
class NodeDLL {
    Flight infor;
    NodeDLL prev, next;
    
    public NodeDLL(){
        
    }
    
    public NodeDLL(Flight f){
        this.infor = f;
        this.next = null;
        this.prev = null;
    }
    
    public NodeDLL (Flight f, NodeDLL prev, NodeDLL next){
        this.infor = f;
        this.prev = prev;
        this.next = next;
    }
}
public class FlightDLL { //Implement Singly Linked List
    Node header, trailer;
    int size = 0;
    
    public FlightDLL(){
        header = trailer = null;
    }
    
    //1 diem
    void addFirst(Flight f){
        
    }
    //1 diem
    void addFirst1(String code, String from, String to, int status, double price){
        
    }
    //1 diem
    void traverse(){
        
    }
    
    public Node getCheapestFlight(){ //Tim chuyen bay co gia re nhat
        
        return null;
    }
    
}
