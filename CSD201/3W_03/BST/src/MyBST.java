public class MyBST {
    Node root;
    Node front, rear;
    
    public MyBST(){
        root = null;
    }
    
    public boolean isEmpty(){
        return root == null;
    }
    
    public void enqueue(Node p){
        if(front == null && rear == null){
            front = rear = p;
        } else{
            rear.next = p;
            rear = p;
        }
    }
    
    public Node dequeue(){
        if(front == null){
            return null;
        }
        Node p = front;
        front = front.next;
        if(front == null){
            rear = null;
        }
        p.next = null;
        return p;
    }
    
    public void insert(Flight flight){
        if((flight.getPrice() <= 0) 
                && (flight.getStatus() < -1 || flight.getStatus() > 1)
                && (flight.getFlightCode() == null || flight.getFlightCode().trim().isEmpty())){
            return;
        }
        Node p = new Node(flight);
        if(isEmpty()){
            root = p;
            return;
        }
        Node current = root;
        Node parent = null;
        while(current != null){
            parent = current;
            int comparison = flight.getFlightCode().compareTo(current.info.getFlightCode());
            
            if(comparison < 0){
                current = current.left; 
            } else if(comparison > 0){
                current = current.right; 
            } else {
                return; 
            }
        }
        if(flight.getFlightCode().compareTo(parent.info.getFlightCode()) < 0){
            parent.left = p;
        } else {
            parent.right = p;
        }
    }
    
    private void visit(Node p){
        System.out.print(p.info + " ");
    }
    
    public void breadth(){
        if(root == null){
            return;
        }
        front = rear = null;
        enqueue(root);
        
        Node p;
        while(front != null){ 
            p = dequeue();
            visit(p);
            
            if(p.left != null)
                enqueue(p.left);
            if(p.right != null)
                enqueue(p.right);
        }
        System.out.println();
    }
    
    public void preOrder(){
        preOrder(root);
        System.out.println();
    }
    private void preOrder(Node p){
        if(p == null){
            return;
        }
        visit(p);
        preOrder(p.left);              
        preOrder(p.right);              
    }
    
    public void inOrder(){
        inOrder(root);
        System.out.println();
    }
    private void inOrder(Node p){
        if(p == null){
            return;
        }
        inOrder(p.left);                
        visit(p);
        inOrder(p.right);               
    }
    
    public void postOrder(){
        postOrder(root);
        System.out.println();
    }
    private void postOrder(Node p){
        if(p == null){
            return;
        }
        postOrder(p.left);            
        postOrder(p.right);             
        visit(p);
    }
}
