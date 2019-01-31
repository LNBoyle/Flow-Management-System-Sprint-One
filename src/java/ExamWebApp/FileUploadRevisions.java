//package ExamWebApp;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//
///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
///**
// *
// * @author lboyl
// */
//@WebServlet("/revisionServlet")
//@MultipartConfig(maxFileSize = 16177215)
//public class FileUploadRevisions extends HttpServlet {
//
//    /**
//     *
//     * @param request
//     * @param response
//     * @throws ServletException
//     * @throws IOException
//     */
//    @Override
//    protected void doPost(HttpServletRequest request,
//            HttpServletResponse response) throws ServletException, IOException {
//        // gets values of text fields
//
//        InputStream examPaperStream = null; // input stream of the upload file
//        InputStream examSolutionStream = null;
//        // obtains the upload file part in this multipart request
//        Part examPart = request.getPart("ExamPaper");
//        Part solutionPart = request.getPart("ExamSolution");
//        if (examPart != null && solutionPart == null) {
//            // obtains input stream of the upload file
//            examPaperStream = examPart.getInputStream();
//
//            DatabaseConnection db = new DatabaseConnection();
//            Connection conn = db.getConn(); // connection to the database
//            String message = null;  // message will be sent back to client
//
//            try {
//                // constructs SQL statement
//
//                String sql = "update exam set ExamPaper = ? where ExamID = " + request.getParameter("hiddenID");
//                PreparedStatement statement = conn.prepareStatement(sql);
//
//                if (examPaperStream != null) {
//                    // fetches input stream of the upload file for the blob column
//                    statement.setBlob(1, examPaperStream);
//                }
//                // sends the statement to the database server
//                int row = statement.executeUpdate();
//                if (row > 0) {
//                    message = "File uploaded and saved into database";
//                }
//            } catch (SQLException ex) {
//                message = "ERROR: " + ex.getMessage();
//            } finally {
//
//                // sets the message in request scope
//                request.setAttribute("Message", message);
//
//               
//                // forwards to the message page
//                switch (LoginCheckClass.userRole) {
//                    case "Exam Vetting Comittee":
//                        getServletContext().getRequestDispatcher("/ExamVettingComitteeDashboard.jsp").forward(request, response);
//                        break;
//                    case "External Examiner":
//                        getServletContext().getRequestDispatcher("/ExternalExaminerDashboard.jsp").forward(request, response);
//                        break;
//                    case "Internal Moderator":
//                        getServletContext().getRequestDispatcher("/InternalModDashboard.jsp").forward(request, response);
//                        break;
//                    default:
//                        break;
//                }
//            }
//
//        } else if (solutionPart != null && examPart == null) {
//            // obtains input stream of the upload file
//            examSolutionStream = solutionPart.getInputStream();
//
//            DatabaseConnection db = new DatabaseConnection();
//            Connection conn = db.getConn(); // connection to the database
//            String message = null;  // message will be sent back to client
//
//            try {
//                // constructs SQL statement
//
//                String sql = "update exam set SolutionsPaper = ? where ExamID = " + request.getParameter("hiddenID");
//                PreparedStatement statement = conn.prepareStatement(sql);
//
//                if (examSolutionStream != null) {
//                    // fetches input stream of the upload file for the blob column
//                    statement.setBlob(1, examSolutionStream);
//                }
//                // sends the statement to the database server
//                int row = statement.executeUpdate();
//                if (row > 0) {
//                    message = "File uploaded and saved into database";
//                }
//            } catch (SQLException ex) {
//                message = "ERROR: " + ex.getMessage();
//            } finally {
//
//                // sets the message in request scope
//                request.setAttribute("Message", message);
//
//                // forwards to the message page
//                switch (LoginCheckClass.userRole) {
//                    case "Exam Vetting Comittee":
//                        getServletContext().getRequestDispatcher("/ExamVettingComitteeDashboard.jsp").forward(request, response);
//                        break;
//                    case "External Examiner":
//                        getServletContext().getRequestDispatcher("/ExternalExaminerDashboard.jsp").forward(request, response);
//                        break;
//                    case "Internal Moderator":
//                        getServletContext().getRequestDispatcher("/InternalModDashboard.jsp").forward(request, response);
//                        break;
//                    default:
//                        break;
//                }
//            }
//        } else if (examPart != null && solutionPart != null) {
//            examSolutionStream = solutionPart.getInputStream();
//            examPaperStream = examPart.getInputStream();
//
//            DatabaseConnection db = new DatabaseConnection();
//            Connection conn = db.getConn(); // connection to the database
//            String message = null;  // message will be sent back to client
//
//            try {
//                // constructs SQL statement
//
//                String sql = "update exam set SolutionsPaper = ?, ExamPaper = ?  where ExamID = " + request.getParameter("hiddenID");
//                PreparedStatement statement = conn.prepareStatement(sql);
//
//                if (examSolutionStream != null && examPaperStream != null) {
//                    // fetches input stream of the upload file for the blob column
//                    statement.setBlob(1, examSolutionStream);
//                    statement.setBlob(2, examPaperStream);
//                }
//                // sends the statement to the database server
//                int row = statement.executeUpdate();
//                if (row > 0) {
//                    message = "File uploaded and saved into database";
//                }
//            } catch (SQLException ex) {
//                message = "ERROR: " + ex.getMessage();
//            } finally {
//
//                // sets the message in request scope
//                request.setAttribute("Message", message);
//                switch (LoginCheckClass.userRole) {
//                    case "Exam Vetting Comittee":
//                        getServletContext().getRequestDispatcher("/ExamVettingComitteeDashboard.jsp").forward(request, response);
//                        break;
//                // forwards to the message page
//                    case "External Examiner":
//                        getServletContext().getRequestDispatcher("/ExternalExaminerDashboard.jsp").forward(request, response);
//                        break;
//                    case "Internal Moderator":
//                        getServletContext().getRequestDispatcher("/InternalModDashboard.jsp").forward(request, response);
//                        break;
//                    default:
//                        break;
//                }
//
//            }
//        } else {
//            switch (LoginCheckClass.userRole) {
//                case "Exam Vetting Comittee":
//                    getServletContext().getRequestDispatcher("/ExamVettingComitteeDashboard.jsp").forward(request, response);
//                    break;
//                case "External Examiner":
//                    getServletContext().getRequestDispatcher("/ExternalExaminerDashboard.jsp").forward(request, response);
//                    break;
//                case "Internal Moderator":
//                    getServletContext().getRequestDispatcher("/InternalModDashboard.jsp").forward(request, response);
//                    break;
//                default:
//                    break;
//            }
//        }
//    }
//
//}
