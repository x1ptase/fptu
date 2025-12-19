package q1;

public class WebPage {
    String url;
    String title;

    public WebPage(String url, String title) {
        this.url = url;
        this.title = title;
    }

    @Override
    public String toString() {
        return "(URL: " + url + ", Title: " + title + ")";
    }
}