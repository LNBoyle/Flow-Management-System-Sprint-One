<%-- 
    Document   : CommentAndFileHandler
    Created on : 25-Jan-2019, 04:16:16
    Author     : liamboyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="ExamWebApp.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    
           <%
               
           DatabaseConnection db = new DatabaseConnection();
                if ((db.setComment(Integer.parseInt(request.getParameter("hiddenID")), Integer.parseInt(LoginCheckClass.userID),request.getParameter("comment"))) == true)
                {
                    out.println("Success!");
                    out.println(
                            "<center>"
                            +"<form method = 'POST' action = 'revisionServlet' enctype = 'multipart/form-data'>"
                            + "<input type='hidden' name='hiddenID' value='"+request.getParameter("hiddenID")+"'/>"
                            + "<input type='file' name='ExamPaper' size='50'/>" 
                            + "<button type = 'submit' name = 'ReturnFromSubmit'>Return</button>"
                            + "</form>"
                            + "</center>"
                    );
                }
                else
                {
                    out.println("Failure!");
                }
            
        %>
   
</html>
