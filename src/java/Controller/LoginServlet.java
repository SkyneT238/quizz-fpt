/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LoginDAO;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.*;

/**
 *
 * @author ducnl
 */
public class LoginServlet extends HttpServlet {

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
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        Cookie cEmail = new Cookie("cEmail", email);
        Cookie cPass =  new Cookie ("cPass",pass);
        Cookie cRemember = new Cookie("cRemember", remember);

        try {
            LoginDAO login = new LoginDAO();
            Account a = login.checkLogin(email, pass);
            request.setAttribute("email", email);
            if (login.isEmpty(email) || login.isEmpty(pass)) {
                request.setAttribute("status", "error");
                request.setAttribute("title", "Oops...");
                request.setAttribute("message", "*Please provide both email and password!");
                request.getRequestDispatcher("loginView.jsp").forward(request, response);
            } else if (a == null) {
                request.setAttribute("status", "error");
                request.setAttribute("title", "Oops...");
                request.setAttribute("message", "*Wrong email or password!");
                request.getRequestDispatcher("loginView.jsp").forward(request, response);
            } else {
                
                if(remember != null)
                {
                    cEmail.setMaxAge(-1);
                    cPass.setMaxAge(-1);
                    cRemember.setMaxAge(-1);                     
                }
                else 
                {
                    cEmail.setMaxAge(0);
                    cPass.setMaxAge(0);
                    cRemember.setMaxAge(0);   
                }
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
                String encodedUsername = URLEncoder.encode(a.getUsername(), "UTF-8");
                String encodeUser = URLEncoder.encode(a.getUsername(), "UTF-8");
                request.getSession().setAttribute("user", a);
                request.setAttribute("status", "success");
                request.setAttribute("title", "Great!");
                request.setAttribute("message", "You have successfully logged in!");
                //request.getRequestDispatcher("dashboardView.jsp").forward(request, response);
                  response.sendRedirect("dashboardView.jsp?username=" + encodedUsername);
            }
        } catch (Exception e) {
        }
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
