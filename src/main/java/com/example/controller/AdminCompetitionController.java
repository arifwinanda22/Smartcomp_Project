package com.example.controller;

import com.example.Services.CompetitionService;
import com.example.classes.Competition;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/adminCompetition")
public class AdminCompetitionController extends HttpServlet {
    private CompetitionService competitionService;

    public void init() {
        competitionService = new CompetitionService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addCompetition(request, response);
                    break;
                case "update":
                    updateCompetition(request, response);
                    break;
                case "delete":
                    deleteCompetition(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/adminCompetition");
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
        }
    }

    private void addCompetition(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Debug logging
        System.out.println("\n=== Debug Add Competition ===");
        System.out.println("name: " + request.getParameter("name"));
        System.out.println("type: " + request.getParameter("type"));
        System.out.println("start_date: " + request.getParameter("start_date"));
        System.out.println("end_date: " + request.getParameter("end_date"));
        System.out.println("entry_fee: " + request.getParameter("entry_fee"));
        System.out.println("status: " + request.getParameter("status"));
        System.out.println("=============================\n");

        try {
            // Get and validate parameters
            String name = validateParameter(request, "name", "Competition name");
            String type = validateParameter(request, "type", "Competition type");
            String startDateStr = validateParameter(request, "start_date", "Start date");
            String endDateStr = validateParameter(request, "end_date", "End date");
            String entryFeeStr = validateParameter(request, "entry_fee", "Entry fee");
            String status = validateParameter(request, "status", "Status");

            // Parse dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);

            Date start_date;
            Date end_date;
            try {
                start_date = dateFormat.parse(startDateStr);
                end_date = dateFormat.parse(endDateStr);
            } catch (ParseException e) {
                throw new ServletException("Invalid date format. Please use YYYY-MM-DD format");
            }

            // Validate dates
            if (end_date.before(start_date)) {
                throw new ServletException("End date must be after start date");
            }

            // Parse entry fee
            double entry_fee;
            try {
                entry_fee = Double.parseDouble(entryFeeStr);
                if (entry_fee < 0) {
                    throw new ServletException("Entry fee cannot be negative");
                }
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid entry fee format");
            }

            Competition competition = new Competition(
                    name,
                    type,
                    start_date,
                    end_date,
                    entry_fee,
                    status
            );

            competitionService.addCompetition(competition);
            request.setAttribute("successMessage", "Competition added successfully!");
            response.sendRedirect(request.getContextPath() + "/adminCompetition?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = "Error adding competition: " + e.getMessage();
            if (e instanceof ParseException) {
                errorMsg = "Invalid date format. Please use YYYY-MM-DD format";
            } else if (e instanceof NumberFormatException) {
                errorMsg = "Invalid number format for entry fee";
            }

            request.setAttribute("errorMessage", errorMsg);
            request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
        }
    }

    private void updateCompetition(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Debug logging
            System.out.println("\n=== Debug Update Competition ===");
            System.out.println("id: " + request.getParameter("id"));
            System.out.println("name: " + request.getParameter("name"));
            System.out.println("type: " + request.getParameter("type"));
            System.out.println("start_date: " + request.getParameter("start_date"));
            System.out.println("end_date: " + request.getParameter("end_date"));
            System.out.println("entry_fee: " + request.getParameter("entry_fee"));
            System.out.println("status: " + request.getParameter("status"));
            System.out.println("=============================\n");

            // Get and validate parameters
            int id = Integer.parseInt(validateParameter(request, "id", "Competition ID"));
            String name = validateParameter(request, "name", "Competition name");
            String type = validateParameter(request, "type", "Competition type");
            String startDateStr = validateParameter(request, "start_date", "Start date");
            String endDateStr = validateParameter(request, "end_date", "End date");
            String entryFeeStr = validateParameter(request, "entry_fee", "Entry fee");
            String status = validateParameter(request, "status", "Status");

            // Parse dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);

            Date start_date = dateFormat.parse(startDateStr);
            Date end_date = dateFormat.parse(endDateStr);

            // Validate dates
            if (end_date.before(start_date)) {
                throw new ServletException("End date must be after start date");
            }

            // Parse entry fee
            double entry_fee = Double.parseDouble(entryFeeStr);
            if (entry_fee < 0) {
                throw new ServletException("Entry fee cannot be negative");
            }

            Competition competition = new Competition(
                    id,
                    name,
                    type,
                    start_date,
                    end_date,
                    entry_fee,
                    status
            );

            competitionService.updateCompetition(competition);
            request.setAttribute("successMessage", "Competition updated successfully!");
            response.sendRedirect(request.getContextPath() + "/adminCompetition?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = "Error updating competition: " + e.getMessage();
            if (e instanceof ParseException) {
                errorMsg = "Invalid date format. Please use YYYY-MM-DD format";
            } else if (e instanceof NumberFormatException) {
                errorMsg = "Invalid number format for entry fee";
            }

            request.setAttribute("errorMessage", errorMsg);
            request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
        }
    }

    private void deleteCompetition(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            competitionService.deleteCompetition(id);
            request.setAttribute("successMessage", "Competition deleted successfully!");
            response.sendRedirect(request.getContextPath() + "/adminCompetition?action=list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting competition: " + e.getMessage());
            request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "list":
                    listCompetitions(request, response);
                    break;
                case "edit":
                    getCompetitionJson(request, response);
                    break;
                default:
                    listCompetitions(request, response);
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
        }
    }

    private void listCompetitions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("competitions", competitionService.getAllCompetitions());
        request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
    }

    private void getCompetitionJson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Competition competition = competitionService.getCompetitionById(id);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String json = String.format(
                    "{\"id\":%d,\"name\":\"%s\",\"type\":\"%s\",\"start_date\":\"%s\",\"end_date\":\"%s\",\"entry_fee\":%.2f,\"status\":\"%s\"}",
                    competition.getId(),
                    competition.getName(),
                    competition.getType(),
                    dateFormat.format(competition.getStartDate()),
                    dateFormat.format(competition.getEndDate()),
                    competition.getEntryFee(),
                    competition.getStatus()
            );

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    // Helper method to validate parameters
    private String validateParameter(HttpServletRequest request, String paramName, String fieldName)
            throws ServletException {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            throw new ServletException(fieldName + " is required");
        }
        return value.trim();
    }
}