<%@page language="java" import="ExamWebApp.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
    </head>
    <body>
        
        <%
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        
        
        LoginCheckClass login = new LoginCheckClass();
        if(login.checkStaffLogin(userEmail, userPassword)){
            String[] userRoles = LoginCheckClass.roles;
            %>
            <script>
                window.location = "InternalModDashboard.jsp";
            </script>
            <%
        }else{
            %>
            <script>
                alert("Incorrect Login Credentials");
                window.location = "index.jsp";
            </script>
            <%
        }
        
        
        
        %>
        
    </body>
</html>