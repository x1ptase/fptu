<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Xem Dữ Liệu CSV</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f4f4f4; }
        h1 { color: #333; }
        .container { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); max-width: 1200px; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; font-size: 0.9em; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Toàn bộ Dữ liệu từ file 'gen_z_survey_final.csv'</h1>

        <c:set var="list" value="${requestScope.SURVEY_LIST}" />

        <c:if test="${empty list}">
            <p style="color: red;">Không tìm thấy dữ liệu hoặc file CSV rỗng.</p>
        </c:if>

        <c:if test="${not empty list}">
            <table>
                <thead>
                    <tr>
                        <th>Giới tính</th>
                        <th>Tuổi</th>
                        <th>Lĩnh vực</th>
                        <th>Số năm KN</th>
                        <th>Lương (Triệu)</th>
                        <th>Số CV đã làm</th>
                        <th>Lí do</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}">
                        <tr>
                            <td>${dto.gioiTinh}</td>
                            <td>${dto.doTuoi}</td>
                            <td>${dto.linhVuc}</td>
                            <td>${dto.soNamLamViec}</td>
                            <td>${dto.mucLuong}</td>
                            <td>${dto.soCongViec}</td>
                            <td>${dto.liDo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <br/>
        <a href="MainController">Quay về trang chủ</a>
    </div>
</body>
</html>