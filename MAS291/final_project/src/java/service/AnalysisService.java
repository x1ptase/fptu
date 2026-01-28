package service; // Hoặc com.yourpackage.service

import dto.AnalysisReportDTO;
import dto.DescriptiveStatsDTO;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Import thư viện Apache Commons Math
import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;
import org.apache.commons.math3.stat.inference.TTest;
import org.apache.commons.math3.distribution.PoissonDistribution;
import org.apache.commons.math3.distribution.ExponentialDistribution;
// *** IMPORT MỚI ĐỂ TÍNH P-VALUE CHO T-TEST ***
import org.apache.commons.math3.distribution.TDistribution; 
// *** HẾT IMPORT MỚI ***

public class AnalysisService {
    
    // Hàm chính: Nhận vào đường dẫn file CSV
    public AnalysisReportDTO generateAnalysisReport(String csvFilePath) {
        
        System.out.println("--- (Bước 1) Bắt đầu đọc file CSV từ: " + csvFilePath + " ---");
        AnalysisReportDTO report = new AnalysisReportDTO();

        // --- (Bước 1) ĐỌC FILE CSV VÀ LỌC DỮ LIỆU GEN Z ---
        List<Double> genZ_SoNam = new ArrayList<>();
        List<Double> genZ_MucLuong = new ArrayList<>();
        List<Integer> genZ_SoCongViec = new ArrayList<>();
        List<String> genZ_LiDo = new ArrayList<>();
        
        try (BufferedReader br = new BufferedReader(new FileReader(csvFilePath))) {
            String line;
            br.readLine(); // Bỏ qua Header
            while ((line = br.readLine()) != null) {
                String[] fields = line.split(",");
                if (fields.length < 7) continue; 
                int doTuoi = Integer.parseInt(fields[1].trim());
                if (doTuoi >= 18 && doTuoi <= 28) { // Lọc Gen Z
                    genZ_SoNam.add(Double.parseDouble(fields[3].trim()));
                    genZ_MucLuong.add((double) Integer.parseInt(fields[4].trim()));
                    genZ_SoCongViec.add(Integer.parseInt(fields[5].trim()));
                    genZ_LiDo.add(fields[6].trim());
                }
            }
        } catch (IOException | NumberFormatException e) {
            throw new RuntimeException("Lỗi đọc file CSV: " + e.getMessage()); 
        }
        
        if (genZ_SoNam.isEmpty()) {
            System.out.println("--- LỖI: Không tìm thấy dữ liệu Gen Z (18-28 tuổi) trong file CSV. ---");
            return report; 
        }
        System.out.println("--- (Bước 1) Đã lọc được " + genZ_SoNam.size() + " hàng dữ liệu Gen Z. ---");

        // ------------------------------------------------------------------
        // BƯỚC 2: THỰC HIỆN THỐNG KÊ MÔ TẢ
        // ------------------------------------------------------------------
        System.out.println("--- (Bước 2) Đang tính Thống kê mô tả (Gen Z)... ---");
        List<Double> soCongViecDouble = new ArrayList<>();
        for (Integer val : genZ_SoCongViec) { soCongViecDouble.add((double) val); }
        report.setSoNamLamViecStats(calculateDescriptiveStats(genZ_SoNam));
        report.setMucLuongStats(calculateDescriptiveStats(genZ_MucLuong));
        report.setSoCongViecStats(calculateDescriptiveStats(soCongViecDouble));
        report.setLiDoThayDoiCongViecCounts(calculateFrequency(genZ_LiDo));
        
        double[] arrGenZ_SoNam = listToArray(genZ_SoNam);
        double[] arrGenZ_MucLuong = listToArray(genZ_MucLuong);
        double[] arrGenZ_SoCongViec = listToArray(soCongViecDouble);

        // ------------------------------------------------------------------
        // BƯỚC 3: PHÂN TÍCH TƯƠNG QUAN (VÀ KIỂM ĐỊNH)
        // ------------------------------------------------------------------
        System.out.println("--- (Bước 3) Đang tính Tương quan (Gen Z)... ---");
        int n = arrGenZ_SoNam.length; // Số lượng mẫu Gen Z
        int df_corr = n - 2; // Bậc tự do cho kiểm định tương quan

        if (n > 2) { // Cần ít nhất 3 mẫu để (n-2) > 0
            PearsonsCorrelation correlation = new PearsonsCorrelation();
            
            // 1. Tương quan Lương vs Năm
            double r_Luong = correlation.correlation(arrGenZ_SoNam, arrGenZ_MucLuong);
            report.setCorrelationLuongVsNamLamViec(r_Luong);
            
            // 2. Tương quan Số CV vs Năm
            double r_SoCV = correlation.correlation(arrGenZ_SoNam, arrGenZ_SoCongViec);
            report.setCorrelationSoCongViecVsNamLamViec(r_SoCV);

            // *** PHẦN MỚI: KIỂM ĐỊNH R (Mục 10.10) ***
            System.out.println("--- (Bước 3.1) Đang kiểm định Hệ số Tương quan... ---");
            TDistribution tDist = new TDistribution(df_corr);

            // Kiểm định cho r_Luong
            if (Math.abs(r_Luong) < 1.0) { // Tránh lỗi chia cho 0 nếu r = 1
                double t_Luong = (r_Luong * Math.sqrt(df_corr)) / Math.sqrt(1 - r_Luong * r_Luong);
                double p_Luong = 2.0 * tDist.cumulativeProbability(-Math.abs(t_Luong)); // P-value 2 phía
                report.setTStatistic_corr_Luong(t_Luong);
                report.setPValue_corr_Luong(p_Luong);
            }
            
            // Kiểm định cho r_SoCV
            if (Math.abs(r_SoCV) < 1.0) {
                double t_SoCV = (r_SoCV * Math.sqrt(df_corr)) / Math.sqrt(1 - r_SoCV * r_SoCV);
                double p_SoCV = 2.0 * tDist.cumulativeProbability(-Math.abs(t_SoCV)); // P-value 2 phía
                report.setTStatistic_corr_SoCongViec(t_SoCV);
                report.setPValue_corr_SoCongViec(p_SoCV);
            }
        }

        // ------------------------------------------------------------------
        // BƯỚC 4: KIỂM ĐỊNH T-TEST 1 MẪU
        // ------------------------------------------------------------------
        System.out.println("--- (Bước 4) Đang chạy T-Test 1 Mẫu (Gen Z)... ---");
        if (n > 1) {
            TTest tTest = new TTest();
            double mu_0 = report.getMu0(); // 2.0
            double tStatistic = tTest.t(mu_0, arrGenZ_SoNam);
            double pValueTwoSided = tTest.tTest(mu_0, arrGenZ_SoNam);
            double pValueOneSidedLess = pValueTwoSided / 2.0;
            if (tStatistic > 0) {
                pValueOneSidedLess = 1.0 - pValueOneSidedLess;
            }
            report.setTStatistic_1_Sample(tStatistic);
            report.setPValue_1_Sample(pValueOneSidedLess);
        }

        // ------------------------------------------------------------------
        // BƯỚC 5: MÔ HÌNH HÓA XÁC SUẤT
        // ------------------------------------------------------------------
        System.out.println("--- (Bước 5) Đang tính Phân phối Xác suất (Gen Z)... ---");
        
        double lambdaPoisson = report.getSoCongViecStats().getMean();
        if (lambdaPoisson > 0) {
            PoissonDistribution poisson = new PoissonDistribution(lambdaPoisson);
            double probGTE3 = 1.0 - poisson.cumulativeProbability(2);
            report.setPoissonLambda(lambdaPoisson);
            report.setPoissonProbGTE3(probGTE3);
        }
        
        double meanTimeExp = report.getSoNamLamViecStats().getMean();
        if (meanTimeExp > 0) {
            ExponentialDistribution exponential = new ExponentialDistribution(meanTimeExp); 
            double probLTE1_5 = exponential.cumulativeProbability(1.5);
            report.setExpMeanTime(meanTimeExp);
            report.setExpProbLTE1_5(probLTE1_5);
        }

        System.out.println("--- Hoàn thành tất cả 5 bước phân tích. ---");
        return report;
    }

