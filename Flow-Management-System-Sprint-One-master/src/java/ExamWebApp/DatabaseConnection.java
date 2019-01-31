/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;
import java.sql.*;  
/**
 *
 * @author Sebastian
 */
public class DatabaseConnection {
    
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet reslt = null;
    
    public DatabaseConnection(){
        String password = "8326.at8.6238";
        String username = "18agileteam8";
        String address = "jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam8db";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }
        
        try{
            conn = DriverManager.getConnection(address, username, password);
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
    }

    public boolean checkUser(String email, String password){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("select UserID from user where Email = '" + email + "' and Password = '" + password + "';");
            
            if(reslt.next()){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
    } 
}
