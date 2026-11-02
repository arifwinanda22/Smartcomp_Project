package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.classes.Calendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/calendar-events")
public class CalendarApiController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        List<Calendar> eventList = new ArrayList<>();

        String sqlWorkshop = "SELECT id, name, type, date, price FROM workshops WHERE status = 'Active' AND date IS NOT NULL";
        String sqlCompetition = "SELECT id, name, type, end_date, entry_fee FROM competitions WHERE status = 'Active' AND end_date IS NOT NULL";

        try (Connection conn = JDBC.getConnection()) {
            
            // 1. Ambil data Workshop -> Map ke CalendarEvent
            try (PreparedStatement psWs = conn.prepareStatement(sqlWorkshop);
                 ResultSet rsWs = psWs.executeQuery()) {
                while (rsWs.next()) {
                    int id = rsWs.getInt("id");
                    Calendar event = new Calendar(
                        "ws-" + id,
                        id,
                        "[Workshop] " + rsWs.getString("name"),
                        rsWs.getString("date"),
                        null,
                        "#7059e2",
                        "#5b45cb",
                        "Workshop",
                        rsWs.getString("type"),
                        rsWs.getDouble("price"),
                        "/workshopDetail?id=" + id
                    );
                    eventList.add(event);
                }
            }

            // 2. Ambil data Competition -> Map ke CalendarEvent
            try (PreparedStatement psComp = conn.prepareStatement(sqlCompetition);
                 ResultSet rsComp = psComp.executeQuery()) {
                while (rsComp.next()) {
                    int id = rsComp.getInt("id");
                    Calendar event = new Calendar(
                        "comp-" + id,
                        id,
                        "[Deadline] " + rsComp.getString("name"),
                        rsComp.getString("end_date"),
                        null,
                        "#e37400",
                        "#b85d00",
                        "Competition Deadline",
                        rsComp.getString("type"),
                        rsComp.getDouble("entry_fee"),
                        "/competitionDetail?id=" + id
                    );
                    eventList.add(event);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 3. Serialize daftar objek CalendarEvent ke format JSON Array
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < eventList.size(); i++) {
            json.append(eventList.get(i).toJson());
            if (i < eventList.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        out.print(json.toString());
    }
}