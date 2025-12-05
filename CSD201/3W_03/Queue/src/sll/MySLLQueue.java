
package sll;

public class MySLLQueue {
    Node front, rear;
    
    public void MySLLQueue(){
        front = rear = null;
    }
    
    public void enqueue(int x){
        // addLast
        Node p = new Node(x);
        if(front == null && rear == null){
            front = rear = p;
        } else{
            rear.next = p;
            rear = p;
        }
    }
    
    public Node dequeue(){
        // removeFirst
        if(front == null && rear == null){
            return null;
        }
        Node p = front;
        front = front.next;
        if(front == null){
            rear = null;
        }
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
            p.next = p;
        }
        System.out.println("");
    }
    
    public Node front(){
        Node p = front;
        if(front == null){
            return null;
        }
        return p;
    }
}
