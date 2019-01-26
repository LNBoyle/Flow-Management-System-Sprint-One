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
    
        <div class="topnav">
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
           
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>


       <br><input type="button" onclick="location.href='ViewAccounts.jsp';" value="View Account" /></br>
       <br><input type="button" onclick="location.href='DeleteAccount.jsp';" value="Delete Account" /></br>
       <br> <input type="button" onclick="location.href='CreateAccount.jsp';" value="Create Account" />  </br> 
       <br> <input type="button" onclick="location.href='Assignexam.jsp';" value="Update Account" /></br>
       <br> <input type="button" onclick="location.href='Assignexam.jsp';" value="Assign Exams" /></br>
        <br> <input type="button" onclick="location.href='SetDeadline.jsp';" value="Set Deadline" /></br>
                
       

                

                
                
                
        </div>


       

<br>
            <%
            DeadLine deadline = new DeadLine();
            out.print("Your Deadline to complete your exams is: " + deadline.deadline());
            
            %>

        
        

         
                
    






    
</html>
