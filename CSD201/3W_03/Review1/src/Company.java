
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
        
    }
    
    public void addPosition(Event event, int pos){
        
    }
              
    public Node removeFirst(){
        Node p = head;
        
        return p;
    }
    
    public sll SortByMonthAsc(){
        
        return null;
    }
    
    public void traverse(){
        
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
        
    }
    
    public Node top(){
        
        return null;
    }
    
    public Node pop(){
        
        return null;
    }
    
    public int countEventByLocation(String location){
        int count = 0;

        return count;
    }
    
    public void traverse(){
        
    }
}

