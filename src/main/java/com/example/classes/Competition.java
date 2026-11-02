package com.example.classes;

import java.sql.Date;

public class Competition {
    private int id;
    private String name;
    private String type;
    private Date startDate;
    private Date endDate;
    private double entryFee;
    private String status;
    private String description;
    private String criteria;

    public Competition() {}

    // Konstruktor kompatibilitas lama
    public Competition(int id, String name, String type, Date startDate, Date endDate, double entryFee, String status) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.startDate = startDate;
        this.endDate = endDate;
        this.entryFee = entryFee;
        this.status = status;
    }

    // Konstruktor lengkap
    public Competition(int id, String name, String type, Date startDate, Date endDate, double entryFee, String status, String description, String criteria) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.startDate = startDate;
        this.endDate = endDate;
        this.entryFee = entryFee;
        this.status = status;
        this.description = description;
        this.criteria = criteria;
    }

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

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCriteria() { return criteria; }
    public void setCriteria(String criteria) { this.criteria = criteria; }
}