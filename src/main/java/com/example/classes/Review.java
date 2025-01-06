package com.example.classes;

import java.util.Date;

public class Review {
    private int reviewId;
    private String user;
    private String eventName;
    private int rating;
    private String comment;
    private Date date;
    private String status;

    // Constructor
    public Review(int reviewId, String user, String eventName, int rating, String comment, Date date, String status) {
        this.reviewId = reviewId;
        this.user = user;
        this.eventName = eventName;
        this.rating = rating;
        this.comment = comment;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
