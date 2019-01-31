<%-- 
    Document   : LocalExamOfficerDashboard
    Created on : 23-Jan-2019, 12:26:31
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
        <link href="css/LocalExamOfficer.css" rel="stylesheet" type="text/css" >
        <title>Welcome Local Exam Officer</title>
    </head>
    
         <div id="header">
            <nav class="navbar navbar-light">
                     <%
                    String user = db.getName(LoginCheckClass.userID);
                    out.print("<span class='navbar-brand'>Welcome " + user + "</span>");
                %>
            </nav>
            
            <a id="back" href="LocalExamOfficerDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>

	</div>


       <br><input type="button" onclick="location.href='ViewAccounts.jsp';" value="View Account" /></br>
       <br><input type="button" onclick="location.href='DeleteAccount.jsp';" value="Delete Account" /></br>
       <br> <input type="button" onclick="location.href='CreateAccount.jsp';" value="Create Account" />  </br> 
       <br> <input type="button" onclick="location.href='UpdateAccount.jsp';" value="Update Account" /></br>
       <br> <input type="button" onclick="location.href='Assignexam.jsp';" value="Assign Exams" /></br>
       <br> <input type="button" onclick="location.href='SetDeadline.jsp';" value="Set Deadline" /></br>
       <br> <input type="button" onclick="location.href='AssignRole.jsp';" value="Assign Role" /></br>
                
       

                

                
                
                
        </div>


       

<br>

        
        

         
                
    






    
</html>
