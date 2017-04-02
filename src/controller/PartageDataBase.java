package controller;
import oracle.jdbc.driver.OracleDriver;
import java.sql.*;

/**
 * Created by hansdaigle on 2017-04-01.
 */

public class PartageDataBase {
    static Connection conn = null;

    public PartageDataBase() {
        try {
            //conn = DriverManager.getConnection("jdbc:oracle:thin:@oracle.iro.umontreal.ca:1521:orcl", "daiglerh", "erhp105D");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@10.0.2.15:1521:orcl", "HR", "oracle");

            if(conn != null) {
                System.out.println("Connection successfull");
            }
        }

        catch(java.sql.SQLException e) {
            System.out.println("Connection failed");
            e.printStackTrace();
        }
    }

    public static ResultSet doQuery(String query){
        try{
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            return resultSet;
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }






}
