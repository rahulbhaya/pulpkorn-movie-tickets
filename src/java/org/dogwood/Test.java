package org.dogwood;

import java.util.List;

public class Test {
    
    public static void main(String[] args) {
        Database db = Database.getInstance();
        /*List<Movie> movies = db.getUpcomingMovies();
        for (Movie movie : movies) {
            System.out.println(movie.title);
        }*/
        System.out.println(Database.getInstance().getMovieById("771270966").getTitle());
        System.out.println(Database.getInstance().getMovieByTitle("Furious 7").getTitle());
        System.out.println(Database.getInstance().changePassword("Test", "Test", "Test"));
        db.close();
    }
    
}