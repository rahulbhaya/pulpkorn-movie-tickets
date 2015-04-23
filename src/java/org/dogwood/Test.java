package org.dogwood;

import java.util.List;

public class Test {
    
    public static void main(String[] args) {
        Database db = new Database();
        /*List<Movie> movies = db.getUpcomingMovies();
        for (Movie movie : movies) {
            System.out.println(movie.title);
        }*/
        System.out.println(db.getMovieById("771270966").getTitle());
        System.out.println(db.getMovieByTitle("Furious 7").getTitle());
        System.out.println(db.changePassword("Test", "Test", "Test"));
        db.close();
    }
    
}