package com.example.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Kelas JDBC untuk mengelola koneksi ke database.
 */
public class JDBC {

    // Konstanta untuk konfigurasi database
    private static final String URL = "jdbc:mysql://localhost:3306/smartcomp?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    /**
     * Mengembalikan koneksi ke database.
     *
     * @return Connection ke database
     * @throws SQLException jika koneksi gagal
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Memuat driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver"); // Sesuaikan dengan versi MySQL Connector
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC tidak ditemukan: " + e.getMessage());
            throw new SQLException("Driver JDBC tidak ditemukan.", e);
        }
        // Mengembalikan koneksi
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
