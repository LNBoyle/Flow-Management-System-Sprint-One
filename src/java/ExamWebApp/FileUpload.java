package ExamWebApp;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lboyl
 */

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class FileUpload extends HttpServlet {   
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("file");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
               DatabaseConnection db = new DatabaseConnection();
        Connection conn = db.getConn(); // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
  
 
            // constructs SQL statement
            String sql = "INSERT INTO EXAM (ExamID, File) values (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);        
            statement.setInt(1,00045003);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
          
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
        
        FileDownload downSyn = new FileDownload();
        downSyn.download();
    }
}

