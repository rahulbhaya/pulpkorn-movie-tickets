package org.dogwood;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class Dogwood {
    
    public static final String API_KEY = "gs2spwmu9dt6uqnaxhsadxp6";
    
    public static final String BASE_URL = "http://api.rottentomatoes.com/api/public/v1.0";
    
    public static List<MovieTheater> getTheaters(String near) {
        try {
            Document doc = Jsoup.connect("http://www.google.com/movies?near=" + near).get();
            List<MovieTheater> theaterList = new ArrayList<>();
            for (Element theater : doc.select(".theater")) {
                String movieTheaterName = theater.select("h2.name").text();
                String movieTheaterAddress = theater.select("div.info").text();
                MovieTheater mt = new MovieTheater(movieTheaterName, movieTheaterAddress);
                for (Element movie : theater.select(".showtimes .movie")) {
                    Movie m = new Movie(movie.select("div.name").text());
                    for (Element time : movie.select(".times > span")) {
                        m.times.add(time.text());
                    }
                    mt.movies.add(m);
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
    
    public static JSONObject getMovieInfo(String movieId) {
        try {
            URL url = new URL(BASE_URL + "/movies/" + movieId + 
                    ".json?apikey=" + API_KEY);
            return (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
        } 
        catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
    
}