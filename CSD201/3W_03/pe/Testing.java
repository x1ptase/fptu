/*=====SingleLinkedList=====*/
/*
    public void addFirst(Event event){
        Node p = new Node(event, null);
        if(isEmpty()){
            head = tail = p;
        } else{
            p.next = head;
            head= p;
        }
    }

    public void addLast(String cName, String campus, int credit) {
        Course course = new Course(cName, campus, credit);
        Node p = new Node(course, null);
        if (head == null) {
            head = tail = p;
        } else {
            tail.next = p;
            tail = p;
        }
    }

    public Node removeFirst() {
        if (head == null) {
            return null;
        }
        Node p = head;
        head = head.next;
        if (head == null) {
            tail = null;
        }
        return p;
    }

    public void removeLast() {
        if (isEmpty()) {
            return;
        }
        if (head == tail) {
            head = tail = null;
        } else {
            Node p = head;
            while (p.next != tail) {
                p = p.next;
            }
            p.next = null;
            tail = p;
        }
        size--;
    }
*/
/*=====DoubleLinkedList=====*/
/*
    public void addFirst(Course course) {
        Node p = new Node(course);
        if(header == null){
            header = trailer = p;
        } else{
            p.next = header;
            header.prev = p;
            header = p;
        }
    }

    public void addLast(Jewelry j) {
        Node p = new Node(j, null, null);
        if (isEmpty()) {
            header = trailer = p;
        } else {
            trailer.next = p;
            p.prev = trailer;
            trailer = p;
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
    }

    public Node removeLast() {
        if(header == null){
            return null;
        } 
        Node p = trailer;
        if(header == trailer){
            header = trailer = null;
        } else{
            trailer = trailer.prev;
            trailer.next = null;
            p.prev = null;
        }
        return p;
    }
*/
/*=====CircularLinkedList=====*/
/*
    public void addFirst(Jewelry j) 
        Node p = new Node(j, null, null);
        if (isEmpty()) {
            head = tail = p;
        } else {
            p.next = head;
            head.prev = p;
            head = p;
        }
    }
    
    public void addLast(String courName, int semester, String campus) {
        Course course = new Course(courName, semester, campus);
        Node p = new Node(course, null);
        
        if(tail == null){
            tail = p;
            tail.next = tail;
        } else{
            p.next = tail.next;
            tail.next = p;
            tail = p;
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

    public void traverse() {
        if (tail == null) {
            return;
        }
        Node p = tail.next;
        do {
            System.out.println(p.info);
            p = p.next;
        } while (p != tail.next);
    }
*/
/*=====Stack=====*/
/*
    public void push(String courseName, int semester, String campus) {
        // Add courses into Stack with 3 attributes
        Course course = new Course(courseName, semester, campus);
        Node p = new Node(course, null);
        if (isEmpty()) {
            top = p;
        } else {
            p.next = top;
            top = p;
        }
    }

    public Node top() {
        if(top == null){
            return null;
        }
        return top;
    }

    public Node pop() {
        if(top == null){
            return null;
        }
        Node p = top;
        top = top.next;
        p.next = null;
        return p;
    }
*/
/*=====Queue=====*/
/*
    public void enqueue(int x){
        // addLast
        Node p = new Node(x);
        if(front == null && rear == null){
            front = rear = p;
        } else{
            rear.next = p;
            rear = p;
        }
    }
    
    public Node dequeue(){
        // removeFirst
        if(front == null && rear == null){
            return null;
        }
        Node p = front;
        front = front.next;
        if(front == null){
            rear = null;
        }
        return p;
    }
    
    public void reverseTraverse(){
        Node p = rear;
        while(p != null){
            System.out.print(p.infor + "; ");
            p.next = p;
        }
        System.out.println("");
    }
    
    public Node front(){
        Node p = front;
        if(front == null){
            return null;
        }
        return p;
    }

    public void enqueue(String c) {
	// addLast
        Node p = new Node(c);
        if(front == null && rear == null){
           front = rear = p;
    	} else{
           rear.next = p;    
           p.prev = rear;  
           rear = p;    
       }
    }    

    public Node dequeue() {
	// removeFirst
      if(front == null && rear == null){
        return null;
    }
    Node p = front;
    if (front == rear) {
        front = rear = null;
    } 
       else {
        front = front.next; 
        front.prev = null; 
    }
    p.next = null;
    return p;
}

    public void reverseTraverse(){
        Node p = rear;
        while(p != null){
            System.out.print(p.infor + "; ");
            p = p.prev;
        }
        System.out.println("");
    }
    
    public Node front(){
        // return the front element without remove
        Node p = rear;
        if(front == null){
            return null;
        }
        return p;
    }
*/
/*=====Tree=====*/
/*
// f2: Insert a Task into the BST
    public void insert(Task task) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        root = insertRec(root, task);
        // -----------------------------------------------------
    }
    private TreeNode insertRec(TreeNode p, Task task){
        if(p == null){
            return new TreeNode(task);
        }
        if(task.priority < p.task.priority){
            p.left = insertRec(p.left, task);
        } else{
            p.right = insertRec(p.right, task);
        }
        return p;
    }

// f3: Pre-Order Traversal
    public List<Task> preOrderTraversal() {
        List<Task> result = new ArrayList<>();
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        preOrderHelper(root, result);
        // -----------------------------------------------------
        return result;
    }
    private void preOrderHelper(TreeNode p, List<Task> result){
        if(p == null){
            return;
        }
        result.add(p.task);
        preOrderHelper(p.left, result);
        preOrderHelper(p.right, result);
    }
// f3: In-Order Traversal
public List<Task> inOrderTraversal() {
    List<Task> result = new ArrayList<>();
    inOrderHelper(root, result);
    return result;
}

private void inOrderHelper(TreeNode p, List<Task> result) {
    if (p == null) {
        return;
    }
    inOrderHelper(p.left, result);
    result.add(p.task);
    inOrderHelper(p.right, result);
}

// f3: Post-Order Traversal
public List<Task> postOrderTraversal() {
    List<Task> result = new ArrayList<>();
    postOrderHelper(root, result);
    return result;
}

private void postOrderHelper(TreeNode p, List<Task> result) {
    if(p == null) {
        return;
    }
    postOrderHelper(p.left, result);
    postOrderHelper(p.right, result);
    result.add(p.task);
}

// f4: Remove a Task from the BST
    public void remove(int priority) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        root = removeRec(root, priority);
        // -----------------------------------------------------
    }
    private TreeNode removeRec(TreeNode p, int priority){
        if(p == null){
            return null;
        }
        if(priority < p.task.priority){
            p.left = removeRec(p.left, priority);
        } else if(priority > p.task.priority){
            p.right = removeRec(p.right, priority);
        } else{
            if(p.left == null) {
                return p.right;
            } else if(p.right == null) {
                return p.left;
            }
            p.task = findMinTask(p.right);
            p.right = removeRec(p.right, p.task.priority);
        }
        return p;
    }
    private Task findMinTask(TreeNode p){
        Task minTask = p.task;
        while(p.left != null){
            p = p.left;
            minTask = p.task;
        }
        return minTask;
    }
*/
/*=====Sort=====*/
/*
    public MySLL sortCourseByCreditDesc() {
        // Sort courses following credit desc
        if (head == null || head.next == null) {
            return this;
        }
        Node current = head;
        while (current != null) {
            Node maxNode = current;
            Node p = current.next;

            while (p != null) {
                int currentMaxCredit = maxNode.info.getCredit();
                int pCredit = p.info.getCredit();
                
                if (pCredit > currentMaxCredit) {
                    maxNode = p; 
                }
                p = p.next;
            }

            if (maxNode != current) {
                Course tmp = current.info;
                current.info = maxNode.info;
                maxNode.info = tmp;
            }
            current = current.next; 
        }
        return this; 
    }

        public sll SortByMonthAsc(){
        if(head == null || head.next == null){
            return this;
        }
        boolean swapped;
        Node lastSorted = null;
        do{
            swapped = false;
            Node p = head;
            while(p.next != lastSorted){
                int month1 = p.info.getMonth();
                int month2 = p.next.info.getMonth();
                if(month1 > month2){
                    Event tmp = p.info;
                    p.info = p.next.info;
                    p.next.info = tmp;
                    swapped = true;
                }
                p = p.next;
            }
            lastSorted = p;
        } while(swapped); 
    return this;
    }
/*=====Count=====*/
/*
public int countByCampus(String campus) {
        int count = 0;
        Node p = top;
        while (p != null) {
            if (p.info.getCampus().equals(campus)) {
                count++;
            }
            p = p.next;
        }
        return count;
    }

public int countEventByLocation(String location){
        int count = 0;
        if(location == null || location.trim().isEmpty()){
            return 0;
        }
        String forwardString = location.trim().toUpperCase();
        
        Node p = top;
        while(p != null){
            if(p.info.getLocation() != null && p.info.getLocation().trim().toUpperCase().equals(forwardString)){
                count++;
            }
            p = p.next;
        }
        return count;
    }
*/
/*=====Total=====*/
/*
    public double totaldAsset(List<Jewelry> jewelryList) {
        /// total = price * (size + quantity)
        double total = 0;
        for (Jewelry j : jewelryList) {
            total += j.getPrice() * (j.getSize() + j.getQuantity());
        }
        return total;
    }
*/
/*=====Add=====*/
/*
public void addPosition(Event event, int pos){
        if((event.getMonth() < 1 || event.getMonth() > 12)
            || (event.getLocation() == null || event.getLocation().trim().isEmpty())){
            return;
        }
        if(pos < 0){
            return;
        }
        Node p = new Node(event, null);
        // TH 1: = 0
        if(pos == 0){
            if(isEmpty()){
                head = tail = p;
            } else{
                p.next = head;
                head = p;
            }
        }
        // TH 2: > 0
        Node current = head;
        int index = 0;
        while(current != null && index < pos - 1){
            current = current.next;
            index++;
        }
        
        if(current == null){
            return;
        }
        p.next = current.next;
        current.next = p;

        if (p.next == null) {
            tail = p;
        }
    }
*/
/*=====CA1=====*/
/*
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
        if(isEmpty()){
            top = p;
        } else{
            p.next = top;
            top = p;
        }
        // -----------------------------------------------------
    }
    // =======================================================\
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
*/
/*===CA1_SINGLY===*/
/*
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
*/

