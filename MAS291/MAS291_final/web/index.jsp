<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ - Phân tích MAS291</title>
        <style>
            body { font-family: Arial, sans-serif; display: grid; place-items: center; min-height: 80vh; background-color: #f9f9f9; }
            .container { text-align: center; padding: 40px; background-color: #fff; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
            h1 { color: #333; }
            .button {
                background-color: #007bff;
                color: white;
                padding: 15px 30px;
                text-decoration: none;
                border: none;
                border-radius: 5px;
                font-size: 1.2em;
                transition: background-color 0.3s;
                cursor: pointer;
                margin: 10px;
            }
            .button:hover { background-color: #0056b3; }
            .view-button { background-color: #28a745; }
            .view-button:hover { background-color: #218838; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Dự án Cuối kỳ MAS291</h1>
            <p>Phân tích Xu hướng "Nhảy việc" của Gen Z từ file CSV</p>
            <br/>
            
            <form action="MainController" method="POST" style="display: inline;">
                <input type="hidden" name="action" value="Analyze" />
                <input type="submit" value="Bắt đầu Phân tích 5 Bước" class="button" />
            </form>
            
            <form action="MainController" method="POST" style="display: inline;">
                <input type="hidden" name="action" value="ViewSurveys" />
                <input type="submit" value="Xem Toàn Bộ Dữ Liệu (CSV)" class="button view-button" />
            </form>
        </div>
    </body>
</html>