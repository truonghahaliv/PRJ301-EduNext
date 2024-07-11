/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class LessonQuestion2 {
    private int questionId;
    private String name;
    private String content;
    private String status;
    String start;
    String end;

    public LessonQuestion2() {
    }

    public LessonQuestion2(int questionId, String name, String content, String status, String start, String end) {
        this.questionId = questionId;
        this.name = name;
        this.content = content;
        this.status = status;
        this.start = start;
        this.end = end;
    }

    @Override
    public String toString() {
        return "LessonQuestion2{" + "questionId=" + questionId + ", name=" + name + ", content=" + content + ", status=" + status + ", start=" + start + ", end=" + end + '}';
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
    
}
