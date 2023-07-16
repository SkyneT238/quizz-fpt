/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import Model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CreateTest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        LocalDateTime currentDateTime = LocalDateTime.now();
        int day = currentDateTime.getDayOfMonth();
        int month = currentDateTime.getMonthValue();
        int year = currentDateTime.getYear();
        int minutes = currentDateTime.getMinute();
        int seconds = currentDateTime.getSecond();
        int hour = currentDateTime.getHour();
        String startTime = day + "/" + month + "/" + year + " " + hour + ":" + minutes + ":" + seconds;
        request.getSession().setAttribute("start", startTime);
        String courseIdParam = request.getParameter("courseID");

        if (request.getSession().getAttribute("exam") == null) {
            int courseId = Integer.parseInt(courseIdParam);
            QuestionDAO dao = new QuestionDAO();
            List<Question> questions = dao.getQuestion(courseId);
            List<String> ans = new ArrayList<>(Collections.nCopies(questions.size(), null));
            request.getSession().setAttribute("exam", questions);
            request.getSession().setAttribute("ans", ans);
        }
        Cookie testing = new Cookie("testing","1");
        testing.setMaxAge(-1);
        response.addCookie(testing);
        
        request.getSession().setAttribute("courseID", courseIdParam);
        request.getRequestDispatcher("/quiz").forward(request, response);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
