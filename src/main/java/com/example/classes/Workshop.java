package com.example.classes;

import java.sql.Date;

public class Workshop {
    private int id;
    private String name;
    private String type;
    private Date date;
    private int capacity;
    private double price;
    private String status;
    private String description;
    private String criteria;

    // 1. Konstruktor Kosong (Default)
    public Workshop() {}

    // 2. Konstruktor 7 Parameter (Dibutuhkan oleh UserService.java)
    public Workshop(int id, String name, Date date, double price, int capacity, String status, String type) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.price = price;
        this.capacity = capacity;
        this.status = status;
        this.type = type;
    }

    // 3. Konstruktor Lengkap 9 Parameter
    public Workshop(int id, String name, String type, Date date, int capacity, double price, String status, String description, String criteria) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.date = date;
        this.capacity = capacity;
        this.price = price;
        this.status = status;
        this.description = description;
        this.criteria = criteria;
    }

    // Getter dan Setter tetap sama...
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCriteria() { return criteria; }
    public void setCriteria(String criteria) { this.criteria = criteria; }
}