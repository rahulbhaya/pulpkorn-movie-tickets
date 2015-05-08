package org.dogwood;

import java.io.InputStreamReader;
import java.net.URL;
import static org.dogwood.Dogwood.API_KEY;
import static org.dogwood.Dogwood.BASE_URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DatabaseUploader {

    public static void main(String[] args) {
        JSONObject json;
        URL url;
        try {
            url = DatabaseUploader.class.getResource("/org/dogwood/helptopics.json");
            json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray helptopics = (JSONArray) json.get("helptopics");
            for (Object helptopic : helptopics) {
                Database.getInstance().addHelp((JSONObject) helptopic);
            }
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            url = DatabaseUploader.class.getResource("/org/dogwood/faqs.json");
            json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray faqs = (JSONArray) json.get("faqs");
            for (Object faq : faqs) {
                Database.getInstance().addFAQ((JSONObject) faq);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            url = new URL(BASE_URL + "/lists/movies/in_theaters.json?apikey=" + API_KEY);
            json = (JSONObject) JSONValue.parse(new InputStreamReader(url.openStream()));
            JSONArray movies = (JSONArray) json.get("movies");
            for (Object movie : movies) {
                Database.getInstance().addMovie((JSONObject) movie);
                Dogwood.uploadTrailer((String) ((JSONObject) movie).get("id"));
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
                Database.getInstance().addMovie((JSONObject) movie);
                Dogwood.uploadTrailer((String) ((JSONObject) movie).get("id"));
            }
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            Document doc = Jsoup.connect("http://www.cinemablend.com/news.php").get();
            for (Element newsArticle : doc.select(".nnicontent")) {
                Elements divs = newsArticle.children();
                String title = divs.get(0).text();
                String description = divs.get(1).text();
                String link = "http://www.cinemablend.com" + divs.select("a").attr("href");
                String image = newsArticle.siblingElements().get(0).select("img").attr("src");
                Database.getInstance().addNewsArticle(title, description, link, image);
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        Database.getInstance().register("TheAdmin", "Admin@Admin.com", "admin", "ADMIN");
    }

}
