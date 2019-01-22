/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;
import java.sql.*;  
/**
 *
 * 
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

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
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
    
    //Function that returns the module code for a given exam
    public String getExamModule(int examID)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ModuleCode FROM exam WHERE ExamID = " + examID + ";");
            
            //return string from query
            if (reslt.next())
            {
                return reslt.getString(1);   
            }            
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    //Function that returns the comment for a given exam and staff role
    public String getExamComment(int commentID)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Comment FROM comment WHERE CommentID = " + commentID + ";");
            
            //return string from query
            if (reslt.next())
            {
                return reslt.getString(1);   
            }            
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    //Function that adds a response to a comment in the database
    public boolean setCommentResponse(int commentID, String newResponse)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE comment SET Response = '" + newResponse + "' WHERE CommentID = " + commentID + ";");
            
            //return true if success, false otherwise
            if (success != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return false;
    }
}
