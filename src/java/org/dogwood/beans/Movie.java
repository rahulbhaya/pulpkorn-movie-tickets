package org.dogwood.beans;

import java.io.Serializable;

public class Movie implements Serializable {

    private String id, title, mpaaRating, releaseDate, synopsis, image;

    private int runtime;

    public Movie() {
    }

    public Movie(String id, String title, String mpaaRating, int runtime, String releaseDate, String synopsis, String image) {
        this.id = id;
        this.title = title;
        this.mpaaRating = mpaaRating;
        this.runtime = runtime;
        this.releaseDate = releaseDate;
        this.synopsis = synopsis;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMpaaRating() {
        return mpaaRating;
    }

    public void setMpaaRating(String mpaaRating) {
        this.mpaaRating = mpaaRating;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

}
