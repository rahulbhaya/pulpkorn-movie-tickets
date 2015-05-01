package org.dogwood.beans;

import java.io.Serializable;

public class CastMember implements Serializable {

    private String name, movieId;

    public CastMember() {
    }

    public CastMember(String name, String movieId) {
        this.name = name;
        this.movieId = movieId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

}
