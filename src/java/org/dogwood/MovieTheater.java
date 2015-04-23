package org.dogwood;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MovieTheater implements Serializable {
    
    private String name, address;
    
    private List<Showtime> movies;
    
    public MovieTheater() {}
    
    public MovieTheater(String name, String address) {
        this.name = name;
        this.address = address;
        movies = new ArrayList<>();
    }
    
    public String toString() {
        return "{\"name\":\"" + name + "\", \"address\":\"" + address + "\", \"movies\":" + movies + "}";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Showtime> getMovies() {
        return movies;
    }

    public void setMovies(List<Showtime> movies) {
        this.movies = movies;
    }
    
}