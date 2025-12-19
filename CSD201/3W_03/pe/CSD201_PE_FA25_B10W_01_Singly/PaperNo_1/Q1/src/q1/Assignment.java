package q1;

import java.io.File;
import java.io.RandomAccessFile;

public class Assignment {
    Browser browser;
    String dataFile = "data.txt";

    public Assignment() {
        browser = new Browser();
    }
    
    public void load() {
        browser.loadData(dataFile);
    }
    
    public void ftraverse(RandomAccessFile f) throws Exception {
        if (browser.getActiveTab() == null) {
            f.writeBytes("No tabs open.\r\n");
            return;
        }
        TabNode head = browser.getHeadTab();

        f.writeBytes("--- Browser State ---\r\n");
        TabNode current = head;
        int count = 1;
        while(current != null) {
            String prefix = (current == browser.getActiveTab()) ? "Active Tab" : "Tab " + count;
            f.writeBytes(prefix + ": " + current.currentPage.toString() + "\r\n");
            current.backHistory.ftraverse(f);
            current = current.next;
            count++;
        }
        f.writeBytes("---------------------\r\n");
    }

    public void f1() throws Exception {
        String fname = "f1.txt";
        File f = new File(fname);
        if (f.exists()) f.delete();
        RandomAccessFile rf = new RandomAccessFile(fname, "rw");
        
        rf.writeBytes(">>> Testing f1: HistoryStack push() and isEmpty()\r\n");
        HistoryStack stack = new HistoryStack();
        rf.writeBytes("Is stack empty initially? " + (stack.isEmpty() ? "Yes" : "No") + "\r\n");
        rf.writeBytes("Pushing two pages...\r\n");
        stack.push(new WebPage("page1.com", "Page One"));
        stack.push(new WebPage("page2.com", "Page Two"));
        rf.writeBytes("Is stack empty now? " + (stack.isEmpty() ? "Yes" : "No") + "\r\n");
        rf.writeBytes("\r\nFinal Stack State:\r\n");
        stack.ftraverse(rf);
        
        rf.close();
    }

    public void f2() throws Exception {
        String fname = "f2.txt";
        File f = new File(fname);
        if (f.exists()) f.delete();
        RandomAccessFile rf = new RandomAccessFile(fname, "rw");
        
        load();
        rf.writeBytes("--- Initial State ---\r\n");
        ftraverse(rf);
        
        rf.writeBytes("\r\n>>> Testing f2: Opening a new tab...\r\n");
        browser.openNewTab(new WebPage("elearning.com", "E-Learning_Portal"));
        rf.writeBytes("\r\n--- Final State ---\r\n");
        ftraverse(rf);

        rf.close();
    }
    
    public void f3() throws Exception {
        String fname = "f3.txt";
        File f = new File(fname);
        if (f.exists()) f.delete();
        RandomAccessFile rf = new RandomAccessFile(fname, "rw");

        load();
        browser.switchToNextTab(); 
        rf.writeBytes("--- Initial State (Active Tab is the second one) ---\r\n");
        ftraverse(rf);
        
        rf.writeBytes("\r\n>>> Testing f3: Closing the current tab...\r\n");
        browser.closeCurrentTab();
        rf.writeBytes("\r\n--- Final State ---\r\n");
        ftraverse(rf);

        rf.close();
    }
    
    public void f4() throws Exception {
        String fname = "f4.txt";
        File f = new File(fname);
        if (f.exists()) f.delete();
        RandomAccessFile rf = new RandomAccessFile(fname, "rw");

        load();
        browser.switchToNextTab(); 
        rf.writeBytes("--- Initial State (Active Tab is the second one) ---\r\n");
        ftraverse(rf);

        rf.writeBytes("\r\n>>> Testing f4: Moving the current tab left...\r\n");
        browser.moveTabLeft();
        rf.writeBytes("\r\n--- Final State ---\r\n");
        ftraverse(rf);
        
        rf.close();
    }
}