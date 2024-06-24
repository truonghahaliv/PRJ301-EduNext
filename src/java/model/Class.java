/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Class {
    private int classId;
    private int courseId;
    private String className;

    // Constructors
    public Class() {
    }

    public Class(int courseId, String className) {
        this.courseId = courseId;
        this.className = className;
        
    }

    public Class(int classId, int courseId, String className) {
        this.classId = classId;
        this.courseId = courseId;
        this.className = className;
       
    }

    // Getters and Setters
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

   
}
