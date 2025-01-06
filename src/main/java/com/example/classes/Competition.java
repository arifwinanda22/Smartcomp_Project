package com.example.classes;

import java.util.Date;

public class Competition {
    private int id;
    private String name;
    private String type;
    private Date startDate;
    private Date endDate;
    private double entryFee;
    private String status;

    // Constructor with id (for existing competitions)
    public Competition(int id, String name, String type, Date startDate, Date endDate, double entryFee, String status) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.startDate = startDate;
        this.endDate = endDate;
        this.entryFee = entryFee;
        this.status = status;
    }

    // Constructor without id (for new competitions)
    public Competition(String name, String type, Date startDate, Date endDate, double entryFee, String status) {
        this.name = name;
        this.type = type;
        this.startDate = startDate;
        this.endDate = endDate;
        this.entryFee = entryFee;
        this.status = status;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public double getEntryFee() { return entryFee; }
    public void setEntryFee(double entryFee) { this.entryFee = entryFee; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}