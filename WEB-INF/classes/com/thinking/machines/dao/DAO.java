package com.thinking.machines.dao;
import java.util.*;
import java.sql.*;
import java.io.*;

public class DAO {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/styletwodb","styletwo",""); // hardcoded password shouldn't be here.
    }
    
}