


public class Company {
    sll sList = new sll();
    MyStack myStack = new MyStack();
    
    public Company(){
    }
}

class sll{
    Node head, tail;
    
    public sll(){
        this.head = null; 
    }

    public boolean isEmpty(){
        return head == null;
    }
    
    /* 
    * add 1 event into single linked list
    * month is valid
    * location not empty
    */
    public void addFirst(Event event){
        if((event.getMonth() < 1 || event.getMonth() > 12)
            || (event.getLocation() == null || event.getLocation().trim().isEmpty())){
            return;
        }
        Node p = new Node(event, null);
        if(isEmpty()){
            head = tail = p;
        } else{
            p.next = head;
            head= p;
        }
    }
    
    
    // list start = 0
    public void addPosition(Event event, int pos){
        if((event.getMonth() < 1 || event.getMonth() > 12)
            || (event.getLocation() == null || event.getLocation().trim().isEmpty())){
            return;
        }
        if(pos < 0){
            return;
        }
        Node p = new Node(event, null);
        // TH 1: = 0
        if(pos == 0){
            if(isEmpty()){
                head = tail = p;
            } else{
                p.next = head;
                head = p;
            }
        }
        // TH 2: > 0
        Node current = head;
        int index = 0;
        while(current != null && index < pos - 1){
            current = current.next;
            index++;
        }
        
        if(current == null){
            return;
        }
        p.next = current.next;
        current.next = p;

        if (p.next == null) {
            tail = p;
        }
    }
              
    public Node removeFirst(){
        if(isEmpty()){
            return null;
        }
        Node p = head;
        head = head.next;
        if(head == null){
            tail = null;
        }
        p.next = null;
        return p;
    }
    
    public sll SortByMonthAsc(){
        if(head == null || head.next == null){
            return this;
        }
        boolean swapped;
        Node lastSorted = null;
        do{
            swapped = false;
            Node p = head;
            while(p.next != lastSorted){
                int month1 = p.info.getMonth();
                int month2 = p.next.info.getMonth();
                if(month1 > month2){
                    Event tmp = p.info;
                    p.info = p.next.info;
                    p.next.info = tmp;
                    swapped = true;
                }
                p = p.next;
            }
            lastSorted = p;
        } while(swapped); 
    return this;
}
    
    public void traverse(){
        Node p = head;
        while(p != null){
            System.out.println(p.info);
            p = p.next;
        }
    }
}

class MyStack{
    Node top;
    
    public MyStack(){
        top = null;
    }
    
    public boolean isEmpty(){
        return top == null;
    }
    
    /* 
    * add 1 event into single linked list
    * month is valid
    * location not empty
    */
    public void push(Event event){
        if((event.getMonth() < 1 || event.getMonth() > 12)
            || (event.getLocation() == null || event.getLocation().trim().isEmpty())){
            return;
        }
        Node p = new Node(event, null);
        if(isEmpty()){
            top = p;
        } else{
            p.next = top;
            top = p;
        }
    }
    
    public Node top(){
        if(isEmpty()){
            return null;
        }
        return top;
    }
    
    public Node pop(){
        if(isEmpty()){
            return null;
        }
        Node p = top;
        top = top.next;
        p.next = null;
        return p;
    }
    
    public int countEventByLocation(String location){
        int count = 0;
        if(location == null || location.trim().isEmpty()){
            return 0;
        }
        String forwardString = location.trim().toUpperCase();
        
        Node p = top;
        while(p != null){
            if(p.info.getLocation() != null && p.info.getLocation().trim().toUpperCase().equals(forwardString)){
                count++;
            }
            p = p.next;
        }
        return count;
    }
   
    public void traverse(){
        Node p = top;
        while(p != null){
            System.out.println(p.info);
            p = p.next;
        }
    }
}

