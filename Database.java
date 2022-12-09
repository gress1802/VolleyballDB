import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

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

    /*
     * Search for player by ID
     */
    public ResultSet searchPlayerID(String playerID) throws SQLException{
        //sanitizing the database inputs
        String query = "SELECT Player.FirstName, Player.LastName, Player.Number, Player.AgeGroup FROM Player WHERE Player.PlayerID = ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1,playerID); //fill in the first ? encountered with playerID
        ResultSet results = stmt.executeQuery();
        return results;
   } 

   /*
    * Search for coach by ID
    */
   public ResultSet searchcoachID(String coachID) throws SQLException{
    //sanitizing the database inputs
    String query = "SELECT Coach.FirstName, Coach.LastName, Coach.Salary FROM Coach WHERE Coach.CoachID = ?";
    PreparedStatement stmt = connection.prepareStatement(query);
    stmt.setString(1,coachID); //fill in the first ? encountered with coachID
    ResultSet results = stmt.executeQuery();
    return results;
} 

    /*
     * For running queries
     */
    public ResultSet runQuery(String query) throws SQLException{
        java.sql.PreparedStatement stmt = connection.prepareStatement(query); //prepared statement is for ensuring that the query string is well formed
        ResultSet results = stmt.executeQuery(); //this is the result set of the query
        return results;
    }

    public void insertPlayer(String s) throws SQLException{
        String[] split = s.split(" "); //splitting the string into the values we want
        String sql = "INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,split[0]);
        stmt.setString(2,split[1]);
        stmt.setString(3,split[2]);
        stmt.setString(4,split[3]);
        stmt.executeUpdate();

    }

    public void insertCoach(String s) throws SQLException{
        String[] split = s.split(" ");
        String sql = "INSERT INTO Coach (Salary, LastName, FirstName) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, split[0]);
        stmt.setString(2, split[1]);
        stmt.setString(3, split[2]);
        stmt.executeUpdate();

    }

    public void updateSalary(String s) throws SQLException{
        String[] split = s.split(" ");
        String sql = "UPDATE Coach SET Salary = ? WHERE Coach.FirstName = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(2, split[0]); //firstname first salary second
        stmt.setString(1, split[1]);
        stmt.executeUpdate();
    }

    public void deletePlayer(String s) throws SQLException{
        String sql = "DELETE FROM Player WHERE Player.FirstName = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,s);
        stmt.executeUpdate();
    }

    public void deleteCoach(String s) throws SQLException{
        String sql = "DELETE FROM Coach WHERE Coach.FirstName = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,s);
        stmt.executeUpdate();
    }
}