package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.Database.JDBC;
import com.example.classes.Competition;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/competitionDetail")
public class CompetitionDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/WEB-FILE/CompetitionAcademic.jsp");
            return;
        }

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM competitions WHERE id = ?")) {

            ps.setInt(1, Integer.parseInt(idParam));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
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

                request.setAttribute("competition", c);
                request.getRequestDispatcher("/WEB-FILE/competitionDetail.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/WEB-FILE/CompetitionAcademic.jsp");
    }
}