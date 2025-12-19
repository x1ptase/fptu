package q1;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.RandomAccessFile;

public class Browser {
    private TabNode activeTab;
    public Browser() { this.activeTab = null; }
    
    public TabNode getActiveTab() {
        return activeTab;
    }

    public TabNode getHeadTab() {
        if (activeTab == null) return null;
        TabNode head = activeTab;
        while (head.prev != null) {
            head = head.prev;
        }
        return head;
    }
    
    public void loadData(String filename) {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            int numTabs = Integer.parseInt(br.readLine());
            String[] urls = br.readLine().split(" ");
            String[] titles = br.readLine().split(" ");

            for (int i = 0; i < numTabs; i++) {
                this.openNewTab(new WebPage(urls[i], titles[i]));
                TabNode currentTab = this.activeTab;
                while(currentTab.next != null) currentTab = currentTab.next;

                String[] history = br.readLine().split(" ");
                for (int j = 0; j < history.length; j += 2) {
                    currentTab.backHistory.push(new WebPage(history[j], history[j+1]));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(this.activeTab != null) while(this.activeTab.prev != null) this.activeTab = this.activeTab.prev;
    }

    public void switchToNextTab() {
        if (activeTab == null) return;
        if (activeTab.next == null) {
            TabNode head = activeTab;
            while (head.prev != null) head = head.prev;
            activeTab = head;
        } else {
            activeTab = activeTab.next;
        }
    }

    // =======================================================
    // === STUDENT IMPLEMENTATION AREA                     ===
    // =======================================================

    // f2: Open a New Tab
    public void openNewTab(WebPage newPage) {
        // ---------- Student's code starts from here ----------
        TabNode p = new TabNode(newPage);
        if(activeTab == null){
            activeTab = p;
            return;
        }
        TabNode tail = getHeadTab();
        while(tail.next != null){
            tail = tail.next;
        }
        tail.next = p;
        p.prev = tail;
        // -----------------------------------------------------
    }

    // f3: Close the Current Tab
    public void closeCurrentTab() {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        if(activeTab == null){
            return;
        }
        TabNode p = activeTab;
        TabNode nextActive = (p.next != null) ? p.next : p.prev;
        if(p.prev != null){
            p.prev.next = p.next;
        }
        if(p.next != null){
            p.next.prev = p.prev;
        }
        activeTab = nextActive;
        // -----------------------------------------------------
    }

    // f4: Move the Current Tab to the Left
    public void moveTabLeft() {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        if(activeTab == null || activeTab.prev == null){
            return;
        }
        TabNode B = activeTab;
        TabNode A = activeTab.prev;
        TabNode nextOfB = B.next;
        TabNode prevOfA = A.prev; 

        if(prevOfA != null){
            prevOfA.next = B;
        }
        B.prev = prevOfA;

        B.next = A;
        A.prev = B;

        A.next = nextOfB;
        if(nextOfB != null){
            nextOfB.prev = A;
        }
    // -----------------------------------------------------
    }
    // =======================================================
}