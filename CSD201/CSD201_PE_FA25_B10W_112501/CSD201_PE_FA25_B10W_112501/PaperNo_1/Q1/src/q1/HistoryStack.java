package q1;
import java.io.RandomAccessFile;

public class HistoryStack {
    private class HistoryNode {
        WebPage page; HistoryNode next;
        HistoryNode(WebPage p) { this.page = p; this.next = null; }
    }
    private HistoryNode top;
    public HistoryStack() { this.top = null; }

    public WebPage pop() {
        if (isEmpty()) return null;
        HistoryNode temp = top;
        top = top.next;
        return temp.page;
    }
    
    public void ftraverse(RandomAccessFile f) throws Exception {
        f.writeBytes("  History:\r\n");
        if(isEmpty()){
            f.writeBytes("    [No History]\r\n");
            return;
        }
        HistoryNode current = top;
        while(current != null) {
            f.writeBytes("    - " + current.page.toString() + "\r\n");
            current = current.next;
        }
    }

    // =======================================================
    // === f1: STUDENT IMPLEMENTS THESE METHODS            ===
    // =======================================================
    public boolean isEmpty() {
        // ---------- Student's code starts from here ----------
        return top == null;
        // -----------------------------------------------------
    }

    public void push(WebPage page) {
        // ---------- Student's code starts from here ----------
        HistoryNode p = new HistoryNode(page);
        p.next = top;
        top = p;
        // -----------------------------------------------------
    }
    // =======================================================
}