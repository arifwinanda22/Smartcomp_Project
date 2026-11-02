package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.example.Database.JDBC;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/login", "/LoginController"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cek jika user sudah login sebelumnya
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userId") != null) {
            String roleId = String.valueOf(session.getAttribute("userRole"));
            if ("1".equals(roleId)) {
                response.sendRedirect(request.getContextPath() + "/adminCompetition");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboardUser");
            }
            return;
        }

        // Tampilkan halaman form login
        request.getRequestDispatcher("/WEB-FILE/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email dan password wajib diisi.");
            request.getRequestDispatcher("/WEB-FILE/Login.jsp").forward(request, response);
            return;
        }

        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email.trim());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String dbPassword = rs.getString("password");
                    boolean passwordMatch = false;

                    // Pengecekan hash BCrypt dengan fallback text biasa
                    try {
                        passwordMatch = BCrypt.checkpw(password, dbPassword);
                    } catch (IllegalArgumentException e) {
                        passwordMatch = password.equals(dbPassword);
                    }

                    if (passwordMatch) {
                        // Set Session Pengguna
                        HttpSession session = request.getSession(true);
                        session.setAttribute("userId", rs.getInt("id"));

                        String firstName = rs.getString("first_name");
                        String lastName = rs.getString("last_name");
                        String fullName = ((firstName != null ? firstName : "") + " " + 
                                           (lastName != null ? lastName : "")).trim();

                        session.setAttribute("userName", fullName.isEmpty() ? "User" : fullName);
                        session.setAttribute("userEmail", rs.getString("email"));

                        // Ambil role_id (1 = Admin, 2 = User)
                        String roleId = String.valueOf(rs.getObject("role_id"));
                        session.setAttribute("userRole", roleId);

                        // Routing Dashboard Sesuai Role
                        if ("1".equals(roleId)) {
                            response.sendRedirect(request.getContextPath() + "/adminCompetition");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/dashboardUser");
                        }
                        return;
                    }
                }

                // Jika user tidak ditemukan atau password salah
                request.setAttribute("errorMessage", "Email atau password yang Anda masukkan salah.");
                request.getRequestDispatcher("/WEB-FILE/Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Terjadi kesalahan koneksi server: " + e.getMessage());
            request.getRequestDispatcher("/WEB-FILE/Login.jsp").forward(request, response);
        }
    }
}