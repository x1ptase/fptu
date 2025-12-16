
public class Flight {
    private String flightCode;
    private String from, to;
    private int status; //-1: Scheduled; 0: Departed; 1: Landed
    private double price; // must be > 0
    
    public Flight(){
        
    }

    public Flight(String flightCode, String from, String to, int status, double price) {
        this.flightCode = flightCode;
        this.from = from;
        this.to = to;
        this.status = status;
        this.price = price;
    }

    public String getFlightCode() {
        return flightCode;
    }

    public void setFlightCode(String flightCode) {
        this.flightCode = flightCode;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Flight{" + "flightCode=" + flightCode + ", from=" + from + ", to=" + to + ", status=" + status + ", price=" + price + '}';
    }
    
}
