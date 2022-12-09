import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Volleyball implements ActionListener{
    public static void main(String[] args) throws SQLException{
        Database db = Database.getInstance(); //the constructor is private so we must access the database through this method
        
        executeGui(db); 

    }
    
    
    /*
     * This is a block of code to print the whole result set (column) in a query
     */
    //try {
        //ResultSet results = db.runQuery("SELECT FirstName FROM Player");
        //while(results.next()){
            ////results.getString(1); this would get the first column
            //String name = results.getString("FirstName"); //get the results by the name of the column
            //a resultset can have multiple columns so make sure to show all the columns needed
            //System.out.println(name); //this prints out the whole column
        //}



    //} catch (SQLException e) {
        //System.out.println("Error in main!");
        //e.printStackTrace();
        //}
        
        public static void executeGui(Database db){
            
            
            
        JFrame frame = new JFrame("SQLite Volleyball Interface");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(1000, 1000);
            
        //creating west and east boxed
        Box westPanel = new Box(1);
        Box eastPanel = new Box(1);

        //Creating the JPanels
        JPanel northPanel = new JPanel();
        JPanel southPanel = new JPanel();
        
        //JLabels for the textfields
        JLabel queryLabel = new JLabel("Enter a Query/Update/Delete/Insert");
        JLabel searchPlayerLabel = new JLabel("Search Player by ID");
        JLabel searchCoachLabel = new JLabel("Search Coach by ID");

        //JTextFields
        JTextField queryField = new JTextField(20); //length 5
        JTextField playerField = new JTextField(5); //length 5
        JTextField coachField = new JTextField(5); //length 5
        
        //formatting the text fields so they do not expand like crazy
        playerField.setMaximumSize(new Dimension(200,20));
        coachField.setMaximumSize(new Dimension(200,20));
        
        //JButtons
        JButton connect = new JButton("Connect DB");
        JButton disconnect = new JButton("Disconnect DB");
        JButton sendQ = new JButton("Send Query");
        JButton addPlayer = new JButton("Add Player");
        JButton addCoach = new JButton("Add Coach");
        JButton deletePlayer = new JButton("Delete Player");
        JButton deleteCoach = new JButton("Delete Coach");
        JButton sendU = new JButton("Send Updated Salary");
        JButton resetButton = new JButton("Reset");
        JButton searchPlayer = new JButton("Send");
        JButton searchCoach = new JButton("Send");

        //create actionlisteners for buttons with the performed event
        
        
        
        //query stuff
        northPanel.add(queryLabel);
        northPanel.add(queryField);
        
        //Add JButton West
        westPanel.add(connect);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(disconnect);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(resetButton);
        westPanel.add(Box.createRigidArea(new Dimension(0,50))); //space
        westPanel.add(sendQ);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(addPlayer);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(addCoach);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(deletePlayer);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(deleteCoach);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        westPanel.add(sendU);
        westPanel.add(Box.createRigidArea(new Dimension(0,50)));
        
        //Add East
        //player
        eastPanel.add(searchPlayerLabel);
        eastPanel.add(playerField);
        eastPanel.add(searchPlayer);
        eastPanel.add(Box.createRigidArea(new Dimension(0,50)));
        //coach
        eastPanel.add(searchCoachLabel);
        eastPanel.add(coachField);
        eastPanel.add(searchCoach);
        eastPanel.add(Box.createRigidArea(new Dimension(0,50)));
        
        // Text Area at the Center
        JTextArea centerText = new JTextArea();
        JScrollPane scrollPane = new JScrollPane(centerText);
        
        //Adding layout to panel/fram
        frame.getContentPane().add(BorderLayout.SOUTH, southPanel);
        frame.getContentPane().add(BorderLayout.NORTH, northPanel);
        frame.getContentPane().add(BorderLayout.WEST, westPanel);
        frame.getContentPane().add(BorderLayout.EAST, eastPanel);
        frame.getContentPane().add(BorderLayout.CENTER, scrollPane);
        frame.setVisible(true);
        
        
        sendQ.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                String query = queryField.getText(); //this is the query
                try {
                    ResultSet results = db.runQuery(query);
                    String r = printResults(results);
                    centerText.setText(r);


                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                } 
            }
        });
        
        addPlayer.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.insertPlayer(queryField.getText());
                    centerText.setText("Successful");
                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                }
            }
        });

        addCoach.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.insertCoach(queryField.getText());
                    centerText.setText("Successful");
                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                }
            }
        });
        
        deletePlayer.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.deletePlayer(queryField.getText());
                    centerText.setText("Successful");
                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                }
            }
        });

        deleteCoach.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.deleteCoach(queryField.getText());
                    centerText.setText("Successful");
                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                }
            }
        });
        
        sendU.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.updateSalary(queryField.getText());
                    centerText.setText("Successful");
                } catch (SQLException e1) {
                    centerText.setText("Error");
                    e1.printStackTrace();
                }
            }
        });
        
        resetButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                centerText.setText("");
            }
        });
        
        searchPlayer.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    ResultSet players = db.searchPlayerID(playerField.getText());
                    String p = printResults(players);
                    centerText.setText(p);
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        });
        
        searchCoach.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    ResultSet coaches = db.searchcoachID(coachField.getText());
                    String c = printResults(coaches);
                    centerText.setText(c);
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        });

        connect.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.connect();
                    centerText.setText("Connected Successfully");
                } catch (SQLException e1) {
                    centerText.setText("Connection Error");
                    e1.printStackTrace();
                }
            }
        });

        disconnect.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                try {
                    db.disconnect();
                    centerText.setText("Disconnected Successfully");
                } catch (SQLException e1) {
                    centerText.setText("Disconnection Error");
                    e1.printStackTrace();
                }
            }
        });
    }
    
    public static String printResults(ResultSet results) throws SQLException{
        ResultSetMetaData rdmd = results.getMetaData(); //getting meta data of the resultset
        int numColumns = rdmd.getColumnCount();
        String ret = "";

        while(results.next()){ //looping through until nothing left
            for(int i = 1; i<=numColumns; i++){ //starting at 1 because sql
                String valueAtColumn = results.getString(i);
                ret = ret + rdmd.getColumnName(i) + ": " + valueAtColumn+" ";
            }
            ret = ret + "\n";
        }
        return ret;
    }
    
    
    
    
    public static void connectToDatabase(Database db){
        try {
            db.connect();
            System.out.println("Connected");
        } catch (SQLException e) {
            System.out.println("Database connection failed..");
            e.printStackTrace();
        }
    }
    
    public static void disconnectToDatabase(Database db){
        try{
            db.disconnect();
            System.out.println("Disconnected");
        }catch(SQLException e){
            System.out.println("Database disconnection failed");
            e.printStackTrace();
        }
    }
    
    /*
    * These are methods that return the queries that we will be using
    */
    public static ResultSet group1A(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT Club.Name, sum(Coach.Salary) AS TotalSalary FROM Coach JOIN CoachesFor JOIN Club ON Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID GROUP BY Club.ClubID ORDER BY TotalSalary desc;");
        return results;
    }
    
    public static ResultSet group1B(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT Player.FirstName AS fName, Player.LastName AS lName, Player.PlayerId AS pID, Team.Name FROM Player NATURAL JOIN PlaysForT NATURAL JOIN Team WHERE Team.Name LIKE 'A%' ORDER BY fName desc LIMIT 10;");
        return results;
    }
    
    public static ResultSet group2A(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT Player.AgeGroup AS Age, max(Coach.Salary) AS maxSalary, avg(Club.rank) FROM Club JOIN CoachesFor ON Club.ClubID = CoachesFor.ClubID JOIN Coach ON CoachesFor.CoachID = Coach.CoachID JOIN Coaches ON Coach.CoachID = Coaches.CoachID JOIN Player ON Coaches.PlayerID = Player.PlayerID GROUP BY Player.AgeGroup HAVING Age > 16");
        return results;
    }
    
    public static ResultSet group2B(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT DISTINCT a.FirstName, a.LastName, a.AgeGroup FROM (SELECT Player.FirstName, Player.LastName, Player.AgeGroup, Player.Number FROM Player WHERE Player.ageGroup >16 ) AS a LEFT JOIN (SELECT Player.FirstName, Player.LastName, Player.AgeGroup, Player.Number FROM Player WHERE Player.Number = 6 ) AS b");
        return results;
    }
    
    public static ResultSet group3A(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT DISTINCT fName, lName, minRank FROM (SELECT Player.FirstName AS fName, Player.LastName AS lName, min(Club.Rank) AS minRank FROM Club JOIN PartOfC JOIN Team JOIN PlaysForT JOIN Player ON Club.ClubID = PartOfC.ClubID AND PartOfC.TeamID = Team.TeamID AND Team.TeamID = PlaysForT.TeamID AND PlaysForT.PlayerID = Player.PlayerID WHERE State IN ('Wisconsin', 'Ohio', 'New York') GROUP BY Team.TeamID) ORDER BY minRank;");
        return results;
    }
    
    public static ResultSet group3B(Database db) throws SQLException{
        ResultSet results = db.runQuery("SELECT Coach.FirstName, Coach.LastName, Club.Name FROM Coach JOIN CoachesFor JOIN Club ON Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID UNION SELECT Player.FirstName, Player.LastName, Club.Name FROM Player JOIN Coaches JOIN Coach JOIN CoachesFor JOIN Club ON Player.PlayerID = Coaches.PlayerID AND Coaches.CoachID = Coach.CoachID AND Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID ORDER BY Club.Name");
        return results;
    }

    
    
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub
        
    }
}
