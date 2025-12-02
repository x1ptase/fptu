
import java.util.List;

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
        String anotherString = " ";
        if (!student.getName().isEmpty() && student.getAge() >= 18 && student.getAge() <= 25 && !student.getName().startsWith(anotherString)) {
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
        String anotherString = " ";
        if (!student.getName().isEmpty() && student.getAge() >= 18 && student.getAge() <= 25 && !student.getName().startsWith(anotherString)) {
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

    public void removeFirst() {
        if (isEmpty()) {
            return;
        }
        head = head.next;
        if (head == null) {
            tail = null;
        }
        size--;
    }

    public void removeLast() {
        if (isEmpty()) {
            return;
        }
        if (head == tail) {
            head = tail = null;
        } else {
            Node p = head;
            while (p.next != tail) {
                p = p.next;
            }
            p.next = null;
            tail = p;
        }
        size--;
    }

    // tinh trung binh cong tuoi cua cac sinh vien co trong danh sach    
    public double avgAge(List<Student> students){
        if(students.isEmpty()){
            return 0;
        }
        
        double totalAge=0;
        for(Student student : students){
            totalAge += student.getAge();
        }
        
        return totalAge / students.size();
    }

    public Node search(Student student) {
        Node p = head;
        while (p != null) {
            if (p.info == student) {
                return p;
            }
            p = p.next;
        }
        return null;
    }

    public void traverse() {
        Node p = head;
        while (p != null) {
            System.out.println(" " + p.info);
            p = p.next;
        }
    }
}
