package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.example.classes.Workshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/workshop")
public class WorkshopController extends HttpServlet {
    private List<Workshop> workshops = new ArrayList<>();

    // Handle navigasi jika route /workshop diakses via browser
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Arahkan ke halaman katalog workshop user
        response.sendRedirect(request.getContextPath() + "/WEB-FILE/WorkshopAcademic.jsp");
    }

    // Add a new workshop
    public void addWorkshop(Workshop workshop) {
        workshops.add(workshop);
    }

    // Get all workshops
    public List<Workshop> getAllWorkshops() {
        return workshops;
    }

    // Update a workshop
    public void updateWorkshop(int id, String name, Date date, double price, int capacity, String status) {
        for (Workshop workshop : workshops) {
            if (workshop.getId() == id) {
                workshop.setName(name);
                // Konversi java.util.Date ke java.sql.Date secara aman
                workshop.setDate(date != null ? new java.sql.Date(date.getTime()) : null);
                workshop.setPrice(price);
                workshop.setCapacity(capacity);
                workshop.setStatus(status);
            }
        }
    }

    // Delete a workshop
    public void deleteWorkshop(int id) {
        workshops.removeIf(workshop -> workshop.getId() == id);
    }
}