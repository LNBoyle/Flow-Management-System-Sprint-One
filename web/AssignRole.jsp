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
        int esCheck = 0;
        int imCheck = 0;
        int emCheck = 0;
        int evcCheck = 0;
        int soCheck = 0;
        int leoCheck = 0;
        
        
        
        
         userID = (request.getParameter("userid")); 
         
         out.print(userID);
         
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
         
         
         
         db.AssignRole(userID,esCheck, imCheck, emCheck, evcCheck, soCheck, leoCheck);
     }
   
 

   

   
    %>
        
        
    </body>
</html>
