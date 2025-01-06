package com.example.Services;

import com.example.classes.User;
import com.example.Database.JDBC;
import com.example.classes.Login;
import com.example.classes.UserSignup;
import com.example.utils.PasswordUtils;
import com.example.classes.Workshop;
import com.example.classes.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserService {

    public boolean registerUser(UserSignup user) {
        if (user == null || user.getEmail() == null || user.getPassword() == null) {
            System.out.println("Registration failed: Invalid input data");
            return false;
        }

        String email = user.getEmail().trim().toLowerCase();
        String roleId = user.getRoleId();

        // Validate email format based on role
        if (roleId.equals("1") && !email.endsWith("@admin.ac.id")) {
            System.out.println("Registration failed: Admin email must end with @admin.ac.id");
            return false;
        } else if (roleId.equals("2") && email.endsWith("@admin.ac.id")) {
            System.out.println("Registration failed: User email cannot end with @admin.ac.id");
            return false;
        }

        System.out.println("Attempting to register user: " + email);

        String checkQuery = "SELECT * FROM users WHERE email = ?";
        String insertQuery = "INSERT INTO users (first_name, last_name, email, password, role_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = JDBC.getConnection()) {
            // Check for existing email
            PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                System.out.println("Email already registered: " + email);
                return false;
            }

            // Hash password and save user
            String hashedPassword = PasswordUtils.hashPassword(user.getPassword());
            PreparedStatement insertStmt = connection.prepareStatement(insertQuery);
            insertStmt.setString(1, user.getFirstName().trim());
            insertStmt.setString(2, user.getLastName().trim());
            insertStmt.setString(3, email);
            insertStmt.setString(4, hashedPassword);
            insertStmt.setString(5, roleId);

            int rowsAffected = insertStmt.executeUpdate();
            System.out.println("Registration result: " + (rowsAffected > 0 ? "Success" : "Failed"));

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Registration error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean authenticateUser(Login login) {
        if (login == null || login.getEmail() == null || login.getPassword() == null) {
            System.out.println("Authentication failed: Invalid input data");
            return false;
        }

        System.out.println("Attempting authentication for email: " + login.getEmail());

        String query = "SELECT password, role_id FROM users WHERE email = ?";

        try (Connection connection = JDBC.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, login.getEmail().trim().toLowerCase());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (storedPassword == null || storedPassword.isEmpty()) {
                    System.out.println("Stored password is null or empty");
                    return false;
                }

                try {
                    boolean passwordMatch = PasswordUtils.verifyPassword(login.getPassword(), storedPassword);
                    if (passwordMatch) {
                        login.setRole(rs.getString("role_id"));
                        System.out.println("Authentication successful");
                        return true;
                    }
                } catch (IllegalArgumentException e) {
                    System.out.println("Password verification error: " + e.getMessage());
                    return false;
                }
            }
            System.out.println("Authentication failed: Invalid credentials");
        } catch (Exception e) {
            System.out.println("Authentication error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public String getRoleByEmail(String email) {
        String query = "SELECT role_id FROM users WHERE email = ?";
        try (Connection connection = JDBC.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email.trim().toLowerCase());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString("role_id");
            }
        } catch (Exception e) {
            System.out.println("Error fetching role: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUser(User user) {
        if (user == null || user.getEmail() == null) {
            System.out.println("Update failed: Invalid input data");
            return false;
        }

        String updateQuery = "UPDATE users SET first_name = ?, last_name = ?, phone = ?, soft_skills = ?, hard_skills = ? WHERE email = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

            preparedStatement.setString(1, user.getFirstName().trim());
            preparedStatement.setString(2, user.getLastName().trim());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getSoftSkills());
            preparedStatement.setString(5, user.getHardSkills());
            preparedStatement.setString(6, user.getEmail().trim().toLowerCase());

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println("Update result: " + (rowsUpdated > 0 ? "Success" : "Failed"));
            return rowsUpdated > 0;

        } catch (Exception e) {
            System.out.println("Update error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }



    public boolean deleteUser(String email) {
        String query = "DELETE FROM users WHERE email = ?";

        try (Connection connection = JDBC.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email.trim().toLowerCase());

            int rowsAffected = stmt.executeUpdate();
            System.out.println("Delete result: " + (rowsAffected > 0 ? "Success" : "Failed"));
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Delete error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByEmail(String email) {
        String selectQuery = "SELECT first_name, last_name, email, password, role_id, phone, soft_skills, hard_skills FROM users WHERE email = ?";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setString(1, email.trim().toLowerCase());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                User user = new User();
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRoleId(resultSet.getString("role_id"));
                user.setPhone(resultSet.getString("phone"));
                user.setSoftSkills(resultSet.getString("soft_skills"));
                user.setHardSkills(resultSet.getString("hard_skills"));
                return user;
            }

        } catch (Exception e) {
            System.out.println("Error fetching user: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public List<User> listAllUsers() {
        String query = "SELECT * FROM users";
        List<User> users = new ArrayList<>();

        try (Connection connection = JDBC.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                users.add(new User(
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role_id"),
                        rs.getString("phone"),
                        rs.getString("soft_skills"),
                        rs.getString("hard_skills")
                ));
            }
        } catch (Exception e) {
            System.out.println("Error fetching users: " + e.getMessage());
            e.printStackTrace();
        }
        return users;
    }


    public List<Workshop> getAllWorkshops() {
        List<Workshop> workshops = new ArrayList<>();
        String query = "SELECT * FROM workshops";

        try (Connection connection = JDBC.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Workshop workshop = new Workshop(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDate("date"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getString("status"),
                        rs.getString("type") // assuming type column exists in your table
                );
                workshops.add(workshop);
            }
        } catch (Exception e) {
            System.out.println("Error fetching workshops: " + e.getMessage());
            e.printStackTrace();
        }

        return workshops;
    }

    // Menambahkan pembayaran ke database
    public void addPayment(Payment payment) {
        String query = "INSERT INTO payments (user, event_type, event_name, amount, date, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = JDBC.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, payment.getUser());
            preparedStatement.setString(2, payment.getEventType());
            preparedStatement.setString(3, payment.getEventName());
            preparedStatement.setDouble(4, payment.getAmount());
            preparedStatement.setDate(5, new java.sql.Date(payment.getDate().getTime())); // Convert java.util.Date to java.sql.Date
            preparedStatement.setString(6, payment.getStatus());

            preparedStatement.executeUpdate(); // Menjalankan query untuk menyimpan data ke tabel payments
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Mengambil semua pembayaran dari database
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payments";

        try (Connection connection = JDBC.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int paymentId = resultSet.getInt("payment_id");
                String user = resultSet.getString("user");
                String eventType = resultSet.getString("event_type");
                String eventName = resultSet.getString("event_name");
                double amount = resultSet.getDouble("amount");
                Date date = resultSet.getDate("date");
                String status = resultSet.getString("status");

                Payment payment = new Payment(paymentId, user, eventType, eventName, amount, date, status);
                payments.add(payment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payments;
    }
}
