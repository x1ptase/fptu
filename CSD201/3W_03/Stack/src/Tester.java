public class Tester {

    public static void main(String[] args) {
        MyStack st = new MyStack();

        Course c1 = new Course("CSD201", 3, "HN");
        Course c2 = new Course("WEB201c", 3, "QN");
        Course c3 = new Course("PRJ301", 4, "DN");
        Course c4 = new Course("JPD133", 5, "HCM");
        Course c5 = new Course("SWE201c", 11, "HCM");
        Course c6 = new Course("PRF192", 0, "HCM");  
        Course c7 = new Course("PRO192", 2, "BD");    
        Course c8 = new Course("JPD123", 4, "HP");    

        String[] campuses = {"HN", "HCM", "QN", "DN", "CT"}; 
        
        System.out.println("Total Element = " + st.totalElement);

        for (String campus : campuses) {
            System.out.println("Campus " + campus + " = " + st.countByCampus(campus));
        }
        
        st.push(c1);
        st.push(c2);
        st.push(c3);
        st.push(c4);
        st.push(c5);
        st.push(c6);
        st.push(c7);
        st.push(c8);
        
        st.pushCond("PRF193", "HCM", 1);
        //st.pop();

        st.traverse();
    }
}
