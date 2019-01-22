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
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet reslt = null;
    
    public void connect()throws SQLException{
 
        String password = "8326.at8.6238";
        String username = "18agileteam8";
        String address = "jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam8db";
        
        try{
            conn = DriverManager.getConnection(address, username, password);
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("select * from user");
            while(reslt.next()){
                System.out.println(reslt.getString("FirstName") + ", " + reslt.getString("Surname"));
            }
        }catch(SQLException exc){
        } finally{
            if(reslt !=null){
                reslt.close();
            }
            
            if(stmt !=null){
                stmt.close();
            }
            
            if(conn !=null){
                conn.close();
            }
        }
    }  
    
}
