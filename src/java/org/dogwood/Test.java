package org.dogwood;

public class Test {

    public static void main(String[] args) {
        Database.getInstance().register("TheAdmin", "admin@admin.com", "admin", "ADMIN");
    }
}
