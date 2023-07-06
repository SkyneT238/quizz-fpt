/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author HP
 */
import Model.Account;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account getAccountByID(int userID) {
        String query = "SELECT * FROM tblUser WHERE userID = ?";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account updateAccount(int userID, String fullName, String contactNumber) {
        String query = "UPDATE tblUser\n"
                + "SET fullName = ?, contactNumber=?\n"
                + "WHERE userID = ?;";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, contactNumber);
            ps.setInt(3, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public boolean checkPassword(int userID, String oldPassword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = (Connection) new DBContext().getConnection(); // Khởi tạo kết nối cơ sở dữ liệu

            if (con != null) {
                String query = "SELECT pass FROM tblUser WHERE userID = ?"; // Câu truy vấn SQL để lấy mật khẩu từ cơ sở dữ liệu
                ps = con.prepareStatement(query);
                ps.setInt(1, userID); // Thiết lập tham số cho câu truy vấn
                rs = ps.executeQuery(); // Thực hiện câu truy vấn và lấy kết quả

                if (rs.next()) {
                    HashDAO hashDAO = new HashDAO(oldPassword);
                    String storedPassword = rs.getString("pass"); // Lấy mật khẩu được lưu trữ từ kết quả truy vấn                  
                    return storedPassword.equals(hashDAO.getHashCode().trim()); // Kiểm tra mật khẩu lưu trữ có khớp với mật khẩu nhập vào hay không
                }
            }
            return false; // Trả về false nếu không có kết nối cơ sở dữ liệu hoặc không tìm thấy mật khẩu trong cơ sở dữ liệu
        } catch (SQLException e) {
            e.printStackTrace(); // In thông tin lỗi (nếu có)
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    public boolean changePassword(int userID, String newPassword) {
        String query = "UPDATE tblUser SET password = ? WHERE userID = ?";
        HashDAO hashDAO = new HashDAO(newPassword);
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hashDAO.getHashCode().trim());
            ps.setInt(2, userID);
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng được ảnh hưởng bởi câu lệnh UPDATE
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        boolean b = dao.checkPassword(1, "2");
        System.out.println(b);

    }

}
