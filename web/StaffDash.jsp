<%-- 
    Document   : StaffDash
    Created on : 22-Jan-2019, 15:18:17
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet" type="text/css" href="StaffDashCSS.css">
        <title>Staff: Exam Setter</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
             <form method=POST">
                <input type="button" class="btn-blue" value="Upload" name="Upload New Exam" onclick="document.forms[0].action = 'UploadExam.jsp'; return true;" />
                
                <button class="btn-blue" type="EditExam" name="edit">Edit Current Exam</button>
                <button class="btn-blue" type="ViewExam" name="view">View Current Exam</button>
             </form>
        </div>        
    </body>
</html>
