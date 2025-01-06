package com.example.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {

    public static String hashPassword(String password) {
        if (password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public static boolean verifyPassword(String enteredPassword, String storedPassword) {
        if (enteredPassword == null || storedPassword == null) {
            throw new IllegalArgumentException("Passwords cannot be null");
        }
        try {
            return BCrypt.checkpw(enteredPassword, storedPassword);
        } catch (IllegalArgumentException e) {
            System.out.println("Error verifying password: " + e.getMessage());
            throw e;
        }
    }
}