package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.classes.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminPayment")
public class AdminPaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Payment> allPayments = new ArrayList<>();
        String sql = "SELECT * FROM payments ORDER BY payment_id DESC";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Payment p = new Payment();
                p.setId(rs.getInt("payment_id"));
                p.setOrderId(rs.getString("order_id"));
                p.setUserName(rs.getString("user"));
                p.setUserEmail(rs.getString("user_email"));
                p.setEventType(rs.getString("event_type"));
                p.setEventId(rs.getInt("event_id"));
                p.setEventName(rs.getString("event_name"));
                p.setGrossAmount(rs.getDouble("amount"));
                p.setPaymentType(rs.getString("payment_type"));
                p.setTransactionStatus(rs.getString("status"));
                p.setCreatedAt(rs.getTimestamp("date"));
                allPayments.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("paymentList", allPayments);
        request.setAttribute("activeTab", "payment");
        request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("manualVerify".equalsIgnoreCase(action)) {
            String orderId = request.getParameter("orderId");
            try (Connection conn = JDBC.getConnection();
                 PreparedStatement ps = conn.prepareStatement("UPDATE payments SET status = 'settlement' WHERE order_id = ?")) {
                ps.setString(1, orderId);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/adminPayment");
    }
}