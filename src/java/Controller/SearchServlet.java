/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import Model.Courses;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


/**
 *
 * @author vohuy
 */
public class SearchServlet extends HttpServlet {

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
      
        HttpSession session = request.getSession();
        List<Courses> list = (List<Courses>) session.getAttribute("cList");
        if (list == null) {
            CourseDAO dao = new CourseDAO();
            list = dao.getAllCourses();
            session.setAttribute("cList", list);
           

        }
         List<Courses> searchResult = searchCourses(list, request.getParameter("key"));
            System.out.println(searchResult);
            System.out.println(request.getParameter("key"));
    }

public static List<Courses> searchCourses(List<Courses> courseList, String keyword) {
    List<Courses> result = new ArrayList<>();

    for (Courses course : courseList) {
        double similarity = calculateSimilarity(course, keyword);
        course.setSimilarityScore(similarity);
    }

    Collections.sort(courseList, Comparator.comparingDouble(Courses::getSimilarityScore).reversed());

    int count = Math.min(3, courseList.size());
    for (int i = 0; i < count; i++) {
        result.add(courseList.get(i));
    }

    return result;
}

private static double calculateSimilarity(Courses course, String keyword) {
    String lowercaseKeyword = keyword.toLowerCase();
    String lowercaseCourseName = course.getCourseName().toLowerCase();
    String lowercaseCourseInfo = course.getCourseInfo().toLowerCase();

    int nameSimilarity = calculateSimilarityScore(lowercaseCourseName, lowercaseKeyword);
    int infoSimilarity = calculateSimilarityScore(lowercaseCourseInfo, lowercaseKeyword);

    // Give higher priority to courseName similarity
    return (nameSimilarity * 0.7) + (infoSimilarity * 0.3);
}

private static int calculateSimilarityScore(String str1, String str2) {
    int[][] dp = new int[str1.length() + 1][str2.length() + 1];

    for (int i = 0; i <= str1.length(); i++) {
        dp[i][0] = i;
    }
    for (int j = 0; j <= str2.length(); j++) {
        dp[0][j] = j;
    }

    for (int i = 1; i <= str1.length(); i++) {
        for (int j = 1; j <= str2.length(); j++) {
            if (str1.charAt(i - 1) == str2.charAt(j - 1)) {
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                dp[i][j] = Math.min(dp[i - 1][j - 1], Math.min(dp[i][j - 1], dp[i - 1][j])) + 1;
            }
        }
    }

    return dp[str1.length()][str2.length()];
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
