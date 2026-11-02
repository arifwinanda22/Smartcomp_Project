package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.Database.JDBC;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/workshops")
public class WorkshopApiController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String category = request.getParameter("type");
        if (category == null || category.trim().isEmpty()) {
            category = "Academic";
        }

        StringBuilder json = new StringBuilder("[");
        String sql = "SELECT id, name, type, date, capacity, price, status "
                   + "FROM workshops "
                   + "WHERE LOWER(type) = LOWER(?) AND LOWER(status) = 'active' "
                   + "ORDER BY id DESC";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            boolean first = true;

            while (rs.next()) {
                if (!first) json.append(",");
                json.append("{")
                    .append("\"id\":").append(rs.getInt("id")).append(",")
                    .append("\"name\":\"").append(rs.getString("name").replace("\"", "\\\"")).append("\",")
                    .append("\"type\":\"").append(rs.getString("type")).append("\",")
                    .append("\"date\":\"").append(rs.getString("date")).append("\",")
                    .append("\"capacity\":").append(rs.getInt("capacity")).append(",")
                    .append("\"price\":").append(rs.getDouble("price")).append(",")
                    .append("\"status\":\"").append(rs.getString("status")).append("\"")
                    .append("}");
                first = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        json.append("]");

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}