public class Event {
    private String id;
    private String location;
    private int month;
    
    
    public Event(){
    }

    public Event(String id, String location, int month) {
        this.id = id;
        this.location = location;
        this.month = month;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "Event{" + "id=" + id + ", location=" + location + ", month=" + month + '}';
    }

}
