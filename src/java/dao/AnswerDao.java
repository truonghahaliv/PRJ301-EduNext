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
import model.Answer;

/**
 *
 * @author Dan
 */
public class AnswerDao extends DBContext {

    public void deleteAnswer(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Answers]\n"
                    + "      WHERE answer_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertAnswer(Answer answer) {
        try {
            String sql = "INSERT INTO [dbo].[Answers]\n"
                    + "           ([question_id]\n"
                    + "           ,[user_id]\n"
                    + "           ,[answer_content]\n"
                    + "           ,[created_at])"
                    + "     VALUES\n"
                    + "           (?,?,?,?";

            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, answer.getQuestionId());
            stm.setInt(2, answer.getUserId());
            stm.setString(3, answer.getAnswerContent());
            stm.setString(4, answer.getCreatedAt());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Answer> paging(int page) {
        List<Answer> list = new ArrayList<>();
        String sql = "select * from [Answers] order by answer_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Answer answer = new Answer(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5));
                list.add(answer);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalAnswer() {
        String sql = "Select count(*) from [Answers]";
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

    public Answer getAnswerByName(String name) {
        String sql = "select * from Answers where answer_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Answer c = new Answer(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Answer getAnswerById(int id) {
        String sql = "select * from Answers where answer_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Answer c = new Answer(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }


    public List<Answer> getAll() {
        List<Answer> list = new ArrayList<>();
        String sql = "select * from Answers";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Answer c = new Answer(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        AnswerDao dao = new AnswerDao();
        System.out.println(dao.getAnswerById(1));
    }
}
