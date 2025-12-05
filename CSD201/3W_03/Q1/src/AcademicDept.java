
//public class AcademicDept {
/**
 * Semester [1 - 9]
 * Credit [2 - 10]
 * Campus [HCM, HN, CT, DN, QN]
 */
public class AcademicDept {

    MySLL sList = new MySLL();
    MyDLL dList = new MyDLL();
    MyCLL cList = new MyCLL();
    MyStack stack = new MyStack();

    public AcademicDept() {
    }
}

class MySLL {

    Node head, tail;

    public MySLL() {
        head = tail = null;
    }

    public void addLast(String cName, String campus, int credit) {
        // Add courses with 3 attributes
        Course course = new Course(cName, campus, credit);

        Node p = new Node(course, null);
        if (head == null) {
            head = tail = p;
        } else {
            tail.next = p;
            tail = p;
        }
    }

    public Node removeFirst() {
        if (head == null) {
            return null;
        }
        Node p = head;
        head = head.next;
        if (head == null) {
            tail = null;
        }
        return p;
    }

    public MySLL sortCourseByCreditDesc() {
        // Sort courses following credit desc
        if (head == null || head.next == null) {
            return this;
        }
        Node current = head;
        while (current != null) {
            Node maxNode = current;
            Node p = current.next;

            while (p != null) {
                int currentMaxCredit = maxNode.info.getCredit();
                int pCredit = p.info.getCredit();
                
                if (pCredit > currentMaxCredit) {
                    maxNode = p; 
                }
                p = p.next;
            }

            if (maxNode != current) {
                Course tmp = current.info;
                current.info = maxNode.info;
                maxNode.info = tmp;
            }
            current = current.next; 
        }
        return this; 
    }

    public void traverse() {
        Node p = head;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }
}

class MyCLL {

    Node tail;

    public void MyCLL() {
        tail = null;
    }

    public void addLast(String courName, int semester, String campus) {
        // Add
        Course course = new Course(courName, semester, campus);
        Node p = new Node(course, null);
        
        if(tail == null){
            tail = p;
            tail.next = tail;
        } else{
            p.next = tail.next;
            tail.next = p;
            tail = p;
        }
    }

    public void traverse() {
        if (tail == null) {
            return;
        }
        Node p = tail.next;
        do {
            System.out.println(p.info);
            p = p.next;
        } while (p != tail.next);
    }
}

class MyDLL {

    Node header, trailer;

    public MyDLL() {
        header = trailer = null;
    }

    public void addFirst(Course course) {
        Node p = new Node(course);
        if(header == null){
            header = trailer = p;
        } else{
            p.next = header;
            header.prev = p;
            header = p;
        }
    }

    public Node removeLast() {
        if(header == null){
            return null;
        } 
        Node p = trailer;
        if(header == trailer){
            header = trailer = null;
        } else{
            trailer = trailer.prev;
            trailer.next = null;
            p.prev = null;
        }
        return p;
    }

    public void traverse() {
        Node p = header;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }

    public int countCourserByCampus(String campus) {
        int count = 0;
        Node p = header;
        String formatCampus = campus.toUpperCase();
        
        while(p != null){
            if(p.info.getCampus().toUpperCase().equals(formatCampus)){
                count++;
            }
            p = p.next;
        }
        return count;
    }
}

class MyStack {

    Node top;

    public MyStack() {
        top = null;
    }

    public void push(String courseName, int semester, String campus) {
        // Add courses into Stack with 3 attributes
    }

    public Node top() {

        return null;
    }

    public Node pop() {
        return null;
    }

    public MyStack sortCourseNameByAsc() {
        // Sort courses following Name asc

        return null;
    }

    public void traverse() {
        Node p = top;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }
}
