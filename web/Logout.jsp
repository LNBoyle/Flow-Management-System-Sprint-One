<%-- 
    Document   : Logout
    Created on : 29-Jan-2019, 01:22:13
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
          LoginCheckClass logout = new LoginCheckClass();  
          logout.logout();  
        %>    
        
        <script>
            window.location.href = "index.jsp";
        </script>    
    </body>
</html>
