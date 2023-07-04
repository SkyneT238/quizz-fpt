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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class QuizServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Question> questions = (List<Question>) request.getSession().getAttribute("exam");
        List<String> ans = (List<String>) request.getSession().getAttribute("ans");
        int page, numPerPage = 1;
      
     
        String currenPage = request.getParameter("page");
        
        if (questions == null) {
            String courseIdParam = request.getParameter("courseID");
            int courseId = Integer.parseInt(courseIdParam);
            QuestionDAO dao = new QuestionDAO();
            questions = dao.getQuestion(courseId);
            request.getSession().setAttribute("exam", questions);
        }
        
        int size = questions.size();
       int num = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        if (ans == null) {
            ans = new ArrayList<>(Collections.nCopies(size, null));
        }

        if (currenPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(currenPage);
        }
        int prePage = request.getParameter("prePage") == null ? 1 : Integer.parseInt(request.getParameter("prePage"));
        ans.set(prePage-1, getAns(request));
        request.getSession().setAttribute("ans", ans);

        int start = (page - 1) * numPerPage;
        int end = Math.min(page * numPerPage, size);

        List<Question> listOfPage = getListPage(questions, start, end);

        request.setAttribute("data", listOfPage);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        System.out.println(ans.toString());
        request.getRequestDispatcher("quizView.jsp").forward(request, response);
    }

    public List<Question> getListPage(List<Question> list, int start, int end) {
        List<Question> rList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            rList.add(list.get(i));
        }
        return rList;
    }

    public String getAns(HttpServletRequest request) {
        for (int i = 1; i < 5; i++) {
            if (request.getParameter("answer_" + i) != null) {
                return request.getParameter("answer_" + i);
            }
        }
        return null;
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
