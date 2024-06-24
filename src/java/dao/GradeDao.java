/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import context.DBContext;
import model.Grade;
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
public class GradeDao extends DBContext{
    public void deletegrade(int id) {
        try {
            String sql = "DELETE FROM [dbo].[grades]\n"
                    + "      WHERE grade_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertgrade(Grade grade) {
        try {
            String sql = "INSERT INTO [dbo].[grades]\n"
                    + "           ([user_id]\n"
                    + "           ,[assignment_id]\n"
                    + "           ,[grade])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,\n"
                    + "		   ?)\n"
                    + "GO";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, grade.getUserId());
            stm.setInt(2, grade.getAssignmentId());
            stm.setDouble(3, grade.getGrade());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Grade> paging(int page) {
        List<Grade> list = new ArrayList<>();
        String sql = "select * from [grades] order by gradeid asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade(
                        rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getDouble(4)                );
                list.add(grade);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalgrade() {
        String sql = "Select count(*) from [grades]";
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

    public Grade getgradeByName(String name) {
        String sql = "select * from grades where grade_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Grade c = new Grade(
                        rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getDouble(4)                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Grade getgradeById(int id) {
        String sql = "select * from grades where grade_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Grade c = new Grade(
                        rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getDouble(4));                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    

    public List<Grade> getAll() {
        List<Grade> list = new ArrayList<>();
        String sql = "select * from grades";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Grade c = new Grade(
                        rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getDouble(4)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        GradeDao dao = new GradeDao();
        System.out.println(dao.getAll());
    }
}
