package com.example.controller;

import com.example.classes.Discussion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/discussion")
public class DiscussionController extends HttpServlet {
    private List<Discussion> discussions = new ArrayList<>();

    // Add a new discussion topic
    public void addDiscussion(Discussion discussion) {
        discussions.add(discussion);
    }

    // Get all discussion topics
    public List<Discussion> getAllDiscussions() {
        return discussions;
    }

    // Update a discussion topic
    public void updateDiscussion(int topicId, String title, String createdBy, Date date, int replies, String status) {
        for (Discussion discussion : discussions) {
            if (discussion.getTopicId() == topicId) {
                discussion.setTitle(title);
                discussion.setCreatedBy(createdBy);
                discussion.setDate(date);
                discussion.setReplies(replies);
                discussion.setStatus(status);
            }
        }
    }

    // Delete a discussion topic
    public void deleteDiscussion(int topicId) {
        discussions.removeIf(discussion -> discussion.getTopicId() == topicId);
    }
}
