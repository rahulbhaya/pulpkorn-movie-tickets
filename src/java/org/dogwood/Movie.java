package org.dogwood;

public class Movie {
    
    public final String id, title, mpaaRating, releaseDate, synopsis, image;
    
    public final int runtime;
    
    public Movie(String id, String title, String mpaaRating, int runtime, String releaseDate, String synopsis, String image) {
        this.id = id;
        this.title = title;
        this.mpaaRating = mpaaRating;
        this.runtime = runtime;
        this.releaseDate = releaseDate;
        this.synopsis = synopsis;
        this.image = image;
    }
    
}