package org.dogwood;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class GoogleMoviesScraper {
    
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
    
}