
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
        
        return null;
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
    }

    public void traverse() {

    }
}

class MyDLL {

    Node header, trailer;

    public MyDLL() {
        header = trailer = null;
    }

    public void addFirst(Course course) {

    }

    public Node removeLast() {

        return null;
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
