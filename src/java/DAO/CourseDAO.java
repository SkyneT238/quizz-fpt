/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Courses;
import context.DBContext;
import java.sql.*;
import java.util.*;

public class CourseDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Courses> getFeaturedCourses() {
        List<Courses> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM tblQuestionCollection;";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Courses (rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4)));
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public List<Courses> getAllCourses() {
        List<Courses> list = new ArrayList<>();
        String query = "select * from tblQuestionCollection";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                 list.add(new Courses (rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4)));
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public Courses getCourseById(int courseId) {
    String query = "select * from tblQuestionCollection where collectionID = ?";
    try {
        conn = (Connection) new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, courseId);
        rs = ps.executeQuery();
        if (rs.next()) {
            return new Courses(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
        }
    } catch (Exception e) {
    }
    return null;
}
    
   
    
    public static void main(String[] args){
        CourseDAO dao = new CourseDAO();
        Courses course =dao.getCourseById(1);
        System.out.println(course);
        
    }
}