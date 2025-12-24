/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package q1;

/**
 *
 * @author Legion 5 Pro
 */
public class OrderQueue {
    Node front;
    int length;
    
    public OrderQueue(){
        this.front = null;
        this.length = 0;
    }
    
    public int length(){
        return length;
    }
    
    public boolean isEmpty(){
        return this.length == 0;
    }
    
    void loadData(int k) //do not edit this function
    {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        String[] b = Lib.readLineToStrArray("data.txt", k + 1);
        double[] c = Lib.readLineToDoubleArray("data.txt", k + 2);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            enqueue(a[i], b[i], c[i]);
        }
    }
    
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
    
    public void displayOrders(){
        if (this.isEmpty()){
            System.out.println("There is no Order right now");
            return;
        }
        Node current = this.front;
        while(current != null){
            System.out.println(current.info.orderID+ " --> ");
        }
    }
}
