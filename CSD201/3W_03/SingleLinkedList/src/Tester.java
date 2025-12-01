public class Tester{
    public static void main(String[] args){
        MySLL list = new MySLL();
        Student s1 = new Student("S1_PhamTuanAnh", 29, "SE191XX");
        Student s2 = new Student("S2_TuanAnh", 17, "SE192XX");
        Student s3 = new Student("S3_Anh", 23, "SE193XX");
        
        list.addLast(s1);
        list.addLast(s2);
        list.addLast(s3);
        list.addFirst(s1);
        list.addFirst(s2);
        list.addFirst(s3);
        
        System.out.println("Size = " + list.size);
        
        list.traverse();
    }
}