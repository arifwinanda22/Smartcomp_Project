package com.example.classes;

import java.util.Date;

public class Payment {
    private int paymentId;
    private String user;
    private String eventType; // Workshop, Competition, etc.
    private String eventName;
    private double amount;
    private Date date;
    private String status; // Pending, Completed, Failed

    // Constructor
    public Payment(int paymentId, String user, String eventType, String eventName, double amount, Date date, String status) {
        this.paymentId = paymentId;
        this.user = user;
        this.eventType = eventType;
        this.eventName = eventName;
        this.amount = amount;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
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