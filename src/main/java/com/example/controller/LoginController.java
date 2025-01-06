package com.example.controller;

import com.example.Services.UserService;
import com.example.classes.Login;
import com.example.classes.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email and password are required!");
            request.getRequestDispatcher("/WEB-FILE/loginPage.jsp").forward(request, response);
            return;
        }

        Login login = new Login(email, password);

        if (userService.authenticateUser(login)) {
            HttpSession session = request.getSession(true);

            // Ambil user lengkap dan simpan ke session
            User user = userService.getUserByEmail(email);
            session.setAttribute("user", user);

            String role = user.getRoleId();  // Gunakan roleId dari user object

            if ("1".equals(role)) {
                session.setAttribute("role", "admin");
                response.sendRedirect(request.getContextPath() + "/WEB-FILE/dashboardAdmin.jsp");
            } else {
                session.setAttribute("role", "user");
                response.sendRedirect(request.getContextPath() + "/WEB-FILE/dashboardUser.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("/WEB-FILE/loginPage.jsp").forward(request, response);
        }
    }
}