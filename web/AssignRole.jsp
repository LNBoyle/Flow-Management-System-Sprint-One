<%-- 
    Document   : AssignRole
    Created on : 28-Jan-2019, 16:05:10
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
        <title>Assign Role</title>
               <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Back" />
    </head>
    <body>
        <h1>Assign Role </h1>
        

  <form method = "POST"> 
 
  <br>  
  <input type="text" name="userid" value=""  placeholder="Enter A User ID">
    <br> 
  
  
  
  <input type="checkbox" name="ExamSetter" value=""> Exam Setter<br>
  <input type="checkbox" name="InternalModerator" value="">Internal Moderator<br>
  <input type="checkbox" name="ExternalExaminer" value=""> External Examiner<br>
  <input type="checkbox" name="ExamVettingComittee" value="">Exam Vetting Comittee<br>
  <input type="checkbox" name="SchoolOffice" value="">School Office<br>
  <input type="checkbox" name="LocalExamOfficer" value="">Local Exam Officer<br>
   <br> 

  

    <button type = "submit" name = "Assign">Assign Roles</button>
  </form> 
        
    <% 

        
        
        
     if (request.getParameter("Assign") != null)
     {
        String userID;
        Boolean esCheck = false;
        Boolean imCheck = false;
        Boolean emCheck = false;
        Boolean evcCheck = false;
        Boolean soCheck = false;
        Boolean leoCheck = false;
        
        
        
        
         userID = (request.getParameter("userid")); 
         
         out.print(userID);
         
         if (request.getParameter("ExamSetter") != null)
         {
             esCheck = true;
             out.print(esCheck);
         }
         
         if (request.getParameter("InternalModerator") != null)
         {
             imCheck = true;
             out.print(imCheck);
         }
         
         if (request.getParameter("ExternalExaminer") != null)
         {
             emCheck = true;
             out.print(emCheck);
         }
         
         if (request.getParameter("ExamVettingComittee") != null)
         {
             evcCheck = true;
             out.print(evcCheck);
         }
         
         
         if (request.getParameter("SchoolOffice") != null)
         {
             soCheck = true;
             out.print(soCheck);
         }
         
         if (request.getParameter("LocalExamOfficer") != null)
         {
             leoCheck = true;
             out.print(leoCheck);
         }
         
     }
   
 

   

   
    %>
        
        
    </body>
</html>
