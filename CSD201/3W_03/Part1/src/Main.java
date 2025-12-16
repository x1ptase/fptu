
public class Main {
    public static void main(String[] args) {
        FlightSLL f = new FlightSLL();
        f.addFirst(new Flight("VN5001", "SGN", "LTH", 1, 200));
        f.addFirst(new Flight("VN5002", "SGN", "CRX", 1, 50));
        f.addFirst(new Flight("VN5003", "SGN", "HUI", -1, 500));
        f.addFirst(new Flight("VN5004", "SGN", "HAN", 10, 700));
        f.addFirst(new Flight("VJ081", "SGN", "SYD", 1, 300));
        f.addFirst(new Flight("VJ080", "SGN", "MEL", 1, 135));
        f.addFirst(new Flight("VU303", "SGN", "PQC", 1, -200));
        f.traverse();
        System.out.println("CheapestFlight: ");
        System.out.println(f.getCheapestFlight().infor.toString());
        //output
        //VJ080
        //VJ081
        //VN5003
        //VN5002
        //VN5001
        
    }
}
