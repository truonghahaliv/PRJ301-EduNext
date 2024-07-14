/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.User;
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
public class UserDao extends DBContext {

    public void insertUser(User user) {
        try {
            String sql = "INSERT INTO [dbo].[Users]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?\n"
                    + "           )";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getPassword());

            stm.setString(3, user.getEmail());
            stm.setString(4, user.getRole());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                User user = new User(
                        rs.getInt(1), // userId
                        rs.getString(2), // username
                        rs.getString(3), // password
                        rs.getString(4), // email
                        rs.getString(5) // role
                );
                userList.add(user);
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return userList;
    }

    public List<User> getAllStudents() {
        List<User> userList = new ArrayList<>();
        String sql = "select distinct  u.*\n"
                + "from Users u join Class_User cu on u.user_id = cu.user_id\n"
                + "join Classes c on c.class_id = cu.class_id\n"
                + "where   u.role = 'student'";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                User user = new User(
                        rs.getInt(1), // userId
                        rs.getString(2), // username
                        rs.getString(3), // password
                        rs.getString(4), // email
                        rs.getString(5) // role
                );
                userList.add(user);
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return userList;
    }

    // Method to update user role based on user ID
    public void updateUser(int userId, User user) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[role] = ?\n"
                + " WHERE user_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getRole());
            statement.setInt(5, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // Method to delete user based on user ID
    public void deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE user_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // Method to retrieve user by ID
    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE user_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt(1), // userId
                        rs.getString(2), // username
                        rs.getString(3), // password
                        rs.getString(4), // email
                        rs.getString(5) // role
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // Method to check if an email exists in the database
    public User checkEmailExists(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt(1), // userId
                        rs.getString(2), // username
                        rs.getString(3), // password
                        rs.getString(4), // email
                        rs.getString(5) // role
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // Method to validate user login
    public User checkLogin(String email, String password) {
        String sql = "SELECT * FROM Users WHERE email = ? AND password = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt(1), // userId
                        rs.getString(2), // username
                        rs.getString(3), // password
                        rs.getString(4), // email
                        rs.getString(5) // role
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public static void main(String[] args) {
        UserDao dao = new UserDao();
        System.out.println(dao.getAllStudents());
    }

}