    // --- CÁC HÀM HỖ TRỢ (Không thay đổi) ---

    private double[] listToArray(List<Double> list) {
        double[] array = new double[list.size()];
        for (int i = 0; i < list.size(); i++) array[i] = list.get(i);
        return array;
    }

    private DescriptiveStatsDTO calculateDescriptiveStats(List<Double> data) {
        DescriptiveStatsDTO stats = new DescriptiveStatsDTO();
        if (data == null || data.isEmpty()) return stats;
        double sum = 0;
        for (double val : data) sum += val;
        double mean = sum / data.size();
        stats.setMean(mean);
        Collections.sort(data);
        double median;
        int size = data.size();
        if (size % 2 == 0) {
            median = (data.get(size / 2 - 1) + data.get(size / 2)) / 2.0;
        } else {
            median = data.get(size / 2);
        }
        stats.setMedian(median);
        if (size > 1) {
            double sumSqDiff = 0;
            for (double val : data) sumSqDiff += Math.pow(val - mean, 2);
            double stdDev = Math.sqrt(sumSqDiff / (size - 1));
            stats.setStdDev(stdDev);
        } else {
            stats.setStdDev(0.0);
        }
        return stats;
    }

    private Map<String, Integer> calculateFrequency(List<String> data) {
        Map<String, Integer> counts = new HashMap<>();
        if (data == null || data.isEmpty()) return counts;
        for (String val : data) {
            counts.put(val, counts.getOrDefault(val, 0) + 1);
        }
        return counts;
    }
}