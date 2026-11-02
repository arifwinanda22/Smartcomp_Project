package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.classes.Competition;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminCompetition")
public class AdminCompetitionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Competition> competitions = getAllCompetitions();

        int totalComp = competitions.size();
        int activeComp = 0;
        for (Competition c : competitions) {
            if ("active".equalsIgnoreCase(c.getStatus())) activeComp++;
        }

        request.setAttribute("competitions", competitions);
        request.setAttribute("totalComp", totalComp);
        request.setAttribute("activeComp", activeComp);
        request.setAttribute("activeTab", "competition");

        request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equalsIgnoreCase(action)) {
                addCompetition(request);
            } else if ("update".equalsIgnoreCase(action)) {
                updateCompetition(request);
            } else if ("delete".equalsIgnoreCase(action)) {
                deleteCompetition(request);
            }
            response.sendRedirect(request.getContextPath() + "/adminCompetition");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/adminCompetition?error=true");
        }
    }

    private List<Competition> getAllCompetitions() {
        List<Competition> list = new ArrayList<>();
        String sql = "SELECT * FROM competitions ORDER BY id ASC";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Competition c = new Competition();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setType(rs.getString("type"));
                c.setStartDate(rs.getDate("start_date"));
                c.setEndDate(rs.getDate("end_date"));
                c.setEntryFee(rs.getDouble("entry_fee"));
                c.setStatus(rs.getString("status"));

                try { c.setDescription(rs.getString("description")); } catch (Exception ignored) {}
                try { c.setCriteria(rs.getString("criteria")); } catch (Exception ignored) {}

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private void addCompetition(HttpServletRequest request) throws Exception {
        String sql = "INSERT INTO competitions (name, type, start_date, end_date, entry_fee, status, description, criteria) VALUES (?, ?, ?::date, ?::date, ?, ?, ?, ?)";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("type"));
            ps.setString(3, request.getParameter("startDate"));
            ps.setString(4, request.getParameter("endDate"));
            ps.setDouble(5, Double.parseDouble(request.getParameter("entryFee")));
            ps.setString(6, request.getParameter("status"));
            ps.setString(7, request.getParameter("description"));
            ps.setString(8, request.getParameter("criteria"));
            ps.executeUpdate();
        }
    }

    private void updateCompetition(HttpServletRequest request) throws Exception {
        String sql = "UPDATE competitions SET name = ?, type = ?, start_date = ?::date, end_date = ?::date, entry_fee = ?, status = ?, description = ?, criteria = ? WHERE id = ?";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("type"));
            ps.setString(3, request.getParameter("startDate"));
            ps.setString(4, request.getParameter("endDate"));
            ps.setDouble(5, Double.parseDouble(request.getParameter("entryFee")));
            ps.setString(6, request.getParameter("status"));
            ps.setString(7, request.getParameter("description"));
            ps.setString(8, request.getParameter("criteria"));
            ps.setInt(9, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
    }

    private void deleteCompetition(HttpServletRequest request) throws Exception {
        String sql = "DELETE FROM competitions WHERE id = ?";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
        }
    }
}