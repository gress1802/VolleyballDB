import java.sql.SQLException;

public class Volleyball {
    public static void main(String[] args){
        Database db = Database.getInstance(); //the constructor is private so we must access the database through this method
        try {
            db.connect();
        } catch (SQLException e) {
            System.out.println("Database connection failed..");
            e.printStackTrace();
        }
        System.out.println("Database Connection Success");
    }
}
