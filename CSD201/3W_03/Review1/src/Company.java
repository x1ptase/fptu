
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
        
        return null;
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
        if(location == null){
            return 0;
        }
        Node p = top;
        while(p != null){
            if(p.info.getLocation() != null){
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

