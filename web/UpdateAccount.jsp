<%-- 
    Document   : UpdateAccount
    Created on : 24-Jan-2019, 19:15:38
    Author     : cyrilvarghese & AbbasLawal
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
        <h1>Update a new account</h1>
        

  <form method = "POST"> 
  User ID of the Account you want to update:  
  <br>  
  <input type="Int" name="userid" value="">
  <br>
  First name:
  <br>
  <input type="text" name="firstname" value="">
  <br>
  Surname:<br>
  <input type="text" name="surname" value="">
  <br>
  Email:<br>
  <input type="text" name="email" value="">
  <br>
  Password:<br>
  <input type="password" name="password" value="">
  <br> <br>
    <button type = "submit" name = "Update">Update/Change Account</button>
  </form> 
        
    <% 
         String u = " ";
         String f = " ";
         String s = " ";
         String e = " ";
         String p = " ";
        
     if (request.getParameter("Update") != null)
     {
        
        u = request.getParameter("userid");     
      
        f = request.getParameter("firstname");
      
        s = request.getParameter("surname");
      
        e = request.getParameter("email");
        p = request.getParameter("password");
        

    db.UpdateAccount(u,f,s,e,p);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>
