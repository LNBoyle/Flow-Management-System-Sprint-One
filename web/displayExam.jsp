<%@page language="java" import="ExamWebApp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EFMS</title>
    </head>
    <body>
        Exam: <% out.print(db.getExamModule(1)); %> <br>
        
        <%-- Check response on submit and update the database. Tell user if successful. --%>
        <%
            String[] comments = db.getAllExamComment(1);
            int i = 0;
            while (i < comments.length)
            {
                out.print(comments[i]);
                i++;
            }
        %>
    </body>
</html>
