package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Database.JDBC;
import com.example.classes.ForumPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forum")
public class ForumController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filter = request.getParameter("filter");
        List<ForumPost> posts = new ArrayList<>();

        String sql = "SELECT * FROM forum_posts WHERE status = 'Active'";
        if (filter != null && !filter.equalsIgnoreCase("All") && !filter.isEmpty()) {
            sql += " AND category = ?";
        }
        sql += " ORDER BY id DESC";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (filter != null && !filter.equalsIgnoreCase("All") && !filter.isEmpty()) {
                ps.setString(1, filter);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ForumPost p = new ForumPost();
                    p.setId(rs.getInt("id"));
                    p.setUserName(rs.getString("user_name"));
                    p.setTitle(rs.getString("title"));
                    p.setContent(rs.getString("content"));
                    p.setCategory(rs.getString("category"));
                    p.setLearningSubject(rs.getString("learning_subject"));
                    p.setAchievementScore(rs.getInt("achievement_score"));
                    p.setRecommendedCompName(rs.getString("recommended_comp_name"));
                    p.setCreatedAt(rs.getTimestamp("created_at"));
                    p.setStatus(rs.getString("status"));
                    posts.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("posts", posts);
        request.setAttribute("currentFilter", (filter != null) ? filter : "All");
        request.getRequestDispatcher("/WEB-FILE/forum.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("userName");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        String learningSubject = request.getParameter("learningSubject");
        String scoreStr = request.getParameter("achievementScore");
        String recommendedComp = request.getParameter("recommendedCompName");

        int score = 0;
        try {
            if (scoreStr != null && !scoreStr.isEmpty()) score = Integer.parseInt(scoreStr);
        } catch (Exception ignored) {}

        String sql = "INSERT INTO forum_posts (user_name, title, content, category, learning_subject, achievement_score, recommended_comp_name, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Active')";

        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, (userName != null && !userName.isEmpty()) ? userName : "Mahasiswa SmartComp");
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, category);
            ps.setString(5, learningSubject);
            ps.setInt(6, score);
            ps.setString(7, recommendedComp);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/forum");
    }
}