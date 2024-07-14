/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class Lesson {
    private int lessonId;
    private int classId;
    private int slot;
    private String lessonContent;

    // Constructors
    public Lesson() {
    }

    public Lesson(int lessonId, int classId, int slot, String lessonContent) {
        this.lessonId = lessonId;
        this.classId = classId;
        this.slot = slot;
        this.lessonContent = lessonContent;
    }

    public Lesson(int classId, int slot, String lessonContent) {
        this.classId = classId;
        this.slot = slot;
        this.lessonContent = lessonContent;
    }
    

    // Getters and Setters
    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
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

    @Override
    public String toString() {
        return "Lesson{" + "lessonId=" + lessonId + ", classId=" + classId + ", slot=" + slot + ", lessonContent=" + lessonContent + '}';
    }
    
}
