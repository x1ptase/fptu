package sll;

public class Tester {
    public static void main(String[] args) {
        MySLLQueue sq = new MySLLQueue();
        sq.enqueue(5);
        sq.enqueue(10);
        sq.enqueue(15);
        sq.enqueue(20);
        
        //sq.dequeue();
        System.out.println(sq.dequeue().infor);
        System.out.println(sq.dequeue().infor);
        System.out.println(sq.dequeue().infor);
        System.out.println(sq.dequeue().infor);
        System.out.println(sq.dequeue());
        
//        if(sq.front() != null){
//            System.out.println(sq.front().infor);
//        }
        
        sq.traverse();
        //sq.reverseTraverse();
    }
}
