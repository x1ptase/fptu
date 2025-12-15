public class Node {
    Flight info;
    Node left, right, next;

    public Node() {
    }

    public Node(Flight info) {
        this.info = info;
        left = null;
        right = null;
        next = null;
    }   
}
