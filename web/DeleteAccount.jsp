<%-- 
    Document   : DeleteAccount
    Created on : 26-Jan-2019, 15:18:58
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
  UserId of account you want to delete:    
  <input type="Int" name="userid" value="">
    <button type = "submit" onclick="alert(Account Deleted)"  name = "delete">create</button>
  </form> 
        
    <% 
         String u = "123";

        
     if (request.getParameter("delete") != null)
     {

        u = request.getParameter("userid");     
      

        

        db.DeleteAccount(u);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>