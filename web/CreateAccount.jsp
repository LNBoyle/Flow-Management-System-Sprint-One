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
        

  <form> 
  UserId:    
  <input type="Int" name="userid" value="">
  First name:<br>
  <input type="text" name="first" value="">
  <br>
  Surname of Examiner:<br>
  <input type="text" name="surname" value="">
  <br>
  Role:<br>
  <input type="text" name="role" value="">
  <br>
  Email:<br>
  <input type="text" name="email" value="">
  <br>
  Password:<br>
  <input type="password" name="password" value="">
  <br> <br>
  <button type="button" name="create"  onclick="alert('Account Created')">Create</button>
  </form> 
        
    <% 
      String u, f, s, r, e, p = " "; 
      
        u = request.getParameter("userid");     
        f = request.getParameter("firstname");
        s = request.getParameter("surname");
        r = request.getParameter("role");
        e = request.getParameter("email");
        p = request.getParameter("password");
        

    db.CreateAccount(u,f,s,r,e,p);
    
    if (db.CreateAccount()) == true 
    {
    
    %>
        alert('Account Created')
     <%   
    }

   
    %>
        
        
    </body>
</html>
