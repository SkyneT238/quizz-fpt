/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author vohuy
 */
public class ResultData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        LocalDateTime currentTime = LocalDateTime.now();
        List<Question> questions = (List<Question>) request.getSession().getAttribute("exam");
        List<String> ans = (List<String>) request.getSession().getAttribute("ans");
        System.out.println(ans);
        System.out.println(questions);
        // Định dạng thời gian thành chuỗi hhmmddmm
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmddMM");
        String formattedTime = currentTime.format(formatter);
        request.getSession().setAttribute("testID", formattedTime);
        int correctAns = 0;
        for (int i = 0; i < questions.size(); i++) {
            if (ans.get(i) != null && questions.get(i).getCorrectAnswer().equals(ans.get(i))) {
                correctAns++;
            }

        }

        request.getSession().setAttribute("corrected", correctAns + "/" + questions.size());
        request.getSession().setAttribute("point", correctAns * 10);
        System.out.println(correctAns);

        request.getSession().removeAttribute("exam");
        request.getSession().removeAttribute("ans");
        request.getSession().removeAttribute("page");
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
