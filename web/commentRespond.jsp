<%@page language="java" import="ExamWebApp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Comment Respond</title>
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
        <%
            String strid = request.getParameter("respondComment");
            int id = Integer.parseInt(strid);
        %>
        <%-- Fetch and print exam name and the associated comment --%>
    <center>
            <h1>Exam: <% out.print(db.getExamModule(id)); %> <br>
                Comment: <% out.print(db.getExamComment(id)); %> </h1><br>
            <%-- Form for user to input response to comment and button to sign their response --%>
            <form action="responseHandler.jsp" method = "POST">
                Your Response: <input type = "textarea" name = "response" size = 150px required> <br>
                <input type="hidden" name="hiddenID" value="<% out.print(id);%>"/>
                <br>
                <button class="btn btn-lg btn-actuallyblue" type = "submit" name = "responseSubmit"> Sign & Submit</button>
            </form>
        
    </center>


    </body>
</html>
