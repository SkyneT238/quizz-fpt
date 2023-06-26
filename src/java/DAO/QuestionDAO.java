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
public Answer getAnswersByQuestionId(int questionId) {
    Answer answer = new Answer();
    String query = "SELECT answer1, answer2, answer3, correctAnswer\n"
            + "FROM tblQuestion\n"
            + "WHERE questionID = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, questionId);
        rs = ps.executeQuery();
        if (rs.next()) {
            List<String> answers = new ArrayList<>();
            answers.add(rs.getString("answer1"));
            answers.add(rs.getString("answer2"));
            answers.add(rs.getString("answer3"));
            answer.setCorrectAnswer(rs.getString("correctAnswer"));

            // Xáo trộn thứ tự các câu trả lời
            Collections.shuffle(answers);

            // Gán giá trị các câu trả lời đã xáo trộn vào đối tượng Answer
            answer.setAnswer1(answers.get(0));
            answer.setAnswer2(answers.get(1));
            answer.setAnswer3(answers.get(2));
        }
    } catch (Exception e) {
        // Xử lý ngoại lệ (exception handling)
    }
    return answer;
}
     public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        List<Question> list = dao.getQuestion(1);
        for (Question c : list) {
            System.out.println(c);
        }

    }

}
