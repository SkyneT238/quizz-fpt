package DAO;
import Model.Answer;
import Model.Question;
import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class QuestionDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Question> getQuestion(int id) {
        List<Question> list = new ArrayList<>();
        String query = "SELECT TOP 5 *\n"
                + "FROM tblQuestion\n"
                + "WHERE collectionID = ?\n"
                + "  AND difficulty IN (1, 1, 2, 2, 3)\n"
                + "ORDER BY NEWID()";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int questionId = rs.getInt("questionID");
                list.add(new Question(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10)
                ));
            }
        } catch (Exception e) {

        }
        return list;
    }
     public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        List<Question> list = dao.getQuestion(1);
        for (Question c : list) {
            System.out.println(c);
        }

    }

}