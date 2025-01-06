package com.example.classes;

import java.util.Date;

public class Workshop {
    private int id;
    private String name;
    private Date date;
    private double price;
    private int capacity;
    private String status;
    private String type;  // Atribut baru untuk menentukan jenis workshop

    // Constructor
    public Workshop(int id, String name, Date date, double price, int capacity, String status, String type) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.price = price;
        this.capacity = capacity;
        this.status = status;
        this.type = type;  // Menginisialisasi atribut baru
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
