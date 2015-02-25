package org.dogwood.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
    
    private static final String URL = "jdbc:mysql://localhost:3306/dogwood?zeroDateTimeBehavior=convertToNull";
    private static final String USER = "root", PASSWORD = "root";
    
    private Connection connection;

    public DB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");       
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } 
        catch (Exception ex) {
           System.out.println(ex);
        }
    }
    
    public void close() {
        try {
            connection.close();
        } 
        catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
}