/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Lesson;
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
public class LessonDao extends DBContext {

    public void deleteLesson(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Lessons]\n"
                    + "      WHERE lesson_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertLesson(Lesson lesson) {
        try {
            String sql = "INSERT INTO [dbo].[Lessons]\n"
                    + "           ([class_id]\n"
                    + "           ,[slot]\n"
                    + "           ,[lesson_content])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,\n"
                    + "		   ?)\n"
                    + "GO";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, lesson.getClassId());
            stm.setInt(2, lesson.getSlot());
            stm.setString(3, lesson.getLessonContent());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Lesson> paging(int page) {
        List<Lesson> list = new ArrayList<>();
        String sql = "select * from [Lessons] order by lessonid asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)
                );
                list.add(lesson);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalLesson() {
        String sql = "Select count(*) from [Lessons]";
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

    public Lesson getLessonByName(String name) {
        String sql = "select * from Lessons where lesson_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Lesson c = new Lesson(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Lesson getLessonById(int id) {
        String sql = "select * from Lessons where lesson_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Lesson c = new Lesson(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Lesson> getAll() {
        List<Lesson> list = new ArrayList<>();
        String sql = "select * from Lessons";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Lesson c = new Lesson(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Lesson> getAllByUser(int id) {
        List<Lesson> list = new ArrayList<>();
        String sql = "  select l.* from Lessons l \n"
                + "join Classes cl on cl.class_id = l.class_id\n"
                + "join Class_User cu on cu.class_id = cu.class_id\n"
                + "join Users u on u.user_id = cu.user_id\n"
                + "where u.user_id =  ? ";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Lesson c = new Lesson(
                        rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        LessonDao dao = new LessonDao();
        System.out.println(dao.getAllByUser(3));
    }
}
