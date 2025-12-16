
public class FlightSLL { //Implement Singly Linked List

    Node head, tail;
    int size = 0;

    public FlightSLL() {
        head = tail = null;
    }

    //1 diem
    void addFirst(Flight f) {
        if (f.getStatus() == -1 || f.getStatus() == 0 || f.getStatus() == 1 && (f.getPrice() > 0)) {
            Node p = new Node(f); //Node p = new Node (f, null);
            if (head == null) {
                head = tail = p;

            } else {
                p.next = head;
                head = p;
            }
            size++;
        }

    }

    //1 diem
    void addFirst1(String code, String from, String to, int status, double price) {
        if(status == -1 || status == 0 || status == 1 && (price > 0)){
            Flight flight = new Flight(code, from, to, status, price);
            Node p = new Node(flight, null);
            if(head == null){
                head = tail = p;
            } else{
                p.next = head;
                head = p;
            }
            size++;
        }
    }

    //1 diem
    void traverse() {
        Node p = head;
        while(p!= null){
            System.out.println(p.infor.toString());
            p = p.next;
        }
    }

    public Node getCheapestFlight() { //Tim chuyen bay co gia re nhat
        if(head == null){
            return null;
        }
        Node p = head.next;
        while(p != null){
            if(p.infor.getPrice() < head.infor.getPrice()){
                head = p; 
            }
            p = p.next;
        }
        return head;
    }
}
