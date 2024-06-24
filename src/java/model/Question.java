/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Question {
     private int questionId;
    private int assignmentId;
    private String questionContent;
    private String status;
    public Question() {
    }

    public Question(int assignmentId, String questionContent, String status) {
        this.assignmentId = assignmentId;
        this.questionContent = questionContent;
        this.status = status;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Question(int questionId, int assignmentId, String questionContent, String status) {
        this.questionId = questionId;
        this.assignmentId = assignmentId;
        this.questionContent = questionContent;
        this.status = status;
    }
}
