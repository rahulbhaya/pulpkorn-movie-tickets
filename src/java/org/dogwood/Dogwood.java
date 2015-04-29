package org.dogwood;

import org.dogwood.beans.Showtimes;
import org.dogwood.beans.Movie;
import org.dogwood.beans.MovieTheater;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
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
        }
        catch (Exception ex) {
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
        } 
        catch (IOException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public static List<Movie> searchMovies(String title) {
        try {
            URL url = new URL(BASE_URL + "/movies.json?apikey=" + API_KEY + "&q=" + title);
            JSONObject json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray array = (JSONArray) json.get("movies");
            List<Movie> movies = new LinkedList<>();
            for (Object obj : array) {
                Movie movie = Database.getInstance().getMovieById((String) ((JSONObject) obj).get("id"));
                if (movie != null) {
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
    
}