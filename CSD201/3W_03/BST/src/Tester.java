
public class Tester {

    public static void main(String[] args) {
        MyBST bst = new MyBST();
        bst.insert(new Flight("VN5001", "SGN", "LTH", 1, 200)); 
        bst.insert(new Flight("VN5005", "SGN", "LTH", 3, 200)); 
        bst.insert(new Flight("VN5001", "SGN", "LTH", 0, -200)); 
        bst.insert(new Flight("VN5005", "HAN", "HUI", -1, 100)); 
        bst.insert(new Flight("VN3000", "DAD", "CAN", 0, 300));
        
        System.out.print("Breadth: ");
        bst.breadth();
        
        System.out.print("PreOrder: ");
        bst.preOrder();
        
        System.out.print("InOrder: ");
        bst.inOrder();
        
        System.out.print("PostOrder: ");
        bst.postOrder();
    }
}
