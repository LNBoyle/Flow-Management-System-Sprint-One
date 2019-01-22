<%-- 
    Document   : SchoolOfficeDashboard
    Created on : 22-Jan-2019, 19:48:41
    Author     : Sebastian
--%>

<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <br>
        <% 
            String[][] completedExams = new String[db.CompletedRows][10];
            completedExams = db.getCompletedExams();
            //out.println(Arrays.deepToString(db.getCompletedExams()));
            for (int i = 0; i < completedExams.length; i++){ 
                for (int j = 0; j < completedExams[i].length; j++){ 
                    out.print(completedExams[i][j] + " "); 
                }
                %>
                <br>
                <%
            } 
        
        
        
        %>
        <br>
    </body>
</html>
