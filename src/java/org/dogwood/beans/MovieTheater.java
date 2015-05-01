package org.dogwood.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MovieTheater implements Serializable {

    private String name, address;

    private List<Showtimes> showtimes;

    public MovieTheater() {
    }

    public MovieTheater(String name, String address) {
        this.name = name;
        this.address = address;
        showtimes = new ArrayList<>();
    }

    public String toString() {
        return "{\"name\":\"" + name + "\", \"address\":\"" + address + "\", \"movies\":" + showtimes + "}";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Showtimes> getShowtimes() {
        return showtimes;
    }

    public void setShowtimes(List<Showtimes> showtimes) {
        this.showtimes = showtimes;
    }

}
