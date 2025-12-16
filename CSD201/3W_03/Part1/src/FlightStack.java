

public class FlightStack {
    Node top;
    
    public FlightStack(){
        top = null;
    }
    
    public void push(Flight f){//addFirst()
        if(f.getStatus() == - 1 || f.getStatus() == 0 || f.getStatus() == 1 && (f.getPrice() > 0)){
            Node p = new Node(f, null);
            if(top == null){
                top = p;
            } else{
                p.next = top;
                top = p;
            }
        }
    }
    
    public void pushLast(Flight f){//addLast()
        
    }
    
    public Node pop(){//removeFirst()
        if(top == null){
            return null;
        }
        Node p = top;
        top = top.next;
        p.next = null;
        return p;
    }
    
     public Node top(){
        if(top == null){
            return null;
        }
        return top;
    }
     
        
    public void traverse(){
        Node p = top;
        while(p != null){
            System.out.println(p.infor);
            p = p.next;
        }
    }
    
    public Node getCheapestFlight(){ //Tim chuyen bay co gia re nhat
        if(top == null){
            return null;
        }
        Node p = top.next;
        while(p != null){
            if(p.infor.getPrice() < top.infor.getPrice()){
                top = p;
            }
            p = p.next;
        }
        return top;
    }
}
