/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dan
 */
public class AnswerUser {
    String username;
    int aid;
    int qid;
    int uid;
    String content;

    @Override
    public String toString() {
        return "AnswerUser{" + "username=" + username + ", aid=" + aid + ", qid=" + qid + ", uid=" + uid + ", content=" + content + '}';
    }

    public AnswerUser(int aid, int qid, int uid, String content) {
        this.aid = aid;
        this.qid = qid;
        this.uid = uid;
        this.content = content;
    }

    public AnswerUser(int qid, int uid, String content) {
        this.qid = qid;
        this.uid = uid;
        this.content = content;
    }

    public AnswerUser(String username, int aid, int qid, int uid, String content) {
        this.username = username;
        this.aid = aid;
        this.qid = qid;
        this.uid = uid;
        this.content = content;
    }

    public AnswerUser() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
