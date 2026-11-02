package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.Database.JDBC;
import com.example.classes.Workshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/workshopDetail")
public class WorkshopDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/WEB-FILE/WorkshopAcademic.jsp");
            return;
        }

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM workshops WHERE id = ?")) {
            
            ps.setInt(1, Integer.parseInt(idParam));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
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

                request.setAttribute("workshop", w);
                request.getRequestDispatcher("/WEB-FILE/WorkshopDetail.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/WEB-FILE/WorkshopAcademic.jsp");
    }
}