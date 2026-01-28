package dto; // Hoặc com.yourpackage.dto

import java.io.Serializable;
import java.util.Map;

// DTO này chứa tất cả kết quả của 5 bước
public class AnalysisReportDTO implements Serializable {

    // --- Bước 2: Thống kê mô tả ---
    private DescriptiveStatsDTO soNamLamViecStats;
    private DescriptiveStatsDTO mucLuongStats;
    private DescriptiveStatsDTO soCongViecStats;
    private Map<String, Integer> liDoThayDoiCongViecCounts;

    // --- Bước 3: Phân tích Tương quan ---
    private double correlationLuongVsNamLamViec;
    private double correlationSoCongViecVsNamLamViec;
    private double tStatistic_corr_Luong;
    private double pValue_corr_Luong;
    private double tStatistic_corr_SoCongViec;
    private double pValue_corr_SoCongViec;

    // --- Bước 4: Kiểm định T-Test 1 Mẫu ---
    private double tStatistic_1_Sample;
    private double pValue_1_Sample;
    private final double mu0 = 2.0; // Giá trị giả định để kiểm định (2 năm)

    // --- Bước 5: Phân phối Xác suất ---
    private double poissonLambda;
    private double poissonProbGTE3; // P(X >= 3)
    private double expMeanTime;
    private double expProbLTE1_5; // P(X <= 1.5)

    // --- Getters and Setters ---
    
    public DescriptiveStatsDTO getSoNamLamViecStats() { return soNamLamViecStats; }
    public void setSoNamLamViecStats(DescriptiveStatsDTO soNamLamViecStats) { this.soNamLamViecStats = soNamLamViecStats; }
    public DescriptiveStatsDTO getMucLuongStats() { return mucLuongStats; }
    public void setMucLuongStats(DescriptiveStatsDTO mucLuongStats) { this.mucLuongStats = mucLuongStats; }
    public DescriptiveStatsDTO getSoCongViecStats() { return soCongViecStats; }
    public void setSoCongViecStats(DescriptiveStatsDTO soCongViecStats) { this.soCongViecStats = soCongViecStats; }
    public Map<String, Integer> getLiDoThayDoiCongViecCounts() { return liDoThayDoiCongViecCounts; }
    public void setLiDoThayDoiCongViecCounts(Map<String, Integer> liDoThayDoiCongViecCounts) { this.liDoThayDoiCongViecCounts = liDoThayDoiCongViecCounts; }

    public double getCorrelationLuongVsNamLamViec() { return correlationLuongVsNamLamViec; }
    public void setCorrelationLuongVsNamLamViec(double r) { this.correlationLuongVsNamLamViec = r; }
    public double getCorrelationSoCongViecVsNamLamViec() { return correlationSoCongViecVsNamLamViec; }
    public void setCorrelationSoCongViecVsNamLamViec(double r) { this.correlationSoCongViecVsNamLamViec = r; }
    public double getTStatistic_corr_Luong() {
        return tStatistic_corr_Luong;
    }
    public void setTStatistic_corr_Luong(double tStatistic_corr_Luong) {
        this.tStatistic_corr_Luong = tStatistic_corr_Luong;
    }
    public double getPValue_corr_Luong() {
        return pValue_corr_Luong;
    }
    public void setPValue_corr_Luong(double pValue_corr_Luong) {
        this.pValue_corr_Luong = pValue_corr_Luong;
    }
    public double getTStatistic_corr_SoCongViec() {
        return tStatistic_corr_SoCongViec;
    }
    public void setTStatistic_corr_SoCongViec(double tStatistic_corr_SoCongViec) {
        this.tStatistic_corr_SoCongViec = tStatistic_corr_SoCongViec;
    }
    public double getPValue_corr_SoCongViec() {
        return pValue_corr_SoCongViec;
    }
    public void setPValue_corr_SoCongViec(double pValue_corr_SoCongViec) {
        this.pValue_corr_SoCongViec = pValue_corr_SoCongViec;
    }
    
    public double getTStatistic_1_Sample() { return tStatistic_1_Sample; }
    public void setTStatistic_1_Sample(double t) { this.tStatistic_1_Sample = t; }
    public double getPValue_1_Sample() { return pValue_1_Sample; }
    public void setPValue_1_Sample(double p) { this.pValue_1_Sample = p; }
    public double getMu0() { return mu0; } // Trả về giá trị đã kiểm định
    
    public double getPoissonLambda() { return poissonLambda; }
    public void setPoissonLambda(double lambda) { this.poissonLambda = lambda; }
    public double getPoissonProbGTE3() { return poissonProbGTE3; }
    public void setPoissonProbGTE3(double prob) { this.poissonProbGTE3 = prob; }
    
    public double getExpMeanTime() { return expMeanTime; }
    public void setExpMeanTime(double meanTime) { this.expMeanTime = meanTime; }
    public double getExpProbLTE1_5() { return expProbLTE1_5; }
    public void setExpProbLTE1_5(double prob) { this.expProbLTE1_5 = prob; }
}