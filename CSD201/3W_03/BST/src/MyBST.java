public class MyBST {
    Node root;
    
    public MyBST(){
        root = null;
    }
    
    public boolean isEmpty(){
        return root == null;
    }
    
    public void insert(int x){
        Node p = new Node(x);
        if(isEmpty()){
            root = p;
        } else{
            Node current = root;
            while(true){
                if(x == current.info){
                    return;
                }
                if(x < current.info){
                    if(current.left == null){
                        current.left = p;
                        return;
                    }
                    current=current.left;
                } else{
                    if(current.right == null){
                        current.right=p;
                        return;
                    }
                    current=current.right;
                }
            }
        }
    }
    
    public void breadth(){
        
    }
    
    public void preOrder(){
        
    }
    
    public void inOrder(){
        
    }
    
    public void postOrder(){
        
    }
}
