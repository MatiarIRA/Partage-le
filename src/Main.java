import controller.PartageDataBase;
import view.MainPanel;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Main {

    public static void main(String[] args) {

        new MainPanel();
        PartageDataBase dataBase = new PartageDataBase();


        ResultSet resultSet =  dataBase.doQuery("SELECT table_name FROM user_tables;");
        try{
            while(resultSet.next()){
                String result = resultSet.getString(1);
                System.out.println(result);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }

    }
}
