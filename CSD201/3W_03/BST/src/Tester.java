
public class Tester {

    public static void main(String[] args) {
        MyBST bst = new MyBST();
        bst.insert(5);
        bst.insert(2);
        bst.insert(3);
        bst.insert(7);
        bst.breadth();
        bst.postOrder();
        bst.traverse();
    }
}
