/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class LessonQuestion {

    private int lessonId;
    int slot;
    String lessonContent;
    private int questionId;
    private String name;
    private String content;
    private String status;
    String start;
    String end;

    public LessonQuestion() {
    }

    @Override
    public String toString() {
        return "LessonQuestion{" + "questionId=" + questionId + ", name=" + name + ", content=" + content + ", status=" + status + ", start=" + start + ", end=" + end + '}';
    }

    

    public LessonQuestion(int lessonId, int questionId, String name, String content, String status, String start, String end) {
        this.lessonId = lessonId;
        this.questionId = questionId;
        this.name = name;
        this.content = content;
        this.status = status;
        this.start = start;
        this.end = end;
    }

    public LessonQuestion(String name, String content, String status, String start, String end) {
        this.name = name;
        this.content = content;
        this.status = status;
        this.start = start;
        this.end = end;
    }

    public LessonQuestion(int questionId, String name, String content, String status, String start, String end) {
        this.questionId = questionId;
        this.name = name;
        this.content = content;
        this.status = status;
        this.start = start;
        this.end = end;
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

    public LessonQuestion(int lessonId, int slot, String lessonContent, int questionId, String name, String content, String status) {
        this.lessonId = lessonId;
        this.slot = slot;
        this.lessonContent = lessonContent;
        this.questionId = questionId;
        this.name = name;
        this.content = content;
        this.status = status;
    }

    public LessonQuestion(int lessonId, int slot, String lessonContent, int questionId, String name, String status) {
        this.lessonId = lessonId;
        this.slot = slot;
        this.lessonContent = lessonContent;
        this.questionId = questionId;
        this.name = name;
        this.status = status;
    }

    public LessonQuestion(int lessonId, int questionId, String name, String content, String status) {
        this.lessonId = lessonId;
        this.questionId = questionId;
        this.name = name;
        this.content = content;
        this.status = status;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getLessonContent() {
        return lessonContent;
    }

    public void setLessonContent(String lessonContent) {
        this.lessonContent = lessonContent;
    }

    public LessonQuestion(int lessionId, String name, String content, String status) {
        this.lessonId = lessionId;
        this.name = name;
        this.content = content;
        this.status = status;
    }

    public int getLessionId() {
        return lessonId;
    }

    public void setLessionId(int lessionId) {
        this.lessonId = lessionId;
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

}
