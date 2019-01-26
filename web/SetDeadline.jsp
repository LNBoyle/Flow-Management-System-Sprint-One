<%-- 
    Document   : SetDeadline
    Created on : 26-Jan-2019, 15:40:44
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
  Role involved with the deadline :    
  <input type="text" name="role" value="">

      Deadline you want to set:    
  <input type="text" name="date" value="">
    <button type = "submit" onclick="alert(Account Deleted)"  name = "setdeadline">set deadline</button>
  </form> 
        
    <% 
         String role = "test";
         String date = "11-12-13";
        
     if (request.getParameter("setdeadline") != null)
     {

        role = request.getParameter("role"); 
        out.println(role);
        date = request.getParameter("date"); 
        out.println(date);
        

        db.SetDeadline(role,date);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>