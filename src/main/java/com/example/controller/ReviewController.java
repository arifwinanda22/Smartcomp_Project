package com.example.controller;

import com.example.classes.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/review")
public class ReviewController extends HttpServlet {
    private List<Review> reviews = new ArrayList<>();

    // Add a new review
    public void addReview(Review review) {
        reviews.add(review);
    }

    // Get all reviews
    public List<Review> getAllReviews() {
        return reviews;
    }

    // Update a review
    public void updateReview(int reviewId, String user, String eventName, int rating, String comment, Date date, String status) {
        for (Review review : reviews) {
            if (review.getReviewId() == reviewId) {
                review.setUser(user);
                review.setEventName(eventName);
                review.setRating(rating);
                review.setComment(comment);
                review.setDate(date);
                review.setStatus(status);
            }
        }
    }

    // Delete a review
    public void deleteReview(int reviewId) {
        reviews.removeIf(review -> review.getReviewId() == reviewId);
    }
}
