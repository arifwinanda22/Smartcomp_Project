package com.example.controller;

import com.example.Services.UserService;
import com.example.classes.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addPayment".equals(action)) {
            addPayment(request, response);
        }
    }

    private void addPayment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String user = request.getParameter("user");
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");

        // Check for null and empty before parsing the amount
        String amountStr = request.getParameter("amount");
        double amount = 0;
        if (amountStr != null && !amountStr.trim().isEmpty()) {
            try {
                amount = Double.parseDouble(amountStr.trim());
            } catch (NumberFormatException e) {
                // Handle the exception if the amount is not a valid number
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format");
                return;
            }
        } else {
            // Handle the case when amount is missing or invalid
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Amount is required");
            return;
        }

        Date date = new Date(); // Current date
        String status = request.getParameter("status");

        // Validate other parameters like user, eventType, eventName, and status
        if (user == null || user.trim().isEmpty() || eventType == null || eventType.trim().isEmpty() ||
                eventName == null || eventName.trim().isEmpty() || status == null || status.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required");
            return;
        }

        // Create the Payment object and save it
        Payment payment = new Payment(0, user, eventType, eventName, amount, date, status);
        userService.addPayment(payment); // Save the payment to database

        response.sendRedirect("/WEB-FILE/dashboardAdmin.jsp"); // Redirect to the admin dashboard after saving
    }
}
