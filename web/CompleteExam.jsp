<%-- 
    Document   : CompleteExam
    Created on : 30-Jan-2019, 00:42:15
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String strid = request.getParameter("ExamIDHidden");
            int id = Integer.parseInt(strid);
            DatabaseConnection db = new DatabaseConnection();  
            db.markExamCompleted(id);  
        %>    
       
        <script>
            window.location.href = "StaffDash.jsp";
        </script>    
    </body>
</html>
