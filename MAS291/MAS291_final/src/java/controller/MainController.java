package controller; // Hoặc com.yourpackage.controller

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
    
    private static final String WELCOME_PAGE = "index.jsp"; 
    private static final String ANALYSIS_CONTROLLER = "AnalysisController";
    private static final String VIEW_SURVEY_CONTROLLER = "ViewSurveyController"; // <-- THÊM DÒNG NÀY

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = WELCOME_PAGE;
        String action = request.getParameter("action");
        
        try {
            if (action == null) {
                url = WELCOME_PAGE;
            } else if (action.equals("Analyze")) {
                url = ANALYSIS_CONTROLLER;
            } else if (action.equals("ViewSurveys")) { // <-- THÊM KHỐI NÀY
                url = VIEW_SURVEY_CONTROLLER;
            }
            
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    // (Giữ nguyên doGet và doPost)
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods.">
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}