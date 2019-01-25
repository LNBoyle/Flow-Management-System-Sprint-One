<%@page language="java" import="ExamWebApp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/SchoolOfficeDashboard.css" rel="stylesheet">
        <title>Feedback</title>
    </head>
    <body>
         <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>
            <a id="back" href="" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="InternalModDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <a id="logout" href="index.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-lock"></i></a>

	</div>
        
        <%
           String strid = request.getParameter("ExamIDHidden");
           int id = Integer.parseInt(strid);
        %>
        
        
        <%-- Form for user to input comment and button to sign it --%>
    <center>
        Exam: <% out.print(db.getExamModule(id)); %> <br>
        <div id="commentArea">
            <form method = "POST"  action="CommentAndFileHandler.jsp" >
                Your Comment: <input type = "textarea" name = "comment" size = 150px required> <br>
                <br>
                <input type="hidden" name="hiddenID" value="<% out.print(id); %>"/>

                <br>
                <button type = "submit" name = "commentSubmit"> Sign & Submit</button>
            </form>
        </div>
        </center>
 
    </body>
</html>
