/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Assignment {
      private int assignmentId;
    private int classId;
    private String assignmentName;
    private String description;
    private String startTime;
    private String endTime;

    public Assignment() {
    }

    public Assignment(int assignmentId, int classId, String assignmentName, String description, String startTime, String endTime) {
        this.assignmentId = assignmentId;
        this.classId = classId;
        this.assignmentName = assignmentName;
        this.description = description;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Assignment(int classId, String assignmentName, String description, String startTime, String endTime) {
        this.classId = classId;
        this.assignmentName = assignmentName;
        this.description = description;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getAssignmentName() {
        return assignmentName;
    }

    public void setAssignmentName(String assignmentName) {
        this.assignmentName = assignmentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    
}
