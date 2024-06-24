/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Answer {
    private int answerId;
    private int questionId;
    private int userId;
    private String answerContent;
    private String createdAt;

    public Answer() {
    }

    public Answer(int answerId, int questionId, int userId, String answerContent, String createdAt) {
        this.answerId = answerId;
        this.questionId = questionId;
        this.userId = userId;
        this.answerContent = answerContent;
        this.createdAt = createdAt;
    }

    public Answer(int questionId, int userId, String answerContent, String createdAt) {
        this.questionId = questionId;
        this.userId = userId;
        this.answerContent = answerContent;
        this.createdAt = createdAt;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    
}
