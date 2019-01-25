package ExamWebApp;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class CreateExam extends HttpServlet {   
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
         
        InputStream examPaperStream = null; // input stream of the upload file
        InputStream examSolutionStream = null;
        // obtains the upload file part in this multipart request
        Part examPart = request.getPart("ExamPaper");
        Part solutionPart = request.getPart("ExamSolution");
        if (examPart != null) {
            // prints out some information for debugging
            System.out.println(examPart.getName());
            System.out.println(examPart.getSize());
            System.out.println(examPart.getContentType());
             
            // obtains input stream of the upload file
            examPaperStream = examPart.getInputStream();
            examSolutionStream = solutionPart.getInputStream();
        }
               DatabaseConnection db = new DatabaseConnection();
        Connection conn = db.getConn(); // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
  
 Date date = new Date();
 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
 String creationDate = formatter.format(date);
            // constructs SQL statement
            String sql = "INSERT INTO EXAM (Title, School, ModuleCode, ExamType, ExamPeriod, ExamLevel, DateCreated,  ExamPaper, SolutionsPaper) values (?, ?, ?, ?, ?, ?, ?, ?, ? )";
            PreparedStatement statement = conn.prepareStatement(sql);        
            statement.setString(1,request.getParameter("Title"));
            statement.setString(2,request.getParameter("School"));
            statement.setString(3,request.getParameter("ModuleCode"));
            statement.setString(4,request.getParameter("ExamType"));
            statement.setString(5,request.getParameter("ExamPeriod"));
            statement.setString(6,request.getParameter("ExamLevel"));
             statement.setString(7,creationDate);
            if (examPaperStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, examPaperStream);
                statement.setBlob(9, examSolutionStream);
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
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        
     
    }
}
