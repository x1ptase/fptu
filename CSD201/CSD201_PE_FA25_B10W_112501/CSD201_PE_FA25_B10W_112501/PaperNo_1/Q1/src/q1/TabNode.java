package q1;
public class TabNode {
    WebPage currentPage;
    HistoryStack backHistory;
    TabNode next;
    TabNode prev;

    public TabNode(WebPage page) {
        this.currentPage = page;
        this.backHistory = new HistoryStack();
        this.next = null;
        this.prev = null;
    }
}