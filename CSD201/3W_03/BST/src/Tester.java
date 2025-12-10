
public class Tester {

    public static void main(String[] args) {
        MyBST bst = new MyBST();
        bst.insert(5);
        bst.insert(9);
        bst.insert(3);
        bst.insert(7);
        bst.breadth();
        bst.postOrder();
    }
}
