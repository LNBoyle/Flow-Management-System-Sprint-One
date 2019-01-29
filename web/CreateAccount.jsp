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
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                <span class="navbar-brand">Welcome..</span>
            </nav>
            <a id="back" href="LocalExamOfficerDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>
        </div>
        
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
