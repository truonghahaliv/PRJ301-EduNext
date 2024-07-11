/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.LessonQuestion;
import model.LessonQuestion2;

/**
 *
 * @author Dan
 */
public class LessonQuestionDao extends DBContext {

    public void deleteQuestion(int lid, int id) {
        try {
            String sql = "DELETE FROM [dbo].[Lesson_question]\n" +
"      WHERE lesson_id = ? and question_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, lid);
             stm.setInt(2, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE [dbo].[Lesson_question]\n"
                + "   SET [status] = ?\n"
                + " WHERE question_id = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void updateStatus(int id, LessonQuestion question) {
        String sql = "UPDATE [dbo].[Lesson_question]\n"
                + "   SET [lesson_id] =?\n"
                + "      ,[name] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[startdate] = ?\n"
                + "      ,[enddate] = ?"
                + " WHERE question_id = ?";
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, question.getLessionId());
            stm.setString(2, question.getName());
            stm.setString(3, question.getContent());
            stm.setString(4, question.getStatus());
            stm.setString(5, question.getStart());
            stm.setString(6, question.getEnd());
             stm.setInt(7, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertQuestion(LessonQuestion question) {
        try {
            String sql = "INSERT INTO [dbo].[Lesson_question]\n"
                    + "           ([lesson_id]\n"
                    + "           ,[name]\n"
                    + "           ,[content]\n"
                    + "           ,[status]\n"
                    + "           ,[startdate]\n"
                    + "           ,[enddate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, question.getLessionId());
            stm.setString(2, question.getName());
            stm.setString(3, question.getContent());
            stm.setString(4, question.getStatus());
            stm.setString(5, question.getStart());
            stm.setString(6, question.getEnd());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<LessonQuestion> paging(int page) {
        List<LessonQuestion> list = new ArrayList<>();
        String sql = "select * from [Lesson_question] order by question_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LessonQuestion question = new LessonQuestion(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)
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

    public LessonQuestion getQuestionByName(String name) {
        String sql = "select * from Questions where question_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                LessonQuestion c = new LessonQuestion(
                        rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public LessonQuestion getQuestionById(int id) {
        String sql = "select * from Lesson_question where question_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                LessonQuestion c = new LessonQuestion(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<LessonQuestion> getAll() {
        List<LessonQuestion> list = new ArrayList<>();
        String sql = "select * from Lesson_question";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                LessonQuestion c = new LessonQuestion(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)
                        ,rs.getString(6), rs.getString(7)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<LessonQuestion2> getAllBySlot(int id) {
        List<LessonQuestion2> list = new ArrayList<>();
        String sql = "select lq.question_id,  lq.name, lq.content, lq.status, lq.startdate, lq.enddate\n"
                + "from Lesson_question lq join Lessons l on lq.lesson_id = l.lesson_id\n"
                + "where l.lesson_id =  ? ";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                LessonQuestion2 c = new LessonQuestion2(
                        rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<LessonQuestion> getAllQuestionsSlot(int id) {
        List<LessonQuestion> list = new ArrayList<>();
        String sql = "select l.lesson_id, l.slot, l.lesson_content, lq.question_id, lq.name, lq.status from\n"
                + "Lessons l   join Lesson_question lq on l.lesson_id = lq.lesson_id\n"
                + "where l.lesson_id =?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                LessonQuestion c = new LessonQuestion(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        LessonQuestionDao dao = new LessonQuestionDao();
        System.out.println(dao.getAllBySlot(1));
    }
}
