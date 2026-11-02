package com.example.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**

 */
public class JDBC {


    private static final String URL = "jdbc:postgresql://localhost:5433/postgres";
    private static final String USER = "postgres";
    private static final String PASSWORD = "12345678";

    /**
     * Mengembalikan koneksi ke database.
     *
     * @return Connection ke database
     * @throws SQLException jika koneksi gagal
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Memuat driver JDBC
            Class.forName("org.postgresql.Driver"); 
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC tidak ditemukan: " + e.getMessage());
            throw new SQLException("Driver JDBC tidak ditemukan.", e);
        }
        // Mengembalikan koneksi
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
