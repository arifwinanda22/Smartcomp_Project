package com.example.classes;

import java.sql.Timestamp;
import java.util.Date;

public class Payment {
    private int id;
    private String orderId;
    private String userName;
    private String userEmail;
    private String eventType;
    private int eventId;
    private String eventName;
    private double grossAmount;
    private String paymentType;
    private String transactionStatus;
    private String snapToken;
    private Timestamp createdAt;

    // 1. Konstruktor Default
    public Payment() {}

    // 2. Konstruktor Kompatibilitas (Dibutuhkan oleh UserService.java)
    public Payment(int id, String userName, String eventName, String eventType, double amount, Date date, String status) {
        this.id = id;
        this.userName = userName;
        this.eventName = eventName;
        this.eventType = eventType;
        this.grossAmount = amount;
        if (date != null) {
            this.createdAt = new Timestamp(date.getTime());
        }
        this.transactionStatus = status;
    }

    // ================= Getter & Setter Utama =================
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getEventType() { return eventType; }
    public void setEventType(String eventType) { this.eventType = eventType; }

    public int getEventId() { return eventId; }
    public void setEventId(int eventId) { this.eventId = eventId; }

    public String getEventName() { return eventName; }
    public void setEventName(String eventName) { this.eventName = eventName; }

    public double getGrossAmount() { return grossAmount; }
    public void setGrossAmount(double grossAmount) { this.grossAmount = grossAmount; }

    public String getPaymentType() { return paymentType; }
    public void setPaymentType(String paymentType) { this.paymentType = paymentType; }

    public String getTransactionStatus() { return transactionStatus; }
    public void setTransactionStatus(String transactionStatus) { this.transactionStatus = transactionStatus; }

    public String getSnapToken() { return snapToken; }
    public void setSnapToken(String snapToken) { this.snapToken = snapToken; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    // ================= Method Kompatibilitas Lama (Untuk UserService.java) =================
    public String getUser() { return userName; }
    public void setUser(String user) { this.userName = user; }

    public double getAmount() { return grossAmount; }
    public void setAmount(double amount) { this.grossAmount = amount; }

    public Date getDate() { 
        return createdAt != null ? new Date(createdAt.getTime()) : null; 
    }
    public void setDate(Date date) { 
        this.createdAt = date != null ? new Timestamp(date.getTime()) : null; 
    }

    public String getStatus() { return transactionStatus; }
    public void setStatus(String status) { this.transactionStatus = status; }
}