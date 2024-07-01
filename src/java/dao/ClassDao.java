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
import model.Class;

/**
 *
 * @author Dan
 */
public class ClassDao extends DBContext {

    public void deleteClass(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Classes]\n"
                    + "      WHERE class_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertClass(Class c) {
        try {
            String sql = "INSERT INTO [dbo].[Classes]\n"
                    + "           ([course_id]\n"
                    + "           ,[class_name])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";

            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, c.getCourseId());
            stm.setString(2, c.getClassName());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Class> paging(int page) {
        List<Class> list = new ArrayList<>();
        String sql = "select * from [Classes] order by class_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Class c = new Class(
                        rs.getInt(1), rs.getInt(2), rs.getString(3)
                );
                list.add(
                        c
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateUser(int userId, Class user) throws SQLException {
        String sql = "UPDATE [dbo].[Classes]\n"
                + "   SET [course_id] = ?\n"
                + "      ,[class_name] = ?\n"
                + " WHERE class_id = ?";

        PreparedStatement statement = connect.prepareStatement(sql);
        statement.setInt(1, user.getCourseId());
        statement.setString(2, user.getClassName());

        statement.setInt(3, userId);
        statement.executeUpdate();

    }

    public int getTotalClass() {
        String sql = "Select count(*) from [Classes]";
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

    public Class getClassByName(String name) {
        String sql = "select * from Classes where class_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Class c = new Class(
                        rs.getInt(1), rs.getInt(2), rs.getString(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Class getClassById(int id) {
        String sql = "select * from Classes where class_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Class c = new Class(
                        rs.getInt(1), rs.getInt(2), rs.getString(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Class> getAll() {
        List<Class> list = new ArrayList<>();
        String sql = "select * from Classes";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Class c = new Class(
                        rs.getInt(1), rs.getInt(2), rs.getString(3)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Class> getClassUser( int id) {
        List<Class> list = new ArrayList<>();
         
        String sql = "select c.* from\n"
                + "Classes c join  Courses co on c.course_id = co.course_id\n"
                + "join Course_User cu on cu.course_id = co.course_id\n"
                + "join Users u on u.user_id = cu.user_id\n"
                + "where u.user_id =  ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
             statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
           
            while (rs.next()) {
                Class c = new Class(
                        rs.getInt(1), rs.getInt(2), rs.getString(3)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ClassDao dao = new ClassDao();
        System.out.println(dao.getClassUser(3));
    }
}
