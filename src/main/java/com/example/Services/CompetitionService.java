package com.example.Services;

import com.example.classes.Competition;
import com.example.Database.JDBC;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompetitionService {

    public List<Competition> getAllCompetitions() {
        List<Competition> competitions = new ArrayList<>();
        String query = "SELECT * FROM competitions ORDER BY start_date DESC";

        try (Connection connection = JDBC.getConnection()) {
            System.out.println("Database connected");

            try (PreparedStatement stmt = connection.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    String rawType = rs.getString("type");
                    System.out.println("Raw type from DB: " + rawType);

                    String formattedType = formatTypeForDisplay(rawType);
                    System.out.println("Formatted type: " + formattedType);

                    Competition competition = new Competition(
                            rs.getInt("id"),
                            rs.getString("name"),
                            formattedType,
                            rs.getDate("start_date"),
                            rs.getDate("end_date"),
                            rs.getDouble("entry_fee"),
                            rs.getString("status")
                    );
                    competitions.add(competition);

                    System.out.println("Added competition: " + competition.getName() +
                            " (Type: " + competition.getType() + ")");
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error:");
            e.printStackTrace();
        }
        return competitions;
    }


    public Competition getCompetitionById(int id) {
        Competition competition = null;
        String query = "SELECT * FROM competitions WHERE id = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            System.out.println("Executing query for ID: " + id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    competition = new Competition(
                            rs.getInt("id"),
                            rs.getString("name"),
                            formatTypeForDisplay(rs.getString("type")),
                            rs.getDate("start_date"),
                            rs.getDate("end_date"),
                            rs.getDouble("entry_fee"),
                            rs.getString("status")
                    );
                    System.out.println("Found competition: " + competition.getName());
                }
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving competition with ID " + id);
            e.printStackTrace();
        }

        return competition;
    }

    public void addCompetition(Competition competition) {
        String query = "INSERT INTO competitions (name, type, start_date, end_date, entry_fee, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            // Set parameters
            stmt.setString(1, competition.getName());
            stmt.setString(2, formatTypeForDatabase(competition.getType()));
            stmt.setDate(3, new java.sql.Date(competition.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(competition.getEndDate().getTime()));
            stmt.setDouble(5, competition.getEntryFee());
            stmt.setString(6, competition.getStatus().toLowerCase());

            // Execute update
            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating competition failed, no rows affected.");
            }

            // Get the generated ID
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    competition.setId(generatedKeys.getInt(1));
                    System.out.println("Added competition with ID: " + competition.getId());
                } else {
                    throw new SQLException("Creating competition failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error adding competition:");
            e.printStackTrace();
            throw new RuntimeException("Failed to add competition", e);
        }
    }

    public void updateCompetition(Competition competition) {
        String query = "UPDATE competitions SET name = ?, type = ?, start_date = ?, end_date = ?, entry_fee = ?, status = ? WHERE id = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, competition.getName());
            stmt.setString(2, formatTypeForDatabase(competition.getType()));
            stmt.setDate(3, new java.sql.Date(competition.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(competition.getEndDate().getTime()));
            stmt.setDouble(5, competition.getEntryFee());
            stmt.setString(6, competition.getStatus().toLowerCase());
            stmt.setInt(7, competition.getId());

            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Updated competition with ID " + competition.getId() + ". Rows affected: " + rowsUpdated);

        } catch (SQLException e) {
            System.err.println("Error updating competition with ID " + competition.getId());
            e.printStackTrace();
            throw new RuntimeException("Failed to update competition", e);
        }
    }

    public void deleteCompetition(int id) {
        String query = "DELETE FROM competitions WHERE id = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();

            System.out.println("Deleted competition with ID " + id + ". Rows affected: " + rowsDeleted);

        } catch (SQLException e) {
            System.err.println("Error deleting competition with ID " + id);
            e.printStackTrace();
            throw new RuntimeException("Failed to delete competition", e);
        }
    }

    // Helper method to format type for database storage
    private String formatTypeForDatabase(String type) {
        if (type == null) return null;
        // Convert to lowercase and remove any special characters or spaces
        return type.toLowerCase().replace("-", "").replace(" ", "");
    }

    // Helper method to format type for display

    private String formatTypeForDisplay(String type) {
        if (type == null) return "";

        String formattedType = type.toLowerCase().trim();
        System.out.println("Formatting type '" + type + "' to '" + formattedType + "'");

        // Handle various possible formats
        switch(formattedType) {
            case "academic":
            case "akademik":
                return "academic";
            case "nonacademic":
            case "non-academic":
            case "non academic":
            case "nonakademik":
            case "non-akademik":
                return "non-academic";
            default:
                System.out.println("Warning: Unknown competition type: " + type);
                return formattedType;
        }
    }

    // Additional helper method to check if a competition exists
    public boolean competitionExists(int id) {
        String query = "SELECT COUNT(*) FROM competitions WHERE id = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking competition existence for ID " + id);
            e.printStackTrace();
        }

        return false;
    }
}