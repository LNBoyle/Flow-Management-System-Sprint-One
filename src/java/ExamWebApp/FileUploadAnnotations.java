package ExamWebApp;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
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
@WebServlet("/revisionServlet")
@MultipartConfig(maxFileSize = 16177215)
public class FileUploadAnnotations extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields

        InputStream examPaperStream = null; // input stream of the upload file
        InputStream examSolutionStream = null;
        // obtains the upload file part in this multipart request
        Part examPart = request.getPart("ExamPaper");
        Part solutionPart = request.getPart("ExamSolution");
        if (examPart != null && solutionPart == null) {
            // obtains input stream of the upload file
            System.out.println(examPart.getContentType());
            examPaperStream = examPart.getInputStream();

            DatabaseConnection db = new DatabaseConnection();
            Connection conn = db.getConn(); // connection to the database
            String message = null;  // message will be sent back to client

            try {
                // constructs SQL statement

                String sql = "UPDATE comment SET AnnotatedExam = ?, ExamFileType = ? where CommentID = " + request.getParameter("hiddenID");
                PreparedStatement statement = conn.prepareStatement(sql);

                if (examPaperStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, examPaperStream);
                }
                statement.setString(2, examPart.getContentType());
                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
            } finally {

                // sets the message in request scope
                request.setAttribute("Message", message);

               
                // forwards to the message page
               
                        getServletContext().getRequestDispatcher("/homeHandler.jsp").forward(request, response);
                      
                }
            

        } else if (solutionPart != null && examPart == null) {
            // obtains input stream of the upload file
            examSolutionStream = solutionPart.getInputStream();

            DatabaseConnection db = new DatabaseConnection();
            Connection conn = db.getConn(); // connection to the database
            String message = null;  // message will be sent back to client

            try {
                // constructs SQL statement

                String sql = "UPDATE comment SET AnnotatedSolution = ?, SolutionFileType = ? where CommentID = " + request.getParameter("hiddenID");
                PreparedStatement statement = conn.prepareStatement(sql);

                if (examSolutionStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, examSolutionStream);
                }
                 statement.setString(2, solutionPart.getContentType());
                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
            } finally {

                // sets the message in request scope
                request.setAttribute("Message", message);

                // forwards to the message page
                getServletContext().getRequestDispatcher("/homeHandler.jsp").forward(request, response);
            }
        } else if (examPart != null && solutionPart != null) {
            examSolutionStream = solutionPart.getInputStream();
            examPaperStream = examPart.getInputStream();

            DatabaseConnection db = new DatabaseConnection();
            Connection conn = db.getConn(); // connection to the database
            String message = null;  // message will be sent back to client

            try {
                // constructs SQL statement

                String sql = "UPDATE comment SET AnnotatedExam = ?, AnnotatedSolution = ?, ExamFileType = ?,SolutionFileType = ? where CommentID = " + request.getParameter("hiddenID");
                PreparedStatement statement = conn.prepareStatement(sql);

                if (examSolutionStream != null && examPaperStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, examSolutionStream);
                    statement.setBlob(2, examPaperStream);
                }
                 statement.setString(3, examPart.getContentType());
                  statement.setString(4, solutionPart.getContentType());
                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
            } finally {

                // sets the message in request scope
                request.setAttribute("Message", message);
               getServletContext().getRequestDispatcher("/homeHandler.jsp").forward(request, response);

            }
        } else {
          getServletContext().getRequestDispatcher("/homeHandler.jsp").forward(request, response);
        }
    }

}
