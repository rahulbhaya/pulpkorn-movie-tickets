package org.dogwood;

import org.dogwood.beans.Movie;
import org.dogwood.beans.Comment;
import org.dogwood.beans.FAQ;
import org.dogwood.beans.Help;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.dogwood.beans.CastMember;
import org.dogwood.beans.NewsArticle;
import org.json.simple.JSONObject;

public class Database {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/dogwood?zeroDateTimeBehavior=convertToNull";
    private static final String USER = "root", PASSWORD = "root";

    public static enum Login {
        INCORRECT_USERNAME, INCORRECT_PASSWORD, SQL_ERROR, CORRRECT_NORMAL, CORRECT_ADMIN
    }

    private static final Database db = new Database();

    private final DataSource dataSource;

    private Connection connection;

    public static Database getInstance() {
        try {
            if (db.connection != null && !db.connection.isClosed()) {
                db.connection.close();
            }
            db.connection = db.dataSource.getConnection();
            return db;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    private Database() {
        dataSource = new DataSource();
        dataSource.setDriverClassName(DRIVER);
        dataSource.setUrl(URL);
        dataSource.setUsername(USER);
        dataSource.setPassword(PASSWORD);
    }

    public void close() {
        try {
            connection.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public boolean addCastMember(String name, String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO CastMember VALUES(?, ?)");
            statement.setString(1, name);
            statement.setString(2, movieId);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addTrailerUrl(String url, String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE Movie SET Trailer = ? WHERE Id = ?");
            statement.setString(1, url);
            statement.setString(2, movieId);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addFAQ(JSONObject json) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO FAQ VALUES(?, ?)");
            statement.setString(1, (String) json.get("question"));
            statement.setString(2, (String) json.get("answer"));
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addHelp(JSONObject json) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Help VALUES(?, ?)");
            statement.setString(1, (String) json.get("topic"));
            statement.setString(2, (String) json.get("answer"));
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addMovie(JSONObject json) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Movie VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
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
            } else {
                poster = "http://content6.flixster.com" + thumbnail.substring(index);
            }
            statement.setString(7, poster);
            statement.setString(8, "");
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addMovie(String id, String title, String releaseDate, String mpaaRating, String synopsis) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Movie VALUES(?, ?, ?, ?, ?)");
            statement.setString(1, id);
            statement.setString(2, title);
            statement.setString(3, releaseDate);
            statement.setString(4, mpaaRating);
            statement.setString(5, synopsis);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean addNewsArticle(String title, String description, String link, String image) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO NewsArticle VALUES(?, ?, ?, ?)");
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setString(3, link);
            statement.setString(4, image);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean changePassword(String name, String currentPassword, String newPassword) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE User SET Password = MD5(?) WHERE Name = ? AND Password = MD5(?)");
            statement.setString(1, newPassword);
            statement.setString(2, name);
            statement.setString(3, currentPassword);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
     public boolean changeEmail(String name, String currentEmail, String newEmail) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE User SET Email = ? WHERE Name = ? AND Email = ?");
            statement.setString(1, newEmail);
            statement.setString(2, name);
            statement.setString(3, currentEmail);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        }
        catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean comment(String userName, String movieId, String message) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Comment VALUES((SELECT Name FROM User WHERE Name = ?),"
                    + " (SELECT Id FROM Movie WHERE Id = ?), ?, NOW())");
            statement.setString(1, userName);
            statement.setString(2, movieId);
            statement.setString(3, message);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean deleteMovie(String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM Comment WHERE MovieId = ?");
            statement.setString(1, movieId);
            statement.executeUpdate();
            statement = connection.prepareStatement(
                    "DELETE FROM CastMember WHERE MovieId = ?");
            statement.setString(1, movieId);
            statement.executeUpdate();
            statement = connection.prepareStatement(
                    "DELETE FROM Movie WHERE Id = ?");
            statement.setString(1, movieId);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean editMovie(String id, String title, String releaseDate, String mpaaRating, String synopsis) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE Movie SET Title = ?, ReleaseDate = ?, MPAARating = ?, Synopsis = ? WHERE Id = ?");
            statement.setString(1, title);
            statement.setString(2, releaseDate);
            statement.setString(3, mpaaRating);
            statement.setString(4, synopsis);
            statement.setString(5, id);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public List<Movie> getAllMovies() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie ORDER BY ReleaseDate");
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
            connection.close();
            return movies;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public List<String> getCardNumberByName(String name) {
        List<String> cards = new LinkedList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT CardNumber FROM CreditCardInfo WHERE Name=?");
            statement.setString(1, name);
            ResultSet results = statement.executeQuery();
            while (results.next()) {
                cards.add(results.getString(1));
            }
        } catch (SQLException ex) {
        }
        return cards;
    }

    public List<CastMember> getCast(String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM CastMember WHERE MovieId = ?");
            statement.setString(1, movieId);
            ResultSet results = statement.executeQuery();
            List<CastMember> cast = new LinkedList<>();
            while (results.next()) {
                String name = results.getString(1);
                cast.add(new CastMember(name, movieId));
            }
            connection.close();
            return cast;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public String getEmailByUsername(String userName) {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT Email FROM User WHERE Name=?");
            statement.setString(1, userName);
            ResultSet set = statement.executeQuery();
            String email = "";
            while (set.next()) {
                email = set.getString(1);
            }
            return email;
        } catch (SQLException ex) {
            return "";
        }
    }

    public String getTrailerUrl(String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE Id = ?");
            statement.setString(1, movieId);
            ResultSet results = statement.executeQuery();
            results.next();
            String trailer = results.getString(8);
            connection.close();
            return trailer;
        } catch (SQLException ex) {
            return null;
        }
    }

    public List<Comment> getComments(String movieId) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Comment WHERE MovieId = ? ORDER BY DateCommented");
            statement.setString(1, movieId);
            ResultSet results = statement.executeQuery();
            List<Comment> comments = new LinkedList<>();
            while (results.next()) {
                String commenter = results.getString(1);
                String message = results.getString(3);
                String dateCommented = results.getString(4);
                comments.add(new Comment(commenter, movieId, message, dateCommented));
            }
            connection.close();
            return comments;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public List<FAQ> getFAQs() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM FAQ");
            ResultSet results = statement.executeQuery();
            List<FAQ> faqs = new LinkedList<>();
            while (results.next()) {
                String question = results.getString(1);
                String answer = results.getString(2);
                faqs.add(new FAQ(question, answer));
            }
            connection.close();
            return faqs;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public List<Help> getHelp() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Help");
            ResultSet results = statement.executeQuery();
            List<Help> help = new LinkedList<>();
            while (results.next()) {
                String topic = results.getString(1);
                String answer = results.getString(2);
                help.add(new Help(topic, answer));
            }
            connection.close();
            return help;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public List<Movie> getInTheatersMovies() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE ReleaseDate <= CURDATE() ORDER BY ReleaseDate");
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
            connection.close();
            return movies;
        } catch (SQLException ex) {
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
            connection.close();
            return new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image);
        } catch (SQLException ex) {
            return null;
        }
    }

