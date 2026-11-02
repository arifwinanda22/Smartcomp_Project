package com.example.classes;

import java.util.Locale;

public class Calendar {
    private String id;            
    private int rawId;             
    private String title;       
    private String startDate;      
    private String endDate;         
    private String backgroundColor; 
    private String borderColor;     
    private String eventType;       
    private String category;        
    private double price;         
    private String detailUrl;      

    // 1. Konstruktor Default
    public Calendar() {}

    // 2. Konstruktor Lengkap
    public Calendar(String id, int rawId, String title, String startDate, String endDate, 
                         String backgroundColor, String borderColor, String eventType, 
                         String category, double price, String detailUrl) {
        this.id = id;
        this.rawId = rawId;
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.backgroundColor = backgroundColor;
        this.borderColor = borderColor;
        this.eventType = eventType;
        this.category = category;
        this.price = price;
        this.detailUrl = detailUrl;
    }

    // Method pembantu konversi objek ke format JSON FullCalendar
    public String toJson() {
        String safeTitle = (title != null) ? title.replace("\"", "\\\"") : "";
        String safeCategory = (category != null) ? category.replace("\"", "\\\"") : "";

        return String.format(Locale.US,
            "{" +
                "\"id\":\"%s\"," +
                "\"title\":\"%s\"," +
                "\"start\":\"%s\"," +
                (endDate != null && !endDate.isEmpty() ? "\"end\":\"" + endDate + "\"," : "") +
                "\"backgroundColor\":\"%s\"," +
                "\"borderColor\":\"%s\"," +
                "\"extendedProps\":{" +
                    "\"rawId\":%d," +
                    "\"eventType\":\"%s\"," +
                    "\"category\":\"%s\"," +
                    "\"price\":%.2f," +
                    "\"detailUrl\":\"%s\"" +
                "}" +
            "}",
            id, safeTitle, startDate, backgroundColor, borderColor, rawId, eventType, safeCategory, price, detailUrl
        );
    }

    // Getter dan Setter
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public int getRawId() { return rawId; }
    public void setRawId(int rawId) { this.rawId = rawId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }

    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }

    public String getBackgroundColor() { return backgroundColor; }
    public void setBackgroundColor(String backgroundColor) { this.backgroundColor = backgroundColor; }

    public String getBorderColor() { return borderColor; }
    public void setBorderColor(String borderColor) { this.borderColor = borderColor; }

    public String getEventType() { return eventType; }
    public void setEventType(String eventType) { this.eventType = eventType; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDetailUrl() { return detailUrl; }
    public void setDetailUrl(String detailUrl) { this.detailUrl = detailUrl; }
}