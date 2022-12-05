import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database{
    /*
     * Load the SQL drive (JDBC (Java Database Connector))
     */

    private String url = "jdbc:sqlite:C:\\Users\\ag98\\OneDrive\\Desktop\\CS364\\Final Project\\VolleyballDatabase.db"; //file path
    private Connection connection;


    //singleton pattern
    private static final Database INSTANCE = new Database(); //this is making sure there are not multiple instances of the database

    private Database(){
        //nothing
    }

    public static Database getInstance(){
        return INSTANCE;
    }
    //end of singleton pattern

    public void connect() throws SQLException{
        connection = DriverManager.getConnection(url);
    }

    public void disconnect() throws SQLException{
        connection.close();
    }
}