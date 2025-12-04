
public class MyStack {

    Node top;
    int totalElement;

    public MyStack() {
        top = null;
        totalElement = 0;
    }

    public boolean isEmpty() {
        return top == null;
    }

    /* 
    * Campus = {HCM, QN, DN, CT, HN}
    * Semester = [1-9]
     */
    public void push(Course course) {
        if ((course.getCampus().equals("HCM") || course.getCampus().equals("QN") || course.getCampus().equals("DN")
                || course.getCampus().equals("CT") || course.getCampus().equals("HN"))
                && (course.getSemester() >= 1 && course.getSemester() <= 9)) {
            Node p = new Node(course, null);
            if (isEmpty()) {
                top = p;
            } else {
                p.next = top;
                top = p;
            }
            totalElement++;
        }
    }

    /* 
    * Campus = {HCM, QN, DN, CT, HN}
    * Semester = [1-9]
     */
    public void pushCond(String cName, String campus, int semester) {
        if (campus.equals("HCM") || campus.equals("QN") || campus.equals("DN") || campus.equals("CT") || campus.equals("HN")) {
            if (semester >= 1 && semester <= 9) {
                Course course = new Course(cName, semester, campus);
                push(course);
            } else {
                System.out.println("Invalid semester " + semester);
            }
        } else {
            System.out.println("Invalid campus " + campus);
        }
    }

    public Node pop() {
        if (isEmpty()) {
            return null;
        }
        Node popNode = top;
        top = top.next;

        totalElement--;

        return popNode;
    }

    /*
    *   Count course all of campus
     */
    public int countByCampus(String campus) {
        int count = 0;
        Node p = top;
        while (p != null) {
            if (p.info.getCampus().equals(campus)) {
                count++;
            }
            p = p.next;
        }
        return count;
    }

    public void traverse() {
        Node p = top;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }
}
