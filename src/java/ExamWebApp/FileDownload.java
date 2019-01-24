/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

/**
 *
 * @author lboyl
 */

    import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileDownload {



public void download(){

DatabaseConnection db = new DatabaseConnection();
    String SQL = "SELECT Title, File FROM `EXAM` WHERE `ExamID`=10023002"; 

    Connection conn = db.getConn();
    java.sql.PreparedStatement smt = null;
    InputStream input = null;
    FileOutputStream output = null;
    ResultSet rs = null;

    try {

        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Connecting...");

       
        System.out.println("Connection successful..\nNow creating query...");

        smt = conn.prepareStatement(SQL);
  
        rs = smt.executeQuery();
       while (rs.next()) {
        String fileName = rs.getString("Title");
        String home = System.getProperty("user.home");
        output = new FileOutputStream(new File(home + "/Downloads/"+fileName+".docx"));
        System.out.println("Getting file please be patient..");

       

            input = rs.getBinaryStream("File"); //get it from col name
            int r = 0;


            while ((r = input.read()) != -1) {
                output.write(r);

            }
        }
        System.out.println("File writing complete !");

    } catch (ClassNotFoundException e) {
        System.err.println("Class not found!");
        e.printStackTrace();
    } catch (SQLException e) {
        System.err.println("Connection failed!");   
        e.printStackTrace();
    } catch (FileNotFoundException e) {
        System.err.println("File not found!");
        e.printStackTrace();
    } catch (IOException e) {
        System.err.println("File writing error..!");
        e.printStackTrace();
    }finally {
        if(rs != null){
            try {
                input.close();
                output.flush();
                output.close();
                smt.close();
                conn.close();
            } catch (SQLException e) {
                System.err.println("Connot close connecton!");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
    }

}

}
