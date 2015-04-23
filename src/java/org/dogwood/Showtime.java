package org.dogwood;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Showtime implements Serializable {
    
    private String name;
    
    private List<String> times;
    
    public Showtime() {}
    
    public Showtime(String name) {
        this.name = name;
        times = new ArrayList<>();
    }
    
    public String timesToString() {
        StringBuilder builder = new StringBuilder();
        for (String time : times) {
            builder.append("\"" + time + "\", ");
        }
        return builder.substring(0, builder.lastIndexOf(", "));
    }
    
    public String toString() {
        return "{\"name\":\"" + name + "\", \"times\":[" + timesToString() + "]}";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getTimes() {
        return times;
    }

    public void setTimes(List<String> times) {
        this.times = times;
    }
    
}