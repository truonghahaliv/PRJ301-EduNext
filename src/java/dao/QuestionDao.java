/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dan
 */
public class QuestionDao extends DBContext {

    public void deleteQuestion(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Questions]\n"
                    + "      WHERE question_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertQuestion(Question question) {
        try {
            String sql = "INSERT INTO [dbo].[Questions]\n"
                    + "           ([assignment_id]\n"
                    + "           ,[question_content]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,\n"
                    + "		   ?)\n";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, question.getAssignmentId());
            stm.setString(2, question.getQuestionContent());

            stm.setString(3, question.getStatus());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateQuestion(int id, Question question) {
        try {
            String sql = "UPDATE [dbo].[Questions]\n"
                    + "   SET [assignment_id] = ?\n"
                    + "      ,[question_content] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE question_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, question.getAssignmentId());
            stm.setString(2, question.getQuestionContent());

            stm.setString(3, question.getStatus());
            stm.setInt(4, id);
            stm.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Question> paging(int page) {
        List<Question> list = new ArrayList<>();
        String sql = "select * from [Questions] order by question_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)
                );
                list.add(question);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalQuestion() {
        String sql = "Select count(*) from [Questions]";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Question getQuestionByName(String name) {
        String sql = "select * from Questions where question_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question c = new Question(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Question getQuestionById(int id) {
        String sql = "select * from Questions where question_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question c = new Question(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Question> getAll(int id) {
        List<Question> list = new ArrayList<>();
        String sql = "select q.* from Questions q join Assignments a \n"
                + "                on q.assignment_id = a.assignment_id where a.assignment_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question c = new Question(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Question> getAllQuestionsUser(int id) {
        List<Question> list = new ArrayList<>();
        String sql = "select q.* from Assignments l \n"
                + "join Classes cl on cl.class_id = l.class_id\n"
                + "join Class_User cu on cu.class_id = cu.class_id\n"
                + "join Users u on u.user_id = cu.user_id\n"
                + "join Questions q on q.assignment_id = l.assignment_id\n"
                + "where u.user_id =?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Question c = new Question(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        QuestionDao dao = new QuestionDao();
        System.out.println(dao.getAllQuestionsUser(3));
    }
}
