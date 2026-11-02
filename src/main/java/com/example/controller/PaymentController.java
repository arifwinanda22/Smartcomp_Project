package com.example.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.Services.MidtransService;
import com.example.classes.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Update status jika user kembali dari redirect Midtrans
        String orderIdParam = request.getParameter("order_id");
        String transStatusParam = request.getParameter("transaction_status");

        if (orderIdParam != null && transStatusParam != null) {
            String updateSql = "UPDATE payments SET status = ? WHERE order_id = ?";
            try (Connection conn = JDBC.getConnection();
                 PreparedStatement ps = conn.prepareStatement(updateSql)) {
                ps.setString(1, transStatusParam);
                ps.setString(2, orderIdParam);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        List<Payment> paymentList = new ArrayList<>();
        // Menggunakan payment_id sesuai nama kolom di database
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
                p.setSnapToken(rs.getString("snap_token"));
                p.setCreatedAt(rs.getTimestamp("date"));
                paymentList.add(p);
            }
        } catch (Exception e) {
            System.err.println("Gagal membaca riwayat pembayaran: " + e.getMessage());
            e.printStackTrace();
        }

        request.setAttribute("paymentList", paymentList);
        request.setAttribute("clientKey", MidtransService.CLIENT_KEY);
        request.getRequestDispatcher("/WEB-FILE/payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("checkout".equalsIgnoreCase(action) || "initPayment".equalsIgnoreCase(action)) {
            handleCheckout(request, response);
        } else if ("updateStatus".equalsIgnoreCase(action)) {
            handleStatusUpdate(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/payment");
        }
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");
        String eventIdStr = request.getParameter("eventId");
        String priceStr = request.getParameter("price");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");

        if (userName == null || userName.trim().isEmpty()) userName = "Peserta SmartComp";
        if (email == null || email.trim().isEmpty()) email = "peserta@smartcomp.id";
        if (eventName == null || eventName.trim().isEmpty()) eventName = "Workshop / Competition";

        int eventId = (eventIdStr != null && !eventIdStr.isEmpty()) ? Integer.parseInt(eventIdStr) : 1;
        double price = 0;
        try {
            if (priceStr != null && !priceStr.isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (Exception ignored) {}

        if (price <= 0) {
            price = 50000;
        }

        String prefix = "Workshop".equalsIgnoreCase(eventType) ? "SC-WS" : "SC-COMP";
        String orderId = prefix + "-" + eventId + "-" + System.currentTimeMillis();

        // 1. Minta Token dan Redirect URL dari Midtrans
        MidtransService.SnapResponse snapRes = MidtransService.createTransaction(orderId, price, eventName, userName, email);

        // 2. Simpan ke database dengan kolom yang sesuai
        String sql = "INSERT INTO payments (order_id, \"user\", user_email, event_type, event_id, event_name, amount, status, snap_token, payment_type) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, 'pending', ?, 'Midtrans Snap')";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, orderId);
            ps.setString(2, userName);
            ps.setString(3, email);
            ps.setString(4, eventType != null ? eventType : "Workshop");
            ps.setInt(5, eventId);
            ps.setString(6, eventName);
            ps.setDouble(7, price);
            ps.setString(8, snapRes != null ? snapRes.token : null);
            ps.executeUpdate();
            System.out.println(">> Berhasil menyimpan transaksi baru: " + orderId);
        } catch (Exception e) {
            System.err.println(">> GAGAL INSERT PEMBAYARAN KE DATABASE: " + e.getMessage());
            e.printStackTrace();
        }

        // 3. Arahkan ke URL Midtrans
        if (snapRes != null && snapRes.redirectUrl != null && !snapRes.redirectUrl.isEmpty()) {
            response.sendRedirect(snapRes.redirectUrl);
        } else {
            String errorMsg = (snapRes != null && snapRes.error != null) ? snapRes.error : "Gagal memanggil Midtrans";
            response.sendRedirect(request.getContextPath() + "/payment?error=" + URLEncoder.encode(errorMsg, StandardCharsets.UTF_8));
        }
    }

    private void handleStatusUpdate(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String orderId = request.getParameter("orderId");
        String newStatus = request.getParameter("status");
        String paymentType = request.getParameter("paymentType");

        String sql = "UPDATE payments SET status = ?, payment_type = COALESCE(?, payment_type) WHERE order_id = ?";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setString(2, paymentType);
            ps.setString(3, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().print("{\"success\":true}");
    }
}