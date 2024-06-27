/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Course;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dan
 */
public class CourseDao extends DBContext {

    public void deleteCourse(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Courses]\n"
                    + "      WHERE course_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertCourse(Course course) {
        try {
            String sql = "INSERT INTO [dbo].[Courses]\n"
                    + "           ([course_name]\n"
                    + "           ,[description])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";

            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, course.getCourseName());
            stm.setString(2, course.getDescription());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateUser(int userId, Course user) throws SQLException {
        String sql = "UPDATE [dbo].[Courses]\n"
                + "   SET [course_name] = ?\n"
                + "      ,[description] = ?\n"

                + " WHERE course_id = ?";

        PreparedStatement statement = connect.prepareStatement(sql);
        statement.setString(1, user.getCourseName());
        statement.setString(2, user.getDescription());
      
        statement.setInt(3, userId);
        statement.executeUpdate();

    }

    public List<Course> paging(int page) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from [Courses] order by course_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(
                        rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(course);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalCourse() {
        String sql = "Select count(*) from [Courses]";
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

    public Course getCourseByName(String name) {
        String sql = "select * from Courses where course_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course c = new Course(
                        rs.getInt(1), rs.getString(2), rs.getString(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Course getCourseById(int id) {
        String sql = "select * from Courses where course_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course c = new Course(
                        rs.getInt(1), rs.getString(2), rs.getString(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Course> getAll() {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Courses";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course c = new Course(
                        rs.getInt(1), rs.getString(2), rs.getString(3)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CourseDao dao = new CourseDao();
        System.out.println(dao.getAll());
    }
}
