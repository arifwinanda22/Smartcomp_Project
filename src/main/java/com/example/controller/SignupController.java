package com.example.controller;

import com.example.Services.UserService;
import com.example.classes.UserSignup;
import java.io.IOException;
import com.example.classes.User;

import com.example.classes.UserSignup;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/signup")
public class SignupController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validasi input (tetap sama)
        if (firstName == null || lastName == null || email == null || password == null ||
                firstName.trim().isEmpty() || lastName.trim().isEmpty() ||
                email.trim().isEmpty() || password.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("/WEB-FILE/signup.jsp").forward(request, response);
            return;
        }

        String roleId = email.toLowerCase().endsWith("@admin.ac.id") ? "1" : "2";

        UserSignup user = new UserSignup(firstName, lastName, email, password, roleId);

        // Proses registrasi
        if (userService.registerUser(user)) {
            // Setelah registrasi berhasil, ambil data user lengkap
            User fullUser = userService.getUserByEmail(email);

            // Simpan ke session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", fullUser);
            session.setAttribute("role", roleId.equals("1") ? "admin" : "user");

            // Redirect ke Profile.jsp
            response.sendRedirect(request.getContextPath() + "/WEB-FILE/signupSuccess.jsp");
        } else {
            // Handling error tetap sama
            if (email.endsWith("@admin.ac.id") && roleId.equals("2")) {
                request.setAttribute("errorMessage", "Admin email must use proper admin registration.");
            } else if (!email.endsWith("@admin.ac.id") && roleId.equals("1")) {
                request.setAttribute("errorMessage", "Non-admin email cannot register as admin.");
            } else {
                request.setAttribute("errorMessage", "Registration failed! Email might already be registered.");
            }
            request.getRequestDispatcher("/WEB-FILE/signup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cek jika user sudah login
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/WEB-FILE/Profile.jsp");
            return;
        }

        request.getRequestDispatcher("/WEB-FILE/signup.jsp").forward(request, response);
    }
}