
public class Tester {

    public static void main(String[] args) {
        LuxuryStore lx = new LuxuryStore();
        Jewelry L1 = new Jewelry("10K", 14.5, 1.4, 2);
        Jewelry L2 = new Jewelry("14K", 24.6, 1.8, 0);
        Jewelry L3 = new Jewelry("18K", 66.7, 1.7, 4);
        Jewelry L4 = new Jewelry("24K", 0, 1.6, 2);
        Jewelry L5 = new Jewelry("9999", 160, 1.0, 10);
        
        lx.addFirst(L1);
        lx.addFirst(L2);
        lx.addFirst(L3);
        lx.addFirst(L4);
        lx.addFirst(L5);
        
//        lx.addLast(L1);
//        lx.addLast(L2);
//        lx.addLast(L3);
//        lx.addLast(L4);
//        lx.addLast(L5);
        
        lx.removeFirst();
        lx.removeLast();
        
        System.out.println("Size = " + lx.size);
        
        lx.traverse();
    }
}
