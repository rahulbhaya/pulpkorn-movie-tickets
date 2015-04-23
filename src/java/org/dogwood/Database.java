package org.dogwood;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import org.json.simple.JSONObject;

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
    
    public boolean addMovie(JSONObject json) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Movie VALUES(?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, (String) json.get("id"));
            statement.setString(2, (String) json.get("title"));
            statement.setString(3, (String) json.get("mpaa_rating"));
            statement.setString(4, json.get("runtime").toString());
            statement.setString(5, (String) ((JSONObject) json.get("release_dates")).get("theater"));
            statement.setString(6, (String) json.get("synopsis"));
            String thumbnail = (String) ((JSONObject) json.get("posters")).get("thumbnail");
            int index = thumbnail.indexOf("/movie/");
            String poster;
            if (index == -1) {
                poster = "http://d3biamo577v4eu.cloudfront.net/static/images/redesign/poster_default_thumb.gif";
            }
            else {
                poster = "http://content6.flixster.com" + thumbnail.substring(index);
            }
            statement.setString(7, poster);
            statement.executeUpdate();
            return true;
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
    
    public boolean changePassword(String name, String currentPassword, String newPassword) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE User SET Password = ? WHERE Name = ? AND Password = ?");
            statement.setString(1, newPassword);
            statement.setString(2, name);
            statement.setString(3, currentPassword);
            return statement.executeUpdate() == 1;
        }
        catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
    
    public List<Movie> getInTheatersMovies() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE ReleaseDate <= CURDATE()");
            ResultSet results = statement.executeQuery();
            List<Movie> movies = new LinkedList<>();
            while (results.next()) {
                String id = results.getString(1);
                String title = results.getString(2);
                String mpaaRating = results.getString(3);
                int runtime = results.getInt(4);
                String releaseDate = results.getString(5);
                String synopsis = results.getString(6);
                String image = results.getString(7);
                movies.add(new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image));
            }
            return movies;
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public Movie getMovieById(String id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE Id = ?");
            statement.setString(1, id);
            ResultSet results = statement.executeQuery();
            results.next();
            String title = results.getString(2);
            String mpaaRating = results.getString(3);
            int runtime = results.getInt(4);
            String releaseDate = results.getString(5);
            String synopsis = results.getString(6);
            String image = results.getString(7);
            return new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image);
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public Movie getMovieByTitle(String title){
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE Title = ?");
            statement.setString(1, title);
            ResultSet results = statement.executeQuery();
            results.next();
            String id = results.getString(1);
            String mpaaRating = results.getString(3);
            int runtime = results.getInt(4);
            String releaseDate = results.getString(5);
            String synopsis = results.getString(6);
            String image = results.getString(7);
            return new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image);
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return null;
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
            System.out.println(ex);
            return 0;
        }
    }
    
    public List<Movie> getUpcomingMovies() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE ReleaseDate > CURDATE()");
            ResultSet results = statement.executeQuery();
            List<Movie> movies = new LinkedList<>();
            while (results.next()) {
                String id = results.getString(1);
                String title = results.getString(2);
                String mpaaRating = results.getString(3);
                int runtime = results.getInt(4);
                String releaseDate = results.getString(5);
                String synopsis = results.getString(6);
                String image = results.getString(7);
                movies.add(new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image));
            }
            return movies;
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    /*
    Returns:
    - 0 if username doesn't exist in User table (failed logIn)
    - 1 if password isn't correct (also failed logIn)
    - 2 if something else fails (catchs SQLException)
    - 3 if successful logIn
    */
    public int logIn(String name, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ?");
            statement.setString(1, name);
            if (!statement.executeQuery().next()) {
                return 0;
            }
            statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ? AND Password = ?");
            statement.setString(1, name);
            statement.setString(2, password);
            if (!statement.executeQuery().next()) {
                return 1;
            }
            return 3;
        } 
        catch (SQLException ex) {
            System.out.println(ex);
            return 2;
        }
    }
    
    public boolean rateMovie(String userName, String movieId, String rating) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO MovieRating VALUES(?, ?, ?)");
            statement.setString(1, userName);
            statement.setString(2, movieId);
            statement.setInt(3, Integer.parseInt(rating));
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
    
    public boolean register(String name, String password, String type) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO User VALUES(?, ?, ?)");
            statement.setString(1, name);
            statement.setString(2, password);
            statement.setString(3, type);
            statement.executeUpdate();
            return true;
        }
        catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
    public boolean saveCardInfo(String cardType, String cardNumber, String securityCode, String cardName, String acctName){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO CreditCardInfo VALUES(?, ?, ?, ?, ?");
            statement.setString(1, acctName);
            statement.setString(2, cardType);
            statement.setString(3, cardNumber);
            statement.setString(4, securityCode);
            statement.setString(5, cardName);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    
}
