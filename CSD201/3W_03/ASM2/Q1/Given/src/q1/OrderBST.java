/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package q1;

/**
 *
 * @author Legion 5 Pro
 */
public class OrderBST {
    TreeNode root;
    
    void loadData(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        String[] b = Lib.readLineToStrArray("data.txt", k + 1);
        double[] c = Lib.readLineToDoubleArray("data.txt", k + 2);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            Order newOrder = new Order(a[i], b[i], c[i]);
            insert(newOrder);
        }
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
}
