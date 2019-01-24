<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Exam</title>
    </head>
    <body>
        <center>
            <h1>Upload Exam</h1>
            <form method="POST" action="uploadfile" enctype="multipart/form-data">
                <table border="0">
                    <tr>
                        <td>Exam ID: </td>
                        <td><input type="text" name="ExamID" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Title: </td>
                        <td><input type="text" name="Title" size="50"/></td>
                    </tr>
                    <tr>
                        <td>School: </td>
                        <td><input type="text" name="School" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Module Coordinator: </td>
                        <td><input type="text" name="ModuleCoordinator" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Module Code: </td>
                        <td><input type="text" name="ModuleCode" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Exam Type: </td>
                        <td><input type="text" name="ExamType" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Exam Period: </td>
                        <td><input type="text" name="ExamPeriod" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Exam Level: </td>
                        <td><input type="text" name="ExamLevel" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Date Created: </td>
                        <td><input type="text" name="DateCreated" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Author ID: </td>
                        <td><input type="text" name="AuthorID" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Deadline: </td>
                        <td><input type="text" name="Deadline" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Status: </td>
                        <td><input type="text" name="Status" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Assigned To: </td>
                        <td><input type="text" name="AssignedTo" size="50"/></td>
                    </tr>
                    <tr>
                        <td>File Upload: </td>
                        <td><input type="file" name="File" size="50"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Save">
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        
        
    </body>
</html>
