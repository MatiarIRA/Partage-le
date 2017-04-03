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
            conn = DriverManager.getConnection("jdbc:oracle:thin:@oracle.iro.umontreal.ca:1521:orcl", "daiglerh", "erhp105D");

            if(conn != null) {
                System.out.println("Connection successfull");
            }
        }

        catch(java.sql.SQLException e) {
            System.out.println("Connection failed");
            e.printStackTrace();
        }
    }

    public static void loadDB() throws SQLException {
        Statement statement = conn.createStatement();

        try {
            ResultSet rs = statement.executeQuery("@oracle.sql");
            while(rs.next())
            {
                System.out.println("Database load successfull");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if (statement != null) { statement.close(); }
        }
    }


    public static String listTables() throws SQLException {
        Statement statement = conn.createStatement();
        String result = null;

        try {
            ResultSet rs = statement.executeQuery("SELECT TABLE_NAME FROM user_tables");
            while(rs.next())
            {
                result = rs.getString("table_name");
                System.out.println(result);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if (statement != null) { statement.close(); }
        }

        return result;
    }

}
