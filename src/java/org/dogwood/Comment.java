package org.dogwood;

import java.io.Serializable;

public class Comment implements Serializable {
    
    private String userName, movieId, message, dateCommented;
    
    public Comment() {}
    
    public Comment(String userName, String movieId, String message, String dateCommented) {
        this.userName = userName;
        this.movieId = movieId;
        this.message = message;
        this.dateCommented = dateCommented;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDateCommented() {
        return dateCommented;
    }

    public void setDateCommented(String dateCommented) {
        this.dateCommented = dateCommented;
    }
    
}