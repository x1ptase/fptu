<%-- ĐƯỢC CẬP NHẬT: Sửa lỗi cú pháp $H_0: \rho = 0$ --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kết Quả Phân Tích (Gen Z)</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f4f4f4; }
        h1 { color: #333; }
        h2 { color: #0056b3; border-bottom: 2px solid #0056b3; padding-bottom: 5px; }
        .container { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); max-width: 900px; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .result-block { margin-bottom: 25px; }
        .result-item { margin: 10px 0; }
        .result-label { font-weight: bold; color: #555; }
        .proof { font-style: italic; color: #666; font-size: 0.9em; padding-left: 15px; }
        .significant { color: red; font-weight: bold; }
        .not-significant { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Kết Quả Phân Tích Xu Hướng "Nhảy Việc" (Chỉ Gen Z)</h1>

        <c:set var="report" value="${requestScope.REPORT}" />
        <c:set var="error" value="${requestScope.ERROR_MESSAGE}" />

        <c:if test="${not empty error}">
            <h2 style="color: red;">Đã xảy ra lỗi</h2>
            <p style="color: red;">${error}</p>
        </c:if>
        
        <c:if test="${empty report || empty report.soNamLamViecStats || report.soNamLamViecStats.mean == 0}">
            <p style="color: red;">Không có đủ dữ liệu Gen Z (tuổi 18-28) để thực hiện phân tích.</p>
        </c:if>

        <c:if test="${not empty report && not empty report.soNamLamViecStats && report.soNamLamViecStats.mean > 0}">
            
            <div class="result-block">
                <h2>Bước 2: Thống Kê Mô Tả (Gen Z)</h2>
                <%-- (Code của Bước 2 không thay đổi) --%>
                <h3>Bảng 1: Thống kê các biến định lượng</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Biến</th>
                            <th>Trung bình (Mean)</th>
                            <th>Trung vị (Median)</th>
                            <th>Độ lệch chuẩn (StdDev)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Số năm làm việc</td>
                            <td><fmt:formatNumber value="${report.soNamLamViecStats.mean}" maxFractionDigits="2"/> năm</td>
                            <td><fmt:formatNumber value="${report.soNamLamViecStats.median}" maxFractionDigits="2"/> năm</td>
                            <td><fmt:formatNumber value="${report.soNamLamViecStats.stdDev}" maxFractionDigits="2"/></td>
                        </tr>
                        <tr>
                            <td>Lương (Triệu VND)</td>
                            <td><fmt:formatNumber value="${report.mucLuongStats.mean}" maxFractionDigits="2"/> triệu</td>
                            <td><fmt:formatNumber value="${report.mucLuongStats.median}" maxFractionDigits="2"/> triệu</td>
                            <td><fmt:formatNumber value="${report.mucLuongStats.stdDev}" maxFractionDigits="2"/></td>
                        </tr>
                        <tr>
                            <td>Số CV đã làm</td>
                            <td><fmt:formatNumber value="${report.soCongViecStats.mean}" maxFractionDigits="2"/> CV</td>
                            <td><fmt:formatNumber value="${report.soCongViecStats.median}" maxFractionDigits="2"/> CV</td>
                            <td><fmt:formatNumber value="${report.soCongViecStats.stdDev}" maxFractionDigits="2"/></td>
                        </tr>
                    </tbody>
                </table>
                
                <h3>Bảng 2: Tần suất 'Lí do thay đổi công việc' (Gen Z)</h3>
                <table>
                    <thead>
                        <tr><th>Lí do</th><th>Số lượng (Tần suất)</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${report.liDoThayDoiCongViecCounts}">
                            <tr>
                                <td>${entry.key}</td>
                                <td>${entry.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="result-block">
                <h2>Bước 3: Phân Tích Tương Quan (Gen Z)</h2>
                
                <div class="result-item">
                    <span class="result-label">Hệ số r (Lương vs. Số năm làm việc):</span>
                    <fmt:formatNumber value="${report.correlationLuongVsNamLamViec}" maxFractionDigits="4"/>
                    
                    <%-- PHẦN MỚI: Hiển thị chứng minh cho r --%>
                    <div class="proof">
                        <%-- SỬA LỖI: Bỏ ký tự $ và \rho --%>
                        (Kiểm định H0: p = 0) -&gt; 
                        T-statistic: <fmt:formatNumber value="${report.TStatistic_corr_Luong}" maxFractionDigits="4"/>, 
                        P-value: <fmt:formatNumber value="${report.PValue_corr_Luong}" maxFractionDigits="6"/>
                        
                        <c:choose>
                            <c:when test="${report.PValue_corr_Luong < 0.05}">
                                <span class="significant">(Có ý nghĩa thống kê)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="not-significant">(Không có ý nghĩa thống kê)</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                
                <div class="result-item">
                    <span class="result-label">Hệ số r (Số CV đã làm vs. Số năm làm việc):</span>
                    <fmt:formatNumber value="${report.correlationSoCongViecVsNamLamViec}" maxFractionDigits="4"/>
                    
                    <%-- PHẦN MỚI: Hiển thị chứng minh cho r --%>
                    <div class="proof">
                        <%-- SỬA LỖI: Bỏ ký tự $ và \rho --%>
                        (Kiểm định H0: p = 0) -&gt; 
                        T-statistic: <fmt:formatNumber value="${report.TStatistic_corr_SoCongViec}" maxFractionDigits="4"/>, 
                        P-value: <fmt:formatNumber value="${report.PValue_corr_SoCongViec}" maxFractionDigits="6"/>
                        
                        <c:choose>
                            <c:when test="${report.PValue_corr_SoCongViec < 0.05}">
                                <span class="significant">(Có ý nghĩa thống kê)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="not-significant">(Không có ý nghĩa thống kê)</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="result-block">
                <h2>Bước 4: Kiểm Định Giả Thuyết T-Test 1 Mẫu (Gen Z)</h2>
                <%-- (Code của Bước 4 không thay đổi) --%>
                <div class="result-item">
                    <span class="result-label">Giả thuyết:</span>
                    H0: Trung bình 'Số năm làm việc' = ${report.mu0} năm
                    <br/>
                    H1: Trung bình 'Số năm làm việc' &lt; ${report.mu0} năm
                </div>
                <div class="result-item">
                    <span class="result-label">Giá trị Thống kê T (T0):</span>
                    <fmt:formatNumber value="${report.TStatistic_1_Sample}" maxFractionDigits="4"/>
                </div>
                <div class="result-item">
                    <span class="result-label">Giá trị P-value:</span>
                    <fmt:formatNumber value="${report.PValue_1_Sample}" maxFractionDigits="6"/>
                </div>
                <div class="result-item">
                    <span class="result-label">Kết luận (với alpha = 0.05):</span>
                    <c:choose>
                        <c:when test="${report.PValue_1_Sample < 0.05}">
                            <strong style="color: red;">Bác bỏ H0. Có bằng chứng cho thấy trung bình nhỏ hơn ${report.mu0} năm.</strong>
                        </c:when>
                        <c:otherwise>
                            <strong style="color: green;">Không đủ cơ sở bác bỏ H0.</strong>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="result-block">
                <h2>Bước 5: Mô Hình Hóa Phân Phối Xác Suất (Gen Z)</h2>
                <%-- (Code của Bước 5 không thay đổi) --%>
                <h3>Phân phối Poisson (Số công việc đã làm)</h3>
                <div class="result-item">
                    <span class="result-label">Tham số Lambda (Số CV trung bình):</span>
                    <fmt:formatNumber value="${report.poissonLambda}" maxFractionDigits="4"/>
                </div>
                <div class="result-item">
                    <span class="result-label">P(X >= 3) (Xác suất có 3 CV trở lên):</span>
                    <fmt:formatNumber value="${report.poissonProbGTE3}" type="percent" maxFractionDigits="2"/>
                </div>

                <h3>Phân phối Mũ (Số năm làm việc)</h3>
                <div class="result-item">
                    <span class="result-label">Thời gian trung bình (1/Lambda):</span>
                    <fmt:formatNumber value="${report.expMeanTime}" maxFractionDigits="4"/> năm
                </div>
                <div class="result-item">
                    <span class="result-label">P(X <= 1.5) (Xác suất nghỉ việc trong 1.5 năm):</span>
                    <fmt:formatNumber value="${report.expProbLTE1_5}" type="percent" maxFractionDigits="2"/>
                </div>
            </div>
            
        </c:if>
        
        <br/>
        <a href="MainController">Quay về trang chủ</a>
    </div>
</body>
</html>