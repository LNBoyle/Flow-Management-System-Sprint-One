/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author liamboyle
 */
@WebServlet("/solutionServlet")
@MultipartConfig(maxFileSize = 16177215)
public class FileUploadSolutions extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields

        InputStream examSolutionStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part examPart = request.getPart("ExamSolution");

        if (examPart != null) {
            // obtains input stream of the upload file
            examSolutionStream = examPart.getInputStream();

        }
        DatabaseConnection db = new DatabaseConnection();
        Connection conn = db.getConn(); // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // constructs SQL statement
            String sql = "INSERT INTO EXAM (ExamPaper) values (?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            if (examSolutionStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, examSolutionStream);
            }
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
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }
}
