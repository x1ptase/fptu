public class FlightCLL { //Implement Singly Linked List
    Node tail;
    int size = 0;
    
    public FlightCLL(){
        tail = null;
    }
    
    //1 diem
    void addFirst(Flight f){
        if(f.getStatus() == -1 || f.getStatus() == 0 || f.getStatus() == -1 && (f.getPrice() > 0)){
            Node p = new Node(f, null);
            if(tail == null){
                tail = p;
            } else{
                p.next = tail;
                tail = p;
            }
        }
    }
    //1 diem
    void addFirst1(String code, String from, String to, int status, double price){
        if(status == -1 || status == 0 || status == -1 && (price > 0)){
            Flight flight = new Flight(code, from, to, status, price);
            Node p = new Node(flight, null);
            if(tail == null){
                tail = p;
            } else{
                p.next = tail;
                tail = p;
            }
            size++;
        }
    }
    //1 diem
    void traverse(){
        Node p = tail;
        while(p != null){
            System.out.println(p.infor);
            p = p.next;
        }
    }
    
    public Node getCheapestFlight(){ //Tim chuyen bay co gia re nhat
        if(tail == null){
            return null;
        }
        Node p = tail.next;
        while(p != null){
            if(p.infor.getPrice() < tail.infor.getPrice()){
                tail = p;
            }
            p = p.next;
        }
        return tail;
    }
}
