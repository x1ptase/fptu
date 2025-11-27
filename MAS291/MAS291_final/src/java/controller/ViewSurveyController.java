package controller; // Hoặc com.yourpackage.controller

import dto.SurveyDTO;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewSurveyController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp"; // (Nên tạo file này)
    private static final String SUCCESS_PAGE = "surveyResult.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        
        try {
            // 1. Lấy đường dẫn thực của file CSV trong WEB-INF
            String csvFileName = "/WEB-INF/gen_z_survey_final.csv";
            String csvFilePath = getServletContext().getRealPath(csvFileName);
            
            List<SurveyDTO> surveyList = new ArrayList<>();
            
            // 2. Đọc file CSV
            try (BufferedReader br = new BufferedReader(new FileReader(csvFilePath))) {
                String line;
                br.readLine(); // Bỏ qua dòng tiêu đề (Header)

                while ((line = br.readLine()) != null) {
                    String[] fields = line.split(",");
                    if (fields.length < 7) continue; 

                    // 3. Nạp vào SurveyDTO
                    SurveyDTO dto = new SurveyDTO();
                    dto.setGioiTinh(fields[0].trim());
                    dto.setDoTuoi(Integer.parseInt(fields[1].trim()));
                    dto.setLinhVuc(fields[2].trim());
                    dto.setSoNamLamViec(Double.parseDouble(fields[3].trim()));
                    dto.setMucLuong(Integer.parseInt(fields[4].trim()));
                    dto.setSoCongViec(Integer.parseInt(fields[5].trim()));
                    dto.setLiDo(fields[6].trim());
                    
                    surveyList.add(dto);
                }
            }
            
            // 4. Gửi List sang trang JSP
            request.setAttribute("SURVEY_LIST", surveyList);
            url = SUCCESS_PAGE;
            
        } catch (Exception e) {
            log("Error at ViewSurveyController: " + e.toString());
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