
import java.util.List;

class DLL {

    Node head, tail;

    public DLL() {
        head = tail = null;
    }

    public boolean isEmpty() {
        return head == null;
    }

    /*
    *   type chi thuoc "10K", "14K" "18K", "24K"
    *   price > 0, size > 0, quantity >= 0
     */
    public void addFirst(Jewelry j) {
        if (j.getType().equals("10K") || j.getType().equals("14K") || j.getType().equals("18K") || j.getType().equals("24K")
                && j.getPrice() > 0 && j.getSize() > 0 && j.getQuantity() >= 0) {
            Node p = new Node(j, null, null);
            if (isEmpty()) {
                head = tail = p;
            } else {
                p.next = head;
                head.prev = p;
                head = p;
            }
        }
    }

    /*
    *   type chi thuoc "10K", "14K" "18K", "24K"
    *   price > 0, size > 0, quantity >= 0
     */
    public void addLast(Jewelry j) {
        if (j.getType().equals("10K") || j.getType().equals("14K") || j.getType().equals("18K") || j.getType().equals("24K")
                && j.getPrice() > 0 && j.getSize() > 0 && j.getQuantity() >= 0) {
            Node p = new Node(j, null, null);
            if (isEmpty()) {
                head = tail = p;
            } else {
                tail.next = p;
                p.prev = tail;
                tail = p;
            }
        }
    }

    public void removeFirst() {
        if (isEmpty()) {
            return;
        }
        if (head == tail) {
            head = tail = null;
        } else {
            head = head.next;
            head.prev = null;
        }
    }

    public Node removeLast() {
        if (isEmpty()) {
            return null;
        }
        Node p = tail;
        if (head == tail) {
            head = tail = null;
        } else {
            tail = tail.prev;
            tail.next = null;
        }
        return p;
    }

    public double totaldAsset(List<Jewelry> jewelryList) {
        /// total = price * (size + quantity)
        double total = 0;
        for (Jewelry j : jewelryList) {
            total += j.getPrice() * (j.getSize() + j.getQuantity());
        }
        return total;
    }

    public void traverse() {
        Node p = head;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }
}

class CLL {

    Node tail;

    public CLL() {
        tail = null;
    }
    
    public boolean isEmpty(){
        return tail == null;
    }

    public void addFirst(Jewelry j) {
        // no condition
        Node p = new Node(j, null);
        if(isEmpty()){
            tail = p;
            p.next = tail;
        } else {
            p.next = tail.next;
            tail.next = p;
        }
    }

    public void addLast(Jewelry j) {
        // no condition
        Node p = new Node(j, null);
        if(isEmpty()){
            tail = p;
            p.next = tail;
        } else {
            p.next = tail.next;
            tail.next = p;
            tail = p;
        }
    }

    public double totalQuality(List<Jewelry> jewelryList) {
        //Tinh tong so luong (quality) toan bo trang suc
        //co trong Store (Total quality)
        double total = 0;
        for (Jewelry j : jewelryList) {
            total += j.getQuantity();
        }
        return total;
    }

    public void traverse() {
       if(isEmpty()){
            return;
        }
        Node p = tail.next;
        do {
            System.out.println(p.info); 
            p = p.next; 
        } while (p != tail.next); 
    }
}

public class LuxuryStore {

    DLL dList = new DLL();
    CLL cList = new CLL();

    public LuxuryStore() {
    }
}
