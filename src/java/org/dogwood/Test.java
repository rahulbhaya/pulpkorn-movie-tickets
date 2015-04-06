package org.dogwood;

import java.util.List;

public class Test {
    
    public static void main(String[] args) {
        Database db = new Database();
        System.out.println(db.register("Test", "Test", "NORMAL"));
        System.out.println(db.login("Test", "Test"));
        List<MovieTheater> theaters = Dogwood.getTheaters("11747");
        /*for (MovieTheater theater : theaters) {
            System.out.println(theater.name);
            System.out.println(theater.address);
            System.out.println("\nMovies:\n");
            for (Movie movie : theater.movies) {
                System.out.print(movie.name + " ");
                for (String time : movie.times) {
                    System.out.print(time);
                }
                System.out.println("\n");
            }
        }*/
        System.out.println(theaters);
        System.out.println(Dogwood.getMovieInfo("770672122").get("title"));
    }
    
}