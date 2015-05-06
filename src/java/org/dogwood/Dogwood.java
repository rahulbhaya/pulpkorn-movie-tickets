package org.dogwood;

import org.dogwood.beans.Showtimes;
import org.dogwood.beans.Movie;
import org.dogwood.beans.MovieTheater;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.dogwood.beans.CastMember;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class Dogwood {

    public static final String API_KEY = "gs2spwmu9dt6uqnaxhsadxp6";

    public static final String BASE_URL = "http://api.rottentomatoes.com/api/public/v1.0";

    public static final String GMAIL_EMAIL = "cse308teamdogwood@gmail.com";

    public static final String GMAIL_PASSWORD = "dogwood308";

    public static List<CastMember> getCast(String movieId) {
        try {
            URL url = new URL(BASE_URL + "/movies/" + movieId + "/cast.json?apikey=" + API_KEY);
            JSONObject json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray cast = (JSONArray) json.get("cast");
            for (Object obj : cast) {
                JSONObject castMember = (JSONObject) obj;
                Database.getInstance().addCastMember((String) castMember.get("name"), movieId);
            }
            return Database.getInstance().getCast(movieId);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public static List<MovieTheater> getTheaters(String near) {
        try {
            Document doc = Jsoup.connect("http://www.google.com/movies?near=" + near).get();
            List<MovieTheater> theaterList = new ArrayList<>();
            for (Element theater : doc.select(".theater")) {
                String movieTheaterName = theater.select("h2.name").text();
                String movieTheaterAddress = theater.select("div.info").text();
                MovieTheater mt = new MovieTheater(movieTheaterName, movieTheaterAddress);
                for (Element movie : theater.select(".showtimes .movie")) {
                    Showtimes m = new Showtimes(movie.select("div.name").text());
                    for (Element time : movie.select(".times > span")) {
                        m.getTimes().add(time.text());
                    }
                    m.setMovie(Database.getInstance().getMovieByTitle(m.getName()));
                    mt.getShowtimes().add(m);
                }
                theaterList.add(mt);
            }
            return theaterList;
        } catch (IOException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    
    
    public static String getTrailer(String movieId) {
        try {
            String title = Database.getInstance().getMovieById(movieId).getTitle().replace(" ", "+");
            Document doc = Jsoup.connect("http://www.youtube.com/results?search_query="+title+"+trailer").get();
            String video = ("http://www.youtube.com" + doc.select(".item-section").get(0).child(0).child(0).child(0).child(0).child(0).attr("href")).replace("watch?v=", "embed/");
            Database.getInstance().addTrailerUrl(video, movieId);
            return Database.getInstance().getTrailerUrl(movieId);
        } catch (IOException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public static boolean requestPasswordReset(String email) {
        try {
            String resetPassword = UUID.randomUUID().toString().replaceAll("-", "");
            String link = "http://localhost/resetpassword.jsp?ResetPassword=" + resetPassword;
            String subject = "Your Pulpkorn Password Reset Request";
            String text = "Go <a href='" + link + "'>here</a> to reset your password: " + link;
            if (Database.getInstance().hasUser(email) && Database.getInstance().requestPasswordReset(email, resetPassword)) {
                sendEmail(email, subject, text);
                return true;
            } 
            else {
                return false;
            }
        } 
        catch (Exception ex) {
            System.out.println(ex);
            return false;
        }

    }
    
    public static boolean sendPurchaseReciept(String email, int pin, String movie, String theater, String time, int adults, int seniors, int children){
        String subject = "Pulpkorn Tickets Purchase Receipt";
        String text = "You order for movie "+movie+" at Pulpkorn has been completed.<br />Your ticket purchase has been logged.<br /><br />"+"Ticket infomation:<br />"+time+" at "+theater+"<br /><br />Adult tickets: "+adults+"<br />Children tickets: "+children+"<br />Senior tickets: "+seniors+"<br /><br />"+  "Your receipt PIN is: " + pin + ".<br />Please save this PIN to a safe place, as it can be used to refund your purchase.";
        Boolean success = sendEmail(email, subject, text);
        return success;
    }

    public static List<Movie> searchMovies(String title, String mpaaRating, String release) {
        try {
            List<Movie> temp = new LinkedList<>();
            if (title == null || title.isEmpty()) {
                temp.addAll(Database.getInstance().getAllMovies());
            }
            else {
                URL url = new URL(BASE_URL + "/movies.json?apikey=" + API_KEY + "&q=" + title);
                JSONObject json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
                JSONArray array = (JSONArray) json.get("movies");
                for (Object obj : array) {
                    Movie movie = Database.getInstance().getMovieById((String) ((JSONObject) obj).get("id"));
                    if (movie != null) {
                        temp.add(movie);
                    }
                }
            }
            List<Movie> movies = new LinkedList<>();
            for (Movie movie : temp) {
                boolean add = true;
                if (mpaaRating != null && !mpaaRating.equals("All") && !mpaaRating.equals(movie.getMpaaRating())) {
                    add = false;
                }
                if (release != null && !release.equals("All")) {
                    Date now = new Date();
                    Date releaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(movie.getReleaseDate());
                    if (release.equals("Current") && !now.after(releaseDate)) {
                        add = false;
                    }
                    if (release.equals("Upcoming") && !now.before(releaseDate)) {
                        add = false;
                    }
                }
                if (add) {
                    movies.add(movie);
                }
            }
            return movies;
        } 
        catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public static boolean sendEmail(String to, String subject, String text) {
        try {
            Properties properties = System.getProperties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            MimeMessage message = new MimeMessage(Session.getDefaultInstance(properties, new Authenticator() {

                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(GMAIL_EMAIL, GMAIL_PASSWORD);
                }

            }));
            message.setFrom("admin@pulpkorn.com");
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(text, "UTF-8", "html");
            Transport.send(message);
            return true;
        } 
        catch (Exception ex) {
            System.out.println(ex);
            return false;
        }
    }
    
    public static boolean subscribe(String email) {
        if (Database.getInstance().subscribe(email)) {
            sendEmail(email, "Thank You for Subscribing to Pulpkorn Newsletters",
                    "You can look forward to our newsletters which release at the end of each month.");
            return true;
        }
        else {
            return false;
        }
    }

}