/*=====CA2_TREE_1=====*/
/*
 // === f1: STUDENT IMPLEMENTS THESE METHODS            ===
    // =======================================================
    public boolean isEmpty() {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        return front == null;
        // -----------------------------------------------------
    }

    public void enqueue(Task task) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        QueueNode p = new QueueNode(task);
        if(isEmpty()){
            front = rear = p;
        } else{
            rear.next = p;
            rear = p;
        }
        // -----------------------------------------------------
    }

// f2: Insert a Task into the BST
    public void insert(Task task) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        root = insertRec(root, task);
        // -----------------------------------------------------
    }
    private TreeNode insertRec(TreeNode p, Task task){
        if(p == null){
            return new TreeNode(task);
        }
        if(task.priority < p.task.priority){
            p.left = insertRec(p.left, task);
        } else{
            p.right = insertRec(p.right, task);
        }
        return p;
    }

    // f3: Pre-Order Traversal
    public List<Task> preOrderTraversal() {
        List<Task> result = new ArrayList<>();
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        preOrderHelper(root, result);
        // -----------------------------------------------------
        return result;
    }
    private void preOrderHelper(TreeNode p, List<Task> result){
        if(p == null){
            return;
        }
        result.add(p.task);
        preOrderHelper(p.left, result);
        preOrderHelper(p.right, result);
    }
    
    // f4: Remove a Task from the BST
    public void remove(int priority) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        root = removeRec(root, priority);
        // -----------------------------------------------------
    }
    private TreeNode removeRec(TreeNode p, int priority){
        if(p == null){
            return null;
        }
        if(priority < p.task.priority){
            p.left = removeRec(p.left, priority);
        } else if(priority > p.task.priority){
            p.right = removeRec(p.right, priority);
        } else{
            if(p.left == null) {
                return p.right;
            } else if(p.right == null) {
                return p.left;
            }
            p.task = findMinTask(p.right);
            p.right = removeRec(p.right, p.task.priority);
        }
        return p;
    }
    private Task findMinTask(TreeNode p){
        Task minTask = p.task;
        while(p.left != null){
            p = p.left;
            minTask = p.task;
        }
        return minTask;
    }
    // =======================================================
*/
/*=====BST_IN_CLASS=====*/
/*
public void enqueue(String orderID, String customerName, double totalPrice){
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        Order order = new Order(orderID, customerName, totalPrice);
        Node p = new Node(order, null);
        if(isEmpty()) {
            front = p;
        } else{
            Node current = front;
            while(current.next != null){
                current = current.next;
            }
            current.next = p;
            }
        length++;
        //---------------------------------------------------------
    }
    
    public void remove(String id){
         //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(isEmpty()){
            return;
        }
        if(this.front.info.orderID.equals(id)){
            this.front = this.front.next;
            this.length--;
            return;
        }
        Node p = this.front;
        while(p.next != null){
            if(p.next.info.orderID.equals(id)){
                p.next = p.next.next;
                this.length--;
                return;
            }
            p = p.next;
        }
        //---------------------------------------------------------
    }

public void insert(Order order){
        this.root = insert(this.root, order);
    }
    
    private TreeNode insert(TreeNode root, Order order){
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(root == null){
            return new TreeNode(order);
        }
        if(order.orderID.compareTo(root.info.orderID) < 0){
            root.left = insert(root.left, order);
        } else{
            root.right = insert(root.right, order);
        }
        return root;
        //---------------------------------------------------------
    }
    
    public Order search(String id){
        return search(root, id);
    }
    
    public Order search(TreeNode root, String id){
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(root == null){
            return null;
        }
        if(id.compareTo(root.info.orderID) == 0){
            return root.info;
        } else if(id.compareTo(root.info.orderID) < 0){
            return search(root.left, id);
        } else{
            return search(root.right, id);
        }
        //---------------------------------------------------------
    }
    
    private Order findMin(TreeNode root){   
        Order min = root.info;
        while(root.left != null){
            min = root.left.info;
            root = root.left;
        }
        return min;
    }
    
    public void remove(String id){
        root = remove(root, id);
    }
   
    public TreeNode remove(TreeNode root, String id){
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(root == null){
            return null;
        }
        if(id.compareTo(root.info.orderID) < 0){
            root.left = remove(root.left, id);
        } else if(id.compareTo(root.info.orderID) > 0){
            root.right = remove(root.right, id);
        } else{
            if(root.left == null){
                return root.right;
            }
            if(root.right == null){
                return root.left;
            }
            root.info = findMin(root.right);
            root.right = remove(root.right, root.info.orderID);
        }
        //---------------------------------------------------------
        return root;
    }
    
    public Order findMax(){
        return findMax(root);
    }
    
    public Order findMax(TreeNode root){
        //You should write here appropriate statements to complete this function.
        //--------------------------------------------------------
        if(root == null){
            return null;
        }
        while(root.right != null) {
            root = root.right;
        }
        return root.info;
    }
        //---------------------------------------------------------
*/

