
public class MySLL {

    Node head, tail;
    int size;

    public MySLL() {
        head = tail = null;
        size = 0;
    }

    public boolean isEmpty() {
        return head == null;
    }

    public void clear() {
        head = null;
    }

    public void addFirst(Student student) {
        if (student.getName() != null && student.getAge() >= 18 && student.getAge() <= 25) {
            Node p = new Node(student, null);
            if (isEmpty()) {
                head = tail = p;
            } else {
                p.next = head;
                head = p;
            }
            size++;
        }
    }

    public void addLast(Student student) {
        if (student.getName() != null && student.getAge() >= 18 && student.getAge() <= 25) {
            Node p = new Node(student, null);
            if (isEmpty()) {
                head = tail = p;
            } else {
                tail.next = p;
                tail = p;
            }
            size++;
        }
    }

    public void traverse() {
        Node p = head;
        while (p != null) {
            System.out.println(" " + p.info);
            p = p.next;
        }
    }
}
