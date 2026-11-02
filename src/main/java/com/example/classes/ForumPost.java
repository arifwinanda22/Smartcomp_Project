package com.example.classes;

import java.sql.Timestamp;

public class ForumPost {
    private int id;
    private String userName;
    private String title;
    private String content;
    private String category;
    private String learningSubject;
    private int achievementScore;
    private String recommendedCompName;
    private Timestamp createdAt;
    private String status;

    public ForumPost() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getLearningSubject() { return learningSubject; }
    public void setLearningSubject(String learningSubject) { this.learningSubject = learningSubject; }

    public int getAchievementScore() { return achievementScore; }
    public void setAchievementScore(int achievementScore) { this.achievementScore = achievementScore; }

    public String getRecommendedCompName() { return recommendedCompName; }
    public void setRecommendedCompName(String recommendedCompName) { this.recommendedCompName = recommendedCompName; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}