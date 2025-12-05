
package dll;


public class MyDLLQueue {
    Node front, rear;
    
    public MyDLLQueue(){
        front = rear = null;
    }
    
    public void enqueue(char c){
        // addFirst
        Node p = new Node(c);
        if(front == null && rear == null){
            front = rear = p;
        } else{
            p.next = front;
            front.prev = p;
            front = p;
        }
    }
    
    public Node dequeue(){
        // removeLast
        if(front == null && rear == null){
            return null;
        }
        Node p = rear;
        if(front == rear){
            front = rear = null;
        } else{
            rear = rear.prev;
            rear.next = null; 
        }
        p.prev = null;
        return p;
    }
    
    public void traverse(){
        Node p = front;
        while(p != null){
            System.out.print(p.infor + "; ");
            p = p.next;
        }
        System.out.println("");
    }
    
    public void reverseTraverse(){
        Node p = rear;
        while(p != null){
            System.out.print(p.infor + "; ");
            p = p.prev;
        }
        System.out.println("");
    }
    
    public Node front(){
        // return the front element without remove
        Node p = rear;
        if(front == null){
            return null;
        }
        return p;
    }
}