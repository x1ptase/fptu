
package dll;

public class Tester {
    public static void main(String[] args) {
        MyDLLQueue dq = new MyDLLQueue();
        dq.enqueue('A');
        dq.enqueue('B');
        dq.enqueue('C');
        dq.enqueue('D');
        //dq.reverseTraverse();
        dq.dequeue();
//        dq.dequeue();
//        dq.dequeue();
//        dq.dequeue();
//        dq.dequeue();
        
        if(dq.front() != null){
            System.out.println(dq.front().infor);
        }
        dq.traverse();
    }
}
