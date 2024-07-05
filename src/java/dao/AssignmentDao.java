/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Assignmentes/Assignment.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Assignment;

/**
 *
 * @author Dan
 */
public class AssignmentDao extends DBContext {

    public void deleteAssignment(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Assignments]\n"
                    + "      WHERE assignment_id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void insertAssignment(Assignment assignment) {
        try {
            String sql = "INSERT INTO [dbo].[Assignments]\n"
                    + "           ([class_id]\n"
                    + "           ,[assignment_name]\n"
                    + "           ,[description]\n"
                    + "           ,[start_time]\n"
                    + "           ,[end_time])"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?"
                    ;
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, assignment.getClassId());
            stm.setString(2, assignment.getAssignmentName());
            stm.setString(3, assignment.getDescription());
            stm.setString(4, assignment.getStartTime());
            stm.setString(5, assignment.getEndTime());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Assignment> paging(int page) {
        List<Assignment> list = new ArrayList<>();
        String sql = "select * from [Assignments] order by assignment_id asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Assignment c = new Assignment(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(
                        c
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalAssignment() {
        String sql = "Select count(*) from [Assignments]";
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

    public Assignment getAssignmentByName(String name) {
        String sql = "select * from Assignments where assignment_name=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Assignment c = new Assignment(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Assignment getAssignmentById(int id) {
        String sql = "select * from Assignments where assignment_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Assignment c = new Assignment(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6)
                );
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Assignment> getAll() {
        List<Assignment> list = new ArrayList<>();
        String sql = "select * from Assignments";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Assignment c = new Assignment(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Assignment> getAllByUser(int userId, int lessonId) {
        List<Assignment> list = new ArrayList<>();
        String sql = "select a.* from Lessons l \n" +
"               join Classes cl on cl.class_id = l.class_id\n" +
"               join Class_User cu on cu.class_id = cu.class_id\n" +
"              join Users u on u.user_id = cu.user_id\n" +
"			  join Assignments a on a.assignment_id = cl.class_id\n" +
"              where u.user_id =  ? and lesson_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
              statement.setInt(1, userId);
                statement.setInt(2, lessonId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Assignment c = new Assignment(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6)
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        AssignmentDao dao = new AssignmentDao();
        System.out.println(dao.getAllByUser(3, 1));
    }
}
