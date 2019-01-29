<%-- 
    Document   : StaffDash
    Created on : 22-Jan-2019, 15:18:17
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>

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
        <title>Exam Setter Dashboard</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>     

        <div id="header">
            <nav class="navbar navbar-light">
                <span class="navbar-brand">Welcome..</span>
            </nav>
            <a id="back" href="StaffDash.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>
        </div>
            <div id="bodyWrapper">
        <%
            DeadLine deadline = new DeadLine();
            %><center><h2> <%
            out.print("Your Deadline to complete your exams is: " + deadline.deadline("Exam Setter"));
            %></h2></center> <%
            %>
            <br>




        <div>
            <form method=POST">
                <input type="button" class="btn btn-lg" value="Upload New Exam" name="Upload New Exam" onclick="openPage('FileUpload.jsp')" />

                <button class="btn btn-lg" type="EditExam" name="edit">Edit Current Exam</button>
                <input type="button" class="btn btn-lg" value="View Exam" name="View Exam" onclick="openPage('ViewComments.jsp')" />
            </form>


        </div>     
            </div>
    </body>

    <script type="text/javascript">
        function openPage(pageName)
        {
            window.location.href = pageName;
        }
    </script>

</html>
