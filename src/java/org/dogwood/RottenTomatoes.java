package org.dogwood;

import java.io.InputStreamReader;
import java.net.URL;
import org.json.simple.JSONValue;

public class RottenTomatoes {
    
    public static final String API_KEY = "gs2spwmu9dt6uqnaxhsadxp6";
    
    public static final String BASE_URL = "http://api.rottentomatoes.com/api/public/v1.0";
    
    public static String getMovieInfo(String movieId) {
        try {
            URL url = new URL(BASE_URL + "/movies/" + movieId + 
                    ".json?apikey=" + API_KEY);
            return JSONValue.parse(new InputStreamReader(url.openStream())).toString();
        } 
        catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }
    
}