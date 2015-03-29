package org.dogwood.database;

public class Test {
    
    public static void main(String[] args) {
        Database db = new Database();
        System.out.println(db.register("Test", "Test", "Test", "Test", "NORMAL"));
        System.out.println(db.login("Test", "Test"));
    }
    
}