package com.example.controller;

import com.example.Services.UserService;
import com.example.classes.User;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ambil data dari form
        String phone = request.getParameter("phone");
        String softSkills = request.getParameter("softSkills");
        String hardSkills = request.getParameter("hardSkills");

        // Dapatkan session user
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            // Update data user
            user.setPhone(phone);
            user.setSoftSkills(softSkills);
            user.setHardSkills(hardSkills);

            // Update ke database
            boolean isUpdated = userService.updateUser(user);

            if (isUpdated) {
                session.setAttribute("user", user); // Update session
                response.sendRedirect(request.getContextPath() + "/WEB-FILE/Profile.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to update profile.");
                request.getRequestDispatcher("/WEB-FILE/Profile.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/WEB-FILE/login.jsp");
        }
    }
}
