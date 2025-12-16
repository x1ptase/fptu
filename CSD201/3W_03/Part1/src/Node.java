class Node {
    Flight infor;
    Node next;
    
    public Node(){
        
    }
    
    public Node(Flight f){
        this.infor = f;
        this.next = null;
    }
    
    public Node (Flight f, Node next){
        this.infor = f;
        this.next = next;
    }
}