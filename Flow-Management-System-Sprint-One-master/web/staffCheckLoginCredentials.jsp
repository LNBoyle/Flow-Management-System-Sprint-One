<%@page language="java" import="ExamWebApp.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        //testPackage.MyClass.checkStaffLogin(email, password);
        
        LoginCheckClass login = new LoginCheckClass();
        
        if(login.checkStaffLogin(email, password) == true){
            out.println("logged in");
            %><br><%
                out.println("Welcome " + email);
            %><br><%    
        }else{
            out.println("not logged in");
        }
        
        %>
        
    </body>
</html>
