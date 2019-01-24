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



public boolean download(String examID){

DatabaseConnection db = new DatabaseConnection();

    String SQL = "SELECT ExamPaper,Title,ModuleCode FROM exam WHERE ExamID= '" + examID + "';"; 


    Connection conn = db.getConn();
    java.sql.PreparedStatement statement = null;
    InputStream input = null;
    FileOutputStream output = null;
    ResultSet result = null;

    try {

        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Connecting...");

       
        System.out.println("Connection successful..\nNow creating query...");

        statement = conn.prepareStatement(SQL);
  
        result = statement.executeQuery();

        while (result.next()) {
        String fileName = result.getString("ModuleCode") + "-" + result.getString("Title");
        
        String home = System.getProperty("user.home");
        System.out.println(home);
        output = new FileOutputStream(new File(home + "/Downloads/" + fileName +".docx"));
        System.out.println("Getting file please be patient..");

        


            input = result.getBinaryStream("ExamPaper"); //get it from col name
            int r = 0;


            while ((r = input.read()) != -1) {
                output.write(r);

            }
        }
        System.out.println("File writing complete !");
        return true;

    } catch (ClassNotFoundException e) {
        System.err.println("Class not found!");
        e.printStackTrace();
        return false;
    } catch (SQLException e) {
        System.err.println("Connection failed!");   
        e.printStackTrace();
        return false;
    } catch (FileNotFoundException e) {
        System.err.println("File not found!");
        e.printStackTrace();
        return false;
    } catch (IOException e) {
        System.err.println("File writing error..!");
        e.printStackTrace();
        return false;
    }finally {
        if(result != null){
            try {
                input.close();
                output.flush();
                output.close();
                statement.close();
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

