
public class Tester {

    public static void main(String[] args) {
        MyBST bst = new MyBST();
        bst.insert(new Flight("VN5001", "SGN", "LTH", 1, 200));
        bst.insert(new Flight("VN5005", "SGN", "LTH", 3, 200));
        bst.insert(new Flight("VN5001", "SGN", "LTH", 0, -200));
         
        bst.postOrder();
    }
}
