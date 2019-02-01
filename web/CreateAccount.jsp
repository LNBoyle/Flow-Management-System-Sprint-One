<%-- 
    Document   : CreateAccount
    Created on : 24-Jan-2019, 13:43:14
    Author     : abbaslawal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%@page import ="javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="scripts/Dashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>Create Account </title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <div id="header">
        <nav class="navbar navbar-light">
            <% DatabaseConnection db = new DatabaseConnection();
                String user = db.getName(LoginCheckClass.userID);
                out.print("<span class='navbar-brand'>Welcome " + user + "</span>");
            %>
        </nav>
        <a id="back" onclick="goBack()" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
        <form action="Logout.jsp" method="POST">
            <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
        </form>

    </div>
        
        <center>
        <h1>Create a new account</h1>
        

  <form method = "POST"> 
  User ID:    
  <br>
  <input type="Int" name="userid" value="">
  <br>
  First name:<br>
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
  <br> 
  
    <br>
  <input type="checkbox" name="ExamSetter" value=""> Exam Setter<br>
  <input type="checkbox" name="InternalModerator" value="">Internal Moderator<br>
  <input type="checkbox" name="ExternalExaminer" value=""> External Examiner<br>
  <input type="checkbox" name="ExamVettingComittee" value="">Exam Vetting Comittee<br>
  <input type="checkbox" name="SchoolOffice" value="">School Office<br>
  <input type="checkbox" name="LocalExamOfficer" value="">Local Exam Officer<br>
  <br> 
  
  
  
  
  <br>
    <button type = "submit" name = "create">create</button>
    
  </form> 
        

        
        
        
        
        
    <% 
         String u = "123";
         String f = "Abbas";
         String s = "Lawal";

         String e = "a.lawal@dundee.ac.uk";
         String p = "AL1234";
         
        int esCheck = 0;
        int imCheck = 0;
        int emCheck = 0;
        int evcCheck = 0;
        int soCheck = 0;
        int leoCheck = 0;
        
     if (request.getParameter("create") != null)
     {

        u = request.getParameter("userid");     
    
        f = request.getParameter("firstname");

        s = request.getParameter("surname");

        e = request.getParameter("email");
        p = request.getParameter("password");
        
        
         if (request.getParameter("ExamSetter") != null)
         {
             esCheck = 1;
             out.print(esCheck);
         }
         
         if (request.getParameter("InternalModerator") != null)
         {
             imCheck = 1;
             out.print(imCheck);
         }
         
         if (request.getParameter("ExternalExaminer") != null)
         {
             emCheck = 1;
             out.print(emCheck);
         }
         
         if (request.getParameter("ExamVettingComittee") != null)
         {
             evcCheck = 1;
             out.print(evcCheck);
         }
         
         
         if (request.getParameter("SchoolOffice") != null)
         {
             soCheck = 1;
             out.print(soCheck);
         }
         
         if (request.getParameter("LocalExamOfficer") != null)
         {
             leoCheck = 1;
             out.print(leoCheck);
         }
        
        
        
        
        
        
      

        
    db.CreateAccount(u,f,s,e,p,esCheck, imCheck, emCheck, evcCheck, soCheck, leoCheck);
    
     }
   
 

   

   
    %>
        
        </center>
    </body>
</html>
