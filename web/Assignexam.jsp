<%-- 
    Document   : Assignexam
    Created on : 23-Jan-2019, 14:51:32
    Author     : Cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Exam</title>
    </head>
    <body>
        
        <div class="topnav">
            <a class="active" </a>
            <button type = "Home" name = "Home"> Home</button>
            <button type = "Lock" name = "Lock"> Lock</button>
            <button type = "Back" name = "Back"> Back</button>
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>
        <h1><center>Assign Exams</center></h1>
        
        
  <form>
            
            
  Type of Examiner:<br>
  <input type="text" name="forename" value="">
  <br>
  Forename of Examiner:<br>
  <input type="text" name="forename" value="">
  <br>
  Surname of Examiner:<br>
  <input type="text" name="Surname" value="">
  <br>
  Name of Exam:<br>
  <input type="text" name="examname" value="">
  <br>
   Exam Number:<br>
  <input type="text" name="examnumber" value="">
  <br> <br>
  <button type="button" onclick="alert('Exam Assigned')">Assign</button>
  </form> 
        

      
    </body>
    
    
    
        <%
            if ((request.getParameter("Home") != null)) {
        %>
       <jsp:forward page="LocalExamOfficerDashboard.jsp"></jsp:forward>
        <%
            }
        %>
        
            <%
            if ((request.getParameter("Lock") != null)) {
        %>
       <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
</html>