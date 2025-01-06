package com.example.classes;

import java.util.Date;

public class Discussion {
    private int topicId;
    private String title;
    private String createdBy;
    private Date date;
    private int replies;
    private String status; // Open, Closed

    // Constructor
    public Discussion(int topicId, String title, String createdBy, Date date, int replies, String status) {
        this.topicId = topicId;
        this.title = title;
        this.createdBy = createdBy;
        this.date = date;
        this.replies = replies;
        this.status = status;
    }

    // Getters and Setters
    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getReplies() {
        return replies;
    }

    public void setReplies(int replies) {
        this.replies = replies;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
