import controller.PartageDataBase;
import view.MainPanel;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Main {

    public static void main(String[] args) throws SQLException {
        //new MainPanel();
        PartageDataBase dataBase = new PartageDataBase();

        dataBase.listTables();

    }
}
