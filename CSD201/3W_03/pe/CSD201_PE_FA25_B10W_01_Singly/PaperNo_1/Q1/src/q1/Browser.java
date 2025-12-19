package q1;
import java.io.BufferedReader;
import java.io.FileReader;

public class Browser {
    private TabNode head;
    private TabNode activeTab;

    public Browser() { 
        this.head = null;
        this.activeTab = null; 
    }
    
    public TabNode getActiveTab() {
        return activeTab; 
    }

    public TabNode getHeadTab() {
        return head; 
    }
    
    public void loadData(String filename) {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            int numTabs = Integer.parseInt(br.readLine());
            String[] urls = br.readLine().split(" ");
            String[] titles = br.readLine().split(" ");

            for (int i = 0; i < numTabs; i++) {
                this.openNewTab(new WebPage(urls[i], titles[i]));
                
                TabNode currentTab = head;
                while(currentTab.next != null) currentTab = currentTab.next;

                String[] history = br.readLine().split(" ");
                for (int j = 0; j < history.length; j += 2) {
                    currentTab.backHistory.push(new WebPage(history[j], history[j+1]));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.activeTab = this.head;
    }

    public void switchToNextTab() {
        if (activeTab == null) return;
        if (activeTab.next == null) {
            activeTab = head; 
        } else {
            activeTab = activeTab.next;
        }
    }

    // f2: Open a New Tab 
    public void openNewTab(WebPage newPage) {
        TabNode p = new TabNode(newPage);
        if (head == null) {
            head = p;
            activeTab = p;
            return;
        }
        TabNode tail = head;
        while (tail.next != null) {
            tail = tail.next;
        }
        tail.next = p;
    }

    // f3: Close the Current Tab
    public void closeCurrentTab() {
        if (activeTab == null || head == null) return;

        if (activeTab == head) {
            head = head.next;
            activeTab = head;
        } else {
            TabNode prevNode = head;
            while (prevNode.next != null && prevNode.next != activeTab) {
                prevNode = prevNode.next;
            }
            
            if (prevNode.next == activeTab) {
                prevNode.next = activeTab.next;
                activeTab = (prevNode.next != null) ? prevNode.next : prevNode;
            }
        }
    }

    // f4: Move the Current Tab to the Left
    public void moveTabLeft() {
        if (activeTab == null || activeTab == head) return;

        if (head.next == activeTab) {
            TabNode oldHead = head;
            oldHead.next = activeTab.next;
            activeTab.next = oldHead;
            head = activeTab; 
            return;
        }

        TabNode grandPrev = head;
        while (grandPrev.next != null && grandPrev.next.next != activeTab) {
            grandPrev = grandPrev.next;
        }

        if (grandPrev.next != null && grandPrev.next.next == activeTab) {
            TabNode prevNode = grandPrev.next;
            TabNode nextOfActive = activeTab.next;

            grandPrev.next = activeTab;
            activeTab.next = prevNode;
            prevNode.next = nextOfActive;
        }
    }
}