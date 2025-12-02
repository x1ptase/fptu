
import java.util.List;

public class LuxuryStore {

    Node header, trailer;
    int size;

    public LuxuryStore() {
        this.size = 0;
    }

    public LuxuryStore(Node header, Node trailer, int size) {
        this.header = header;
        this.trailer = trailer;
        this.size = size;
    }

    public boolean isEmpty() {
        return header == null;
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
                header = trailer = p;
            } else {
                p.next = header;
                header.prev = p;
                header = p;
            }
            size++;
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
                header = trailer = p;
            } else {
                trailer.next = p;
                p.prev = trailer;
                trailer = p;
            }
            size++;
        }
    }

    public void removeFirst() {
        if (isEmpty()) {
            return;
        }
        if (header == trailer) {
            header = trailer = null;
        } else {
            header = header.next;
            header.prev = null;
        }
        size--;
    }

    public Node removeLast() {
        if (isEmpty()) {
            return null;
        }
        Node p = trailer;
        if (header == trailer) {
            header = trailer = null;
        } else {
            trailer = trailer.prev;
            trailer.next = null;
        }
        size--;
        return p;
    }

    public double totaldAsset(List<Jewelry> jewelryList) {
        double total = 0;
        for (Jewelry j : jewelryList) {
            total += j.getPrice() * (j.getSize() + j.getQuantity());
        }
        return total;
    }

    public void traverse() {
        Node p = header;
        while (p != null) {
            System.out.println(p.info);
            p = p.next;
        }
    }
}
