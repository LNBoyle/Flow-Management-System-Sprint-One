<%-- 
    Document   : LocalExamOfficerDashboard
    Created on : 23-Jan-2019, 12:26:31
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
        <title>Assign </title>
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
    <body>
        <div id="menuButtons">
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'ViewAccounts.jsp';" value="View Account" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'DeleteAccount.jsp';" value="Delete Account" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'CreateAccount.jsp';" value="Create Account" />  </br> 
            <br><button class="btn btn-lg btn-actuallyblue" onclick="location.href = 'UpdateAccount.jsp';" value="Update Account" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'Assignexam.jsp';" value="Assign Exams" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'SetDeadline.jsp';" value="Set Deadline" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'AssignRole.jsp';" value="Assign Role" /></br>
            <br><button class="btn btn-lg btn-actuallyblue"  onclick="location.href = 'ViewExamProgress.jsp';" value="View Exam Progress" /></br>

        </div>
    </body>




    <br>














</html>
