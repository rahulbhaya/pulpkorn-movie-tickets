package org.dogwood;

import java.util.ArrayList;
import java.util.List;

public class Movie {
    
    public final String name;
    
    public final List<String> times;
    
    public Movie(String name) {
        this.name = name;
        times = new ArrayList<>();
    }
    
}