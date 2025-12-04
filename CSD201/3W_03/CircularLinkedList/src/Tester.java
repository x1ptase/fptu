
import java.util.ArrayList;
import java.util.List;

public class Tester {

    public static void main(String[] args) {
        LuxuryStore lx = new LuxuryStore();

        Jewelry L1 = new Jewelry("10K", 14.5, 1.4, 2);
        Jewelry L2 = new Jewelry("14K", 24.6, 1.8, 0);
        Jewelry L3 = new Jewelry("18K", 66.7, 1.7, 4);
        Jewelry L4 = new Jewelry("24K", 0, 1.6, 2);
        Jewelry L5 = new Jewelry("9999", 1, 1.0, 3);

        lx.cList.addFirst(L1);
        lx.cList.addFirst(L2);
        lx.cList.addFirst(L3);
        lx.cList.addFirst(L4);
        lx.cList.addFirst(L5); 
//        lx.cList.addLast(L1);
//        lx.cList.addLast(L2);
//        lx.cList.addLast(L3);
//        lx.cList.addLast(L4);
//        lx.cList.addLast(L5);

        List<Jewelry> jewelryList = new ArrayList<>();
        jewelryList.add(L1);
        jewelryList.add(L2);
        jewelryList.add(L3);
        jewelryList.add(L4);
        jewelryList.add(L5);

        System.out.println("Total Quantity = " + lx.cList.totalQuatity(jewelryList));

        DLL newList = lx.cList.sortAscByPrice(jewelryList);
        System.out.println("Sorted by Price:");
        newList.traverse();

        System.out.println("\n");
        System.out.println("Origianal list:");
        lx.cList.traverse();
    }
}
