package org.dogwood;

import java.util.ArrayList;
import java.util.List;

public class MovieTheater {
    
    public final String name, address;
    
    public final List<Showtime> movies;
    
    public MovieTheater(String name, String address) {
        this.name = name;
        this.address = address;
        movies = new ArrayList<>();
    }
    
    public String toString() {
        return "{\"name\":\"" + name + "\", \"address\":\"" + address + "\", \"movies\":" + movies + "}";
    }
    
}