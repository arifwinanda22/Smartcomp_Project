package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.example.Database.JDBC;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/competitions")
public class CompetitionApiController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String categoryType = request.getParameter("type");
        PrintWriter out = response.getWriter();

        String sql = "SELECT * FROM competitions WHERE status = 'Active'";
        if (categoryType != null && !categoryType.trim().isEmpty()) {
            sql += " AND LOWER(type) = LOWER(?)";
        }
        sql += " ORDER BY id ASC";

        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
        StringBuilder json = new StringBuilder("[");

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (categoryType != null && !categoryType.trim().isEmpty()) {
                ps.setString(1, categoryType);
            }

            try (ResultSet rs = ps.executeQuery()) {
                boolean first = true;
                while (rs.next()) {
                    if (!first) json.append(",");
                    
                    int id = rs.getInt("id");
                    String name = rs.getString("name") != null ? rs.getString("name").replace("\"", "\\\"") : "";
                    String type = rs.getString("type") != null ? rs.getString("type") : "";
                    java.sql.Date start = rs.getDate("start_date");
                    java.sql.Date end = rs.getDate("end_date");
                    double fee = rs.getDouble("entry_fee");

                    String startDateStr = start != null ? sdf.format(start) : "-";
                    String endDateStr = end != null ? sdf.format(end) : "-";

                    json.append(String.format(Locale.US,
                        "{\"id\":%d,\"name\":\"%s\",\"type\":\"%s\",\"startDate\":\"%s\",\"endDate\":\"%s\",\"entryFee\":%.2f}",
                        id, name, type, startDateStr, endDateStr, fee
                    ));
                    first = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        json.append("]");
        out.print(json.toString());
    }
}