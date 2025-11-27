package dto; // Hoặc com.yourpackage.dto

import java.io.Serializable;

public class DescriptiveStatsDTO implements Serializable {
    private double mean;
    private double median;
    private double stdDev;

    public DescriptiveStatsDTO() {
        this.mean = 0;
        this.median = 0;
        this.stdDev = 0;
    }

    // Getters and Setters
    public double getMean() { return mean; }
    public void setMean(double mean) { this.mean = mean; }
    public double getMedian() { return median; }
    public void setMedian(double median) { this.median = median; }
    public double getStdDev() { return stdDev; }
    public void setStdDev(double stdDev) { this.stdDev = stdDev; }
}