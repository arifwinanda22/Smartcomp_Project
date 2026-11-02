package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.classes.Workshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminWorkshop")
public class AdminWorkshopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equalsIgnoreCase(action)) {
            handleGetSingleWorkshop(request, response);
            return;
        }

        List<Workshop> workshops = getAllWorkshops();
        int totalWs = workshops.size();
        int activeWs = 0;
        for (Workshop w : workshops) {
            if ("active".equalsIgnoreCase(w.getStatus())) activeWs++;
        }

        request.setAttribute("workshops", workshops);
        request.setAttribute("totalWs", totalWs);
        request.setAttribute("activeWs", activeWs);
        request.setAttribute("activeTab", "workshop");

        request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equalsIgnoreCase(action)) {
                addWorkshop(request);
            } else if ("update".equalsIgnoreCase(action)) {
                updateWorkshop(request);
            } else if ("delete".equalsIgnoreCase(action)) {
                deleteWorkshop(request);
            }
            response.sendRedirect(request.getContextPath() + "/adminWorkshop");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/adminWorkshop?error=true");
        }
    }

    private List<Workshop> getAllWorkshops() {
        List<Workshop> list = new ArrayList<>();
        String sql = "SELECT * FROM workshops ORDER BY id ASC";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Workshop w = new Workshop();
                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setType(rs.getString("type"));
                w.setDate(rs.getDate("date"));
                w.setCapacity(rs.getInt("capacity"));
                w.setPrice(rs.getDouble("price"));
                w.setStatus(rs.getString("status"));
                w.setDescription(rs.getString("description"));
                w.setCriteria(rs.getString("criteria"));
                list.add(w);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private void addWorkshop(HttpServletRequest request) throws Exception {
        String sql = "INSERT INTO workshops (name, type, date, capacity, price, status, description, criteria) VALUES (?, ?, ?::date, ?, ?, ?, ?, ?)";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("type"));
            ps.setString(3, request.getParameter("date"));
            ps.setInt(4, Integer.parseInt(request.getParameter("capacity")));
            ps.setDouble(5, Double.parseDouble(request.getParameter("price")));
            ps.setString(6, request.getParameter("status"));
            ps.setString(7, request.getParameter("description"));
            ps.setString(8, request.getParameter("criteria"));
            ps.executeUpdate();
        }
    }

    private void updateWorkshop(HttpServletRequest request) throws Exception {
        String sql = "UPDATE workshops SET name = ?, type = ?, date = ?::date, capacity = ?, price = ?, status = ?, description = ?, criteria = ? WHERE id = ?";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("type"));
            ps.setString(3, request.getParameter("date"));
            ps.setInt(4, Integer.parseInt(request.getParameter("capacity")));
            ps.setDouble(5, Double.parseDouble(request.getParameter("price")));
            ps.setString(6, request.getParameter("status"));
            ps.setString(7, request.getParameter("description"));
            ps.setString(8, request.getParameter("criteria"));
            ps.setInt(9, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
    }

    private void deleteWorkshop(HttpServletRequest request) throws Exception {
        String sql = "DELETE FROM workshops WHERE id = ?";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
    }

    private void handleGetSingleWorkshop(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out = response.getWriter();

    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM workshops WHERE id = ?";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name") != null ? rs.getString("name").replace("\"", "\\\"") : "";
                    String type = rs.getString("type") != null ? rs.getString("type") : "";
                    String date = rs.getString("date") != null ? rs.getString("date") : "";
                    int capacity = rs.getInt("capacity");
                    double price = rs.getDouble("price");
                    String status = rs.getString("status") != null ? rs.getString("status") : "";

                    String desc = "";
                    try {
                        desc = rs.getString("description");
                        if (desc == null) desc = "";
                    } catch (Exception ignored) {}

                    String crit = "";
                    try {
                        crit = rs.getString("criteria");
                        if (crit == null) crit = "";
                    } catch (Exception ignored) {}

                    desc = desc.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
                    crit = crit.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");

                    // Gunakan Locale.US agar nilai harga tetap menggunakan titik (bukan koma)
                    String json = String.format(java.util.Locale.US,
                        "{\"id\":%d,\"name\":\"%s\",\"type\":\"%s\",\"date\":\"%s\",\"capacity\":%d,\"price\":%.2f,\"status\":\"%s\",\"description\":\"%s\",\"criteria\":\"%s\"}",
                        id, name, type, date, capacity, price, status, desc, crit
                    );
                    out.print(json);
                    return;
                }
            }
        }
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        out.print("{\"error\":\"Workshop not found\"}");
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\":\"" + e.getMessage() + "\"}");
    }
}
}