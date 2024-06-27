/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Course {
    private int courseId;
    private String courseName;
    private String description;

    // Constructors
    public Course() {
    }

    @Override
    public String toString() {
        return "Course{" + "courseId=" + courseId + ", courseName=" + courseName + ", description=" + description + '}';
    }

    public Course(String courseName, String description) {
        this.courseName = courseName;
        this.description = description;
    }

    public Course(int courseId, String courseName, String description) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.description = description;
    }

    // Getters and Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
