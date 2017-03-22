package udem.ift2935;

import oracle.jdbc.driver.OracleDriver;
import java.sql.*;

public class Main {

    public static void main(String[] args) {
        connection conn = null;
        try{
            conn = DriverManager.getConnection(jdbc:oracle:thin:@oracle.iro.umontreal.ca:1521:orcl
                    , "daiglerh", "erhp105D");
        }catch(SQLException e){
            e.printStackTrace();
        }

        if(conn){
            System.out.println("Connection successfull");

            String query = "SELECT table_name FROM user_tables";
            try{
                Statement statement = con.createStatement();
                ResultSet resultSet = statement.executeQuery(query);

                while(resultSet.next()){
                    String result = resultSet.getString(1);
                    System.out.println(result)
                }


            }
            catch (SQLException e){
                e.printStackTrace();
            }




        }else{
            System.out.println("Erreur de connection");
        }

    }
}
