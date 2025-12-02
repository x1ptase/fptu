import java.util.ArrayList;
import java.util.List;

public class Tester {

    public static void main(String[] args) {
        MySLL list = new MySLL();

        Student s1 = new Student("S1_PhamTuanAnh", 25, "SE191XX");
        Student s2 = new Student("S2_TuanAnh", 19, "SE192XX");
        Student s3 = new Student(" ", 23, "SE193XX"); 
        Student s4 = new Student("S4", 19, "SE194XX");
        Student s5 = new Student("S5", 19, "SE195XX");
        Student s6 = new Student("S6", 19, "SE196XX");

        list.addFirst(s1);
        list.addFirst(s2);
        list.addFirst(s3);
        list.addFirst(s4);
        list.addFirst(s5);
        list.addFirst(s6);

        System.out.println("Size = " + list.size);

        List<Student> students = new ArrayList<>();
        students.add(s1);
        students.add(s2);
        students.add(s3);
        students.add(s4);
        students.add(s5);
        students.add(s6);

        System.out.println("Average = " + list.avgAge(students));

        list.traverse();
    }
}