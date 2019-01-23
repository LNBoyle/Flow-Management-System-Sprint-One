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
    String SQL = "SELECT File FROM `EXAM` WHERE `ExamID`=18947"; //Here I mistakenly wrote 'FILANAME' here instead of a 'PICTURE'

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

        output = new FileOutputStream(new File("/Users/lboyl/Downloads/Paedo.docx"));
        System.out.println("Getting file please be patient..");

        while (rs.next()) {

            input = rs.getBinaryStream("File"); //get it from col name
            int r = 0;

/*
*there I've tried with array but nothing changed..Like this :
* byte[] buffer = new byte[2048];
* int r = 0;
* while((r = input.read(buffer)) != -1){
*        out.write(buffer,0,r);}
*/

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

