package com.example.controller;

import com.example.Services.CompetitionService;
import com.example.classes.Competition;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@WebServlet("/competition")
public class CompetitionController extends HttpServlet {
    private final CompetitionService competitionService = new CompetitionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Competition> allCompetitions = competitionService.getAllCompetitions();
            System.out.println("Total competitions fetched: " + allCompetitions.size());

            // Print semua kompetisi yang diambil
            for (Competition comp : allCompetitions) {
                System.out.println(String.format(
                        "Competition[id=%d, name=%s, type=%s, status=%s]",
                        comp.getId(), comp.getName(), comp.getType(), comp.getStatus()
                ));
            }

            // Modifikasi filter
            List<Competition> academicCompetitions = new ArrayList<>();
            List<Competition> nonAcademicCompetitions = new ArrayList<>();

            for (Competition comp : allCompetitions) {
                String type = comp.getType().toLowerCase().trim();
                System.out.println("Processing competition: " + comp.getName() + " with type: " + type);

                if (type.equals("academic")) {
                    academicCompetitions.add(comp);
                    System.out.println("Added to academic: " + comp.getName());
                } else if (type.equals("non-academic")) {
                    nonAcademicCompetitions.add(comp);
                    System.out.println("Added to non-academic: " + comp.getName());
                } else {
                    System.out.println("WARNING: Unknown type for " + comp.getName() + ": " + type);
                }
            }

            System.out.println("Academic competitions: " + academicCompetitions.size());
            System.out.println("Non-academic competitions: " + nonAcademicCompetitions.size());

            request.setAttribute("competitionAcademic", academicCompetitions);
            request.setAttribute("competitionNonAcademic", nonAcademicCompetitions);

            // Forward ke JSP dengan try-catch tambahan
            try {
                request.getRequestDispatcher("/WEB-FILE/competition.jsp").forward(request, response);
            } catch (Exception e) {
                System.err.println("Error forwarding to JSP:");
                e.printStackTrace();
                response.sendError(500, "Error forwarding to JSP: " + e.getMessage());
            }

        } catch (Exception e) {
            System.err.println("Error in doGet:");
            e.printStackTrace();
            response.sendError(500, "Server error: " + e.getMessage());
        }
    }
}