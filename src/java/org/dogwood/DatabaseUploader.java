package org.dogwood;

import java.io.InputStreamReader;
import java.net.URL;
import static org.dogwood.Dogwood.API_KEY;
import static org.dogwood.Dogwood.BASE_URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class DatabaseUploader {
    
    public static void main(String[] args) {
        Database db = new Database();
        JSONObject json;
        URL url;
        try {
            url = new URL(BASE_URL + "/lists/movies/in_theaters.json?apikey=" + API_KEY);
            json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray movies = (JSONArray) json.get("movies");
            for (Object movie : movies) {
                db.addMovie((JSONObject) movie);
            }
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            url = new URL(BASE_URL + "/lists/movies/upcoming.json?apikey=" + API_KEY);
            json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray movies = (JSONArray) json.get("movies");
            for (Object movie : movies) {
                db.addMovie((JSONObject) movie);
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}