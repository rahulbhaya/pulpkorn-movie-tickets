package org.dogwood;

import java.util.List;

public class Test {
    
    public static void main(String[] args) {
        for (Movie movie : Dogwood.searchMovies("H")) {
            System.out.println(movie.getTitle());
            
        }
        Database.getInstance().register("name","name", "ADMIN");
    }
    
}