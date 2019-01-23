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
    <body>
        <div class="topnav">
            <a class="active" href="#">Home</a>
            <a href="#Lock">Lock</a>
            <a href="#Back">Back</a>
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>


       
          

    

        <div class="options" style="font-size:30px;float:left;list-style-type: none;padding: 40px 30px;">
            <form method = "POST">

                <button type = "ViewAccount" name = "ViewAccount"> View Account Info</button>
                <li><button type = "CreateAccount" name = "CreateAccount"> Create Account</button></li>
                <li><button type = "UpdateAccount" name = "UpdateAccount"> Update Account</button></li>
            </form>	
        </div>


        <div class="NotificationBox" style="float:right;background-color: lightgrey;width:500px;height:300px; border:black;padding: 25px;margin: 25px;"> </div>



        
        
        <%
            if ((request.getParameter("ViewAccount") != null)) {
               
                String[][] ViewUsers = new String[db.UserRows][5];
                ViewUsers = db.getViewUsers();
          
            for (int i = 0; i < ViewUsers.length; i++)
            { 
                for (int j = 0; j < ViewUsers[i].length; j++)
                    { 
                    out.print(ViewUsers[i][j] + " "); 
                    }
             
                
            }
            }
        %>




        <%
            if ((request.getParameter("CreateAccount") != null)) {
                
            }
        %>

        <%
            if ((request.getParameter("UpdateAccount") != null)) {

            }
        %>








    </body>
</html>
