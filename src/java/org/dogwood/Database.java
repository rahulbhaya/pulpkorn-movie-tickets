package org.dogwood;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Database {
    
    private static final String URL = "jdbc:mysql://localhost:3306/dogwood?zeroDateTimeBehavior=convertToNull";
    private static final String USER = "root", PASSWORD = "root";
    
    private Connection connection;

    public Database() {
        try {
            Class.forName("com.mysql.jdbc.Driver");       
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } 
        catch (Exception ex) {
           System.out.println(ex);
        }
    }
    
    public void close() {
        try {
            connection.close();
        } 
        catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public double getMovieRating(String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT Rating FROM MovieRating WHERE MovieId = ?");
            statement.setString(1, movieId);
            ResultSet results = statement.executeQuery();
            double rating = 0;
            while (results.next()) {
                rating += results.getInt(1);
            }
            statement = connection.prepareStatement(
                    "SELECT COUNT(Rating) FROM MovieRating WHERE MovieId = ?");
            statement.setString(1, movieId);
            results = statement.executeQuery();
            if (results.next()) {
                rating /= results.getInt(1);
            }
            else {
                rating = 0;
            }
            return rating;
        } 
        catch (SQLException ex) {
            return 0;
        }
    }
    
    public boolean login(String email, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Email = ? AND Password = ?");
            statement.setString(1, email);
            statement.setString(2, password);
            return statement.executeQuery().next();
        } 
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean rate(String email, String movieId, String rating) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO MovieRating VALUES(?, ?, ?)");
            statement.setString(1, email);
            statement.setString(2, movieId);
            statement.setInt(3, Integer.parseInt(rating));
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean register(String email, String password, String type) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO User VALUES(?, ?, ?)");
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, type);
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
}