    public Movie getMovieByTitle(String title) {
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
            connection.close();
            return new Movie(id, title, mpaaRating, runtime, releaseDate, synopsis, image);
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public List<NewsArticle> getMovieNews() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM NewsArticle");
            ResultSet results = statement.executeQuery();
            List<NewsArticle> movieNews = new LinkedList<>();
            while (results.next()) {
                String title = results.getString(1);
                String description = results.getString(2);
                String link = results.getString(3);
                String image = results.getString(4);
                movieNews.add(new NewsArticle(title, description, link, image));
            }
            connection.close();
            return movieNews;
        } catch (SQLException ex) {
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
            } else {
                rating = 0;
            }
            connection.close();
            return rating;
        } catch (SQLException ex) {
            System.out.println(ex);
            return 0;
        }
    }

    public List<Movie> getUpcomingMovies() {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM Movie WHERE ReleaseDate > CURDATE() ORDER BY ReleaseDate");
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
            connection.close();
            return movies;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public boolean hasUser(String email) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Email = ?"
            );
            statement.setString(1, email);
            return statement.executeQuery().next();
        } catch (Exception ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean hasUser(String name, String email) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ? AND Email = ?"
            );
            statement.setString(1, name);
            statement.setString(2, email);
            return statement.executeQuery().next();
        } catch (Exception ex) {
            System.out.println(ex);
            return false;
        }
    }

    public Login logIn(String name, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ?");
            statement.setString(1, name);
            if (!statement.executeQuery().next()) {
                return Login.INCORRECT_USERNAME;
            }
            statement = connection.prepareStatement(
                    "SELECT * FROM User WHERE Name = ? AND Password = MD5(?)");
            statement.setString(1, name);
            statement.setString(2, password);
            ResultSet results = statement.executeQuery();
            if (!results.next()) {
                return Login.INCORRECT_PASSWORD;
            }
            Login login = results.getString(4).equals("NORMAL") ? Login.CORRRECT_NORMAL : Login.CORRECT_ADMIN;
            connection.close();
            return login;
        } catch (SQLException ex) {
            System.out.println(ex);
            return Login.SQL_ERROR;
        }
    }

    public boolean modifyUser(String name, String email, String password, String type) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE User SET Email = ?, Password = MD5(?), Type = ? WHERE Name = ?");
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, type);
            statement.setString(4, name);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
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
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean refundPurchase(int pin) {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * from Purchase WHERE PurchaseId=?");
            statement.setInt(1, pin);
            ResultSet set = statement.executeQuery();
            Boolean exists = false;
            while (set.next()) {
                exists = true;
            }
            if (!exists) {
                return false;
            }
            statement = connection.prepareStatement("DELETE FROM Purchase WHERE PurchaseId=?");
            statement.setInt(1, pin);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean register(String name, String email, String password, String type) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO User VALUES(?, ?, MD5(?), ?)");
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, type);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean removeComment(String userName, String movieId, String dateCommented) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM Comment WHERE Commenter = ? AND MovieId = ? "
                    + "AND DateCommented = ?");
            statement.setString(1, userName);
            statement.setString(2, movieId);
            statement.setString(3, dateCommented);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean requestPasswordReset(String email, String resetPassword) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM ResetPasswordRequest WHERE Email = (SELECT Email FROM User WHERE Email = ?)");
            statement.setString(1, email);
            if (statement.executeQuery().next()) {
                statement = connection.prepareStatement(
                        "DELETE FROM ResetPasswordRequest WHERE Email = (SELECT Email FROM User WHERE Email = ?)");
                statement.setString(1, email);
            }
            statement = connection.prepareStatement(
                    "INSERT INTO ResetPasswordRequest VALUES (?, MD5(?))");
            statement.setString(1, email);
            statement.setString(2, resetPassword);
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean resetPassword(String email, String resetPassword, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM ResetPasswordRequest WHERE Email = (SELECT Email FROM User WHERE Email = ?) AND Password = MD5(?)");
            statement.setString(1, email);
            statement.setString(2, resetPassword);
            statement = connection.prepareStatement(
                    "UPDATE User SET Password = MD5(?) WHERE Email = ?"
            );
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean saveCardInfo(String billingAddress, String cardNumber, String securityCode, String cardName, String acctName, String expDateY, String expDateM, String city, String state, String zip, String phone) {
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO CreditCardInfo VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, acctName);
            statement.setString(2, cardNumber);
            statement.setString(3, securityCode);
            statement.setString(4, cardName);
            statement.setString(5, billingAddress);
            statement.setString(6, expDateM);
            statement.setString(7, expDateY);
            statement.setString(8, city);
            statement.setString(9, state);
            statement.setString(10, zip);
            statement.setString(11, phone);
            statement.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public boolean saveGiftPurchase(String name, String billingAddress, String cardNumber, String securityCode, String cardName, String expDateY, String expDateM, String email, int cardAmount, int numCard){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO CardPurchase VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1,name);
            statement.setString(2,cardNumber);
            statement.setString(3,securityCode);
            statement.setString(4,cardName);
            statement.setString(5,billingAddress);
            statement.setString(6,expDateM);
            statement.setString(7,expDateY);
            int random = (int) (Math.random() * 9000000) + 1000000;
            statement.setInt(8, random);
            statement.setInt(9,cardAmount);
            statement.setInt(10,numCard);
            statement.executeUpdate();
            if (!name.equals("Guest")) {
                Dogwood.sendGiftCardReceipt(getEmailByUsername(name), billingAddress, cardAmount, numCard);
            } else {
                Dogwood.sendGiftCardReceipt(email, billingAddress, cardAmount, numCard);
            }
            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean savePrePurchase(String number, String name, String movie, String theater, String time, int adults, int seniors, int children) {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM CreditCardInfo WHERE CardNumber=?");
            statement.setString(1, number);
            ResultSet rs = statement.executeQuery();
            String cardName = "";
            String securityCode = "";
            String billingAddress = "";
            String expDateM = "";
            String expDateY = "";
            while (rs.next()) {
                cardName = rs.getString(4);
                securityCode = rs.getString(3);
                billingAddress = rs.getString(5);
                expDateM = rs.getString(6);
                expDateY = rs.getString(7);
            }
            statement = connection.prepareStatement("INSERT INTO Purchase VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, name);
            statement.setString(2, movie);
            statement.setString(3, theater);
            statement.setString(4, time);
            statement.setInt(5, adults);
            statement.setInt(6, children);
            statement.setInt(7, seniors);
            statement.setString(8, number);
            statement.setString(9, securityCode);
            statement.setString(10, cardName);
            statement.setString(11, billingAddress);
            statement.setString(12, expDateM);
            statement.setString(13, expDateY);
            int random = (int) (Math.random() * 9000000) + 1000000;
            statement.setInt(14, random);
            statement.executeUpdate();
            Dogwood.sendPurchaseReciept(getEmailByUsername(name), random, movie, theater, time, adults, seniors, children);
            System.out.println(random);
            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean saveRegularPurchase(String name, String movie, String theater, String time, int adults, int seniors, int children, String billingAddress, String cardNumber, String securityCode, String cardName, String expDateY, String expDateM, String email) {
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO Purchase VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, name);
            statement.setString(2, movie);
            statement.setString(3, theater);
            statement.setString(4, time);
            statement.setInt(5, adults);
            statement.setInt(6, children);
            statement.setInt(7, seniors);
            statement.setString(8, cardNumber);
            statement.setString(9, securityCode);
            statement.setString(10, cardName);
            statement.setString(11, billingAddress);
            statement.setString(12, expDateM);
            statement.setString(13, expDateY);
            int random = (int) (Math.random() * 9000000) + 1000000;
            statement.setInt(14, random);
            statement.executeUpdate();
            System.out.println(name);
            System.out.println(email);
            if (!name.equals("Guest")) {
                Dogwood.sendPurchaseReciept(getEmailByUsername(name), random, movie, theater, time, adults, seniors, children);
            } else {
                Dogwood.sendPurchaseReciept(email, random, movie, theater, time, adults, seniors, children);
            }
            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean subscribe(String email) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO Subscriber VALUES (?)");
            statement.setString(1, email);
            boolean retValue = statement.executeUpdate() == 1;
            connection.close();
            return retValue;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

}
