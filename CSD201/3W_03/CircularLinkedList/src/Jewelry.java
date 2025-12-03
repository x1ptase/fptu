
public class Jewelry {
    private String type;
    private double price;
    private double size;
    private int quantity;

    public Jewelry() {
    }

    public Jewelry(String type, double price, double size, int quantity) {
        this.type = type;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Jewelry{" + "type=" + type + ", price=" + price + ", size=" + size + ", quantity=" + quantity + '}';
    }
    
    
}
