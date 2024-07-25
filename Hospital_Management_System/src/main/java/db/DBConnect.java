package db;

import java.sql.Connection;

public class DBConnect {

    public static Connection con;

    public static Connection getCon()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
            System.out.println("Connection Successful");

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;

    }
}