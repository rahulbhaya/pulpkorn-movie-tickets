package org.dogwood.database;

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
    
    public double getMovieRating(String movieName) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT Rating FROM MovieRating WHERE MovieName = ?");
            statement.setString(1, movieName);
            ResultSet results = statement.executeQuery();
            double rating = 0;
            while (results.next()) {
                rating += results.getInt(1);
            }
            statement = connection.prepareStatement(
                    "SELECT COUNT(Rating) FROM MovieRating WHERE MovieName = ?");
            statement.setString(1, movieName);
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
    
    public boolean login(String username, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ? AND Password = ?");
            statement.setString(1, username);
            statement.setString(2, password);
            return statement.executeQuery().next();
        } 
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean rate(String username, String movieName, int rating) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO MovieRating VALUES(?, ?, ?)");
            statement.setString(1, username);
            statement.setString(2, movieName);
            statement.setInt(3, rating);
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean register(String username, String password, String email, String address, String userType) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO User VALUES(?, ?, ?, ?, ?)");
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, address);
            statement.setString(5, userType);
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean review(String username, String movieName, String review) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO MovieReview VALUES(?, ?, ?)");
            statement.setString(1, username);
            statement.setString(2, movieName);
            statement.setString(3, review);
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            return false;
        }
    }
    
}