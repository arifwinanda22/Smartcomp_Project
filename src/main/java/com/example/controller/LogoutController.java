package com.example.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogout(request, response);
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        // 1. Ambil session aktif tanpa membuat session baru
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Hapus semua data (user, role, token) dan batalkan sesi
            session.invalidate();
        }

        // 2. Mencegah browser menyimpan cache halaman sebelumnya
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // 3. Arahkan ke halaman login
        response.sendRedirect(request.getContextPath() + "/WEB-FILE/loginPage.jsp?status=logged_out");
    }
}