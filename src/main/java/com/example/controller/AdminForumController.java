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

@WebServlet("/adminForum")
public class AdminForumController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ForumPost> forumPosts = getAllForumPosts();
        
        request.setAttribute("forumPosts", forumPosts);
        request.setAttribute("activeTab", "forum");

        // Forward ke dashboardAdmin.jsp dengan tab forum aktif
        request.getRequestDispatcher("/WEB-FILE/dashboardAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try (Connection conn = JDBC.getConnection();
                 PreparedStatement ps = conn.prepareStatement("DELETE FROM forum_posts WHERE id = ?")) {
                ps.setInt(1, id);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/adminForum");
    }

    private List<ForumPost> getAllForumPosts() {
        List<ForumPost> list = new ArrayList<>();
        String sql = "SELECT * FROM forum_posts ORDER BY id ASC";
        try (Connection conn = JDBC.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
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
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}