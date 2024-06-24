/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Grade {
     private int gradeId;
    private int userId;
    private int assignmentId;
    private double grade;
    public Grade() {
    }

    public Grade(int gradeId, int userId, int assignmentId, double grade) {
        this.gradeId = gradeId;
        this.userId = userId;
        this.assignmentId = assignmentId;
        this.grade = grade;
    }
    public Grade( int userId, int assignmentId, double grade) {

        this.userId = userId;
        this.assignmentId = assignmentId;
        this.grade = grade;
    }

    // Getters and Setters
    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

}
