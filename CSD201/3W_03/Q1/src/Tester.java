public class Tester {

    public static void main(String[] args) {
        AcademicDept ad = new AcademicDept();
        
        ad.sList.addLast("CSD201", "HCM", 3);
        ad.sList.addLast("OSG202", "HCM", 3);
        ad.sList.addLast("CSI106", "QN", 3);
        ad.sList.addLast("CEA201", "HN", 3);
        ad.sList.removeFirst();
        
//        ad.cList.addLast("ACC201", 5, "HCM");
//        ad.cList.addLast("NWC201", 3, "HCM");
//        ad.cList.addLast("SWP490", 9, "HCM");
//        
//        Course c1 = new Course("SWP391", 5, "HCM" , 3);
//        Course c2 = new Course("MLN111", 8, "HCM" , 3);
//        Course c3 = new Course("JPD113", 3, "HCM" , 3);
//        Course c4 = new Course("JPD133", 5, "HCM" , 3);
//        
//        ad.dList.addFirst(c1);
//        ad.dList.addFirst(c2);
//        ad.dList.addFirst(c3);
//        ad.dList.addFirst(c4);
//        
//        System.out.println("Course in HCM = " + ad.dList.countCourserByCampus("hcm"));
//        System.out.println("Course in QN = " + ad.dList.countCourserByCampus("QN"));
//        
        ad.sList.traverse();
//        ad.cList.traverse();
//        ad.dList.traverse();
//        ad.stack.traverse();
    }
}