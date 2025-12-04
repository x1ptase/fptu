public class Node {
    Course info;
    Node next, prev;

    public Node() { // Doubly Linked List
    }

    public Node(Course info, Node next) { // Single Linked List and Stack
        this.info = info;
        this.next = next;
    }

    public Node(Course course) { // Doubly Linked List
        this.info = course;
        prev = next = null;
    }
    
    
}
