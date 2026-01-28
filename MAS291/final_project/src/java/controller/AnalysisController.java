package controller; // Hoặc com.yourpackage.controller

import dto.AnalysisReportDTO;
import service.AnalysisService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnalysisController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp"; // (Nên tạo file này)
    private static final String SUCCESS_PAGE = "analysisResult.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        
        try {
            // 1. Lấy đường dẫn thực của file CSV trong WEB-INF
            String csvFileName = "/WEB-INF/gen_z_survey_final.csv";
            String csvFilePath = getServletContext().getRealPath(csvFileName);
            
            // 2. Khởi tạo Service
            AnalysisService service = new AnalysisService();
            
            // 3. Gọi hàm phân tích và truyền đường dẫn file vào
            AnalysisReportDTO report = service.generateAnalysisReport(csvFilePath); 
            
            // 4. Gửi kết quả (report) sang trang JSP
            request.setAttribute("REPORT", report);
            url = SUCCESS_PAGE;
            
        } catch (Exception e) {
            log("Error at AnalysisController: " + e.toString());
            request.setAttribute("ERROR_MESSAGE", e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}