
public class Tester {

    public static void main(String[] args) {
        Event e1 = new Event("e001", "HCM", 12);
        Event e2 = new Event("e002", "HN", 1);
        Event e3 = new Event("e003", "QN", -12);
        Event e4 = new Event("e004", "HP", 12);
        Event e5 = new Event("e005", "HCM", 5);
        Event e6 = new Event("e006", "HCM", 7);
        Event e7 = new Event("e007", "HCM", 9);
        Event e8 = new Event("e008", "HP", 8);
        
        Company company = new Company();
        
        // 2 POINTS
//        company.sList.addFirst(e1);
//        company.sList.addFirst(e2);
//        company.sList.addFirst(e3);
//        company.sList.addFirst(e4);
//        company.sList.addFirst(e5);
//        company.sList.addFirst(e6);
//        company.sList.addFirst(e7);
//        company.sList.addFirst(e8);
        
//        company.myStack.push(e1);
//        company.myStack.push(e2);
//        company.myStack.push(e3);
//        company.myStack.push(e4);
//        company.myStack.push(e5);
//        company.myStack.push(e6);
//        company.myStack.push(e7);
//        company.myStack.push(e8);
        
        //company.sList.traverse();
        //company.myStack.traverse();
        
        // 3 POINTS
//        Event e9 = new Event("e009", "HN", 2);
//        company.sList.addPosition(e9, 5);
//        company.sList.traverse();
//        System.out.println("Top = " + company.myStack.top());
//        
//        // 3 POINTS
        company.sList.SortByMonthAsc();
        company.sList.traverse();
        System.out.println("Cout in stack (HCM) = " + company.myStack.countEventByLocation("HCM"));
//        
//        // 2 POINTS - remove 4 first elements in SLL and Stack
//        company.sList.removeFirst();
//        company.sList.removeFirst();
//        company.sList.removeFirst();
//        company.sList.removeFirst();
//        company.sList.traverse();
//        company.myStack.pop();
//        company.myStack.pop();
//        company.myStack.pop();
//        company.myStack.pop();
//        company.myStack.traverse();
    }
}
