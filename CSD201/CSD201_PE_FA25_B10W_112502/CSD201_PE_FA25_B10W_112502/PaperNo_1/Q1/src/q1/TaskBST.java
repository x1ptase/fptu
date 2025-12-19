package q1;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.List;     

public class TaskBST {
    private class TreeNode {
        Task task;
        TreeNode left, right;
        TreeNode(Task t) { this.task = t; left = right = null; }
    }
    
    private TreeNode root;
    public TaskBST() { root = null; }

    public void ftraverse(RandomAccessFile f, int choice) throws Exception {
        f.writeBytes("--- Task BST ---\r\n");
        if (root == null) {
            f.writeBytes("Empty\r\n");
        } else {
            if(choice == 1){ //
                List<Task> tasks = printOut(); 
                for (Task task : tasks) {
                    f.writeBytes(task.toString() + "\r\n");
                }
            } else if(choice == 2){
                List<Task> tasks = preOrderTraversal(); 
                for (Task task : tasks) {
                    f.writeBytes(task.toString() + "\r\n");
                }
            }
            
        }
    }
    
    public List<Task> printOut() {
        List<Task> result = new ArrayList<>();
        help_fn(root, result);
        return result;
    } 
    private void help_fn(TreeNode node, List<Task> resultList) {
        if (node == null) {
            return;
        }
        help_fn(node.left, resultList);
        resultList.add(node.task);
        help_fn(node.right, resultList);
    }
    
    // =======================================================
    // === STUDENT IMPLEMENTATION AREA                     ===
    // =======================================================

    // f2: Insert a Task into the BST
    public void insert(Task task) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        return;
        // -----------------------------------------------------
    }

    // f3: Pre-Order Traversal
    public List<Task> preOrderTraversal() {
        List<Task> result = new ArrayList<>();
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        
        // -----------------------------------------------------
        return result;
    }
    
    // f4: Remove a Task from the BST
    public void remove(int priority) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        return;
        // -----------------------------------------------------
    }
    // =======================================================
}