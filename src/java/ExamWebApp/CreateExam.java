package ExamWebApp;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
  
            // constructs SQL statement
            String sql = "INSERT INTO EXAM (Title, School, ModuleCoordinator, ModuleCode, ExamType, ExamPeriod, ExamLevel, Semester, Year, Status,  ExamPaper, SolutionsPaper, ExamPaperFileExtension, SolutionsPaperFileExtension) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1,request.getParameter("Title"));
            statement.setString(2,request.getParameter("School"));
            statement.setString(3,"10004");
            statement.setString(4,request.getParameter("ModuleCode"));
            statement.setString(5,request.getParameter("ExamType"));
            statement.setString(6,request.getParameter("ExamPeriod"));
            statement.setString(7,request.getParameter("ExamLevel"));
            statement.setString(8,"2");
            statement.setString(9,"2019");
            statement.setString(10,"New");
            if (examPaperStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(11, examPaperStream);
                statement.setBlob(12, examSolutionStream);
            }
            statement.setString(13, examPart.getContentType());
            statement.setString(14, solutionPart.getContentType());
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next())
                {                    
                    int newID = rs.getInt(1);
                    db.createAssignedExam(newID, request.getParameter("ModuleCode"), request.getParameter("ExamPeriod"), request.getParameter("ExamLevel"), Integer.parseInt(LoginCheckClass.userID));
                }
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
          
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/StaffDash.jsp").forward(request, response);
        }
        
     
    }
}

