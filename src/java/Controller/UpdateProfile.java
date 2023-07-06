/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author vohuy
 */
public class UpdateProfile extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        Account account = (Account) request.getSession().getAttribute("user");
        int userID = account.getUserID();
        String fullname = request.getParameter("fullname");
        String contactnumber = request.getParameter("contactnumber");
        String oldpass = request.getParameter("oldpassword");
        String newpass = request.getParameter("newpassword");
        AccountDAO dao = new AccountDAO();
        Account a = dao.updateAccount(userID, fullname, contactnumber);
        if (oldpass != null && !oldpass.isEmpty()) {
            // Kiểm tra mật khẩu cũ
            if (dao.checkPassword(userID, oldpass)) {
                // Cập nhật thông tin người dùng khác (ví dụ: tên đầy đủ, số điện thoại)
                Account updatedAccount = dao.updateAccount(userID, fullname, contactnumber);

                // Cập nhật thông tin người dùng trong session
                request.getSession().setAttribute("user", updatedAccount);

                // Thực hiện thay đổi mật khẩu nếu newpass được nhập
                if (newpass != null && !newpass.isEmpty()) {
                    dao.changePassword(userID, newpass);
                }

                // Chuyển hướng đến trang hiển thị thông tin người dùng
                request.getSession().setAttribute("user", updatedAccount);
                request.getRequestDispatcher("profileView.jsp").forward(request, response);
            } else {
                // Hiển thị thông báo lỗi hoặc chuyển hướng đến trang thông báo lỗi
                response.sendRedirect("error.jsp");
            }
        } else {
            // Không thực hiện thay đổi mật khẩu nếu không nhập oldpass
            // Cập nhật thông tin người dùng khác (ví dụ: tên đầy đủ, số điện thoại)
            Account updatedAccount = dao.updateAccount(userID, fullname, contactnumber);

            // Cập nhật thông tin người dùng trong session
            request.getSession().setAttribute("user", updatedAccount);

            // Chuyển hướng đến trang hiển thị thông tin người dùng
            request.getRequestDispatcher("profileView.jsp").forward(request, response);
        }
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
