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
  <br>
  <input type="Int" name="userid" value="">
  <br>
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
        
        
    </body>
</html>
