
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
        if(f.getStatus() == -1 || f.getStatus() == 0 || f.getStatus() == -1 && (f.getPrice() > 0)){
            Node p = new Node(f, null);
            if(header == null){
                header = trailer = p;
            } else{
                p.next = header;
                header = p;
            }
            size ++;
        }
    }
    //1 diem
    void addFirst1(String code, String from, String to, int status, double price){
        if(status == -1 || status == 0 || status == 1 && (price > 0)){
            Flight flight = new Flight(code, from, to, status, price);
            Node p = new Node(flight, null);
            if(header == null){
                header = trailer = p;
            } else{
                p.next = header;
                header = p;
            }
            size++;
        }
    }
    //1 diem
    void traverse(){
        Node p = header;
        while(p != null){
            System.out.println(p.infor);
            p = p.next;
        }
    }
    
    public Node getCheapestFlight(){ //Tim chuyen bay co gia re nhat
        if(header == null){
            return null;
        }
        Node p = header.next;
        while(p != null){
            if(p.infor.getPrice() < header.infor.getPrice()){
                header = p;
            }
            p = p.next;
        }
        return header;
    }
    
}
