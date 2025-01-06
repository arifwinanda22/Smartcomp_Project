package com.example.controller;

import com.example.classes.Workshop;
import com.example.Services.UserService;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/workshop")
public class WorkshopController {
    private List<Workshop> workshops = new ArrayList<>();

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
                workshop.setDate(date);
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