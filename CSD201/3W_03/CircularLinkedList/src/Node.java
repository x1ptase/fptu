public class Node{
    Jewelry info;
    Node prev, next;

    public Node() {
    }

    public Node(Jewelry info, Node prev, Node next) {
        this.info = info;
        this.next = next;
    }

    public Node(Jewelry info, Node next) {
        this.info = info;
        this.next = next;
    }
}