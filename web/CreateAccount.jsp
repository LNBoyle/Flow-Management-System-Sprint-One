<%-- 
    Document   : CreateAccount
    Created on : 24-Jan-2019, 13:43:14
    Author     : abbaslawal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<%@page import ="javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
               <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Back" />
    </head>
    <body>
        <h1>Create a new account</h1>
        

  <form method = "POST"> 
  UserId:    
  <input type="Int" name="userid" value="">
  First name:<br>
  <input type="text" name="firstname" value="">
  <br>
  Surname of Examiner:<br>
  <input type="text" name="surname" value="">
  <br>

  Email:<br>
  <input type="text" name="email" value="">
  <br>
  Password:<br>
  <input type="password" name="password" value="">
  <br> <br>
    <button type = "submit" name = "create">create</button>
  </form> 
        
    <% 
         String u = "123";
         String f = "Abbas";
         String s = "Lawal";

         String e = "a.lawal@dundee.ac.uk";
         String p = "AL1234";
        
     if (request.getParameter("create") != null)
     {

        u = request.getParameter("userid");     
    
        f = request.getParameter("firstname");

        s = request.getParameter("surname");

        e = request.getParameter("email");
        p = request.getParameter("password");
        

    db.CreateAccount(u,f,s,e,p);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>
