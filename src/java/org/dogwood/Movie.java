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
    
    private String timesToString() {
        StringBuilder builder = new StringBuilder();
        for (String time : times) {
            builder.append("\"" + time + "\", ");
        }
        return builder.substring(0, builder.lastIndexOf(", "));
    }
    
    public String toString() {
        return "{\"name\":\"" + name + "\", \"times\":[" + timesToString() + "]}";
    }
    
}