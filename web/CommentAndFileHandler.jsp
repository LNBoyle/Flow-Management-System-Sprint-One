<%-- 
    Document   : CommentAndFileHandler
    Created on : 25-Jan-2019, 04:16:16
    Author     : liamboyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="ExamWebApp.*" %>

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
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
        <title>Annotation Upload</title>
    </head>
    <body>
           <div id="header">
            <nav class="navbar navbar-light">
                <span class="navbar-brand">Welcome..</span>
            </nav>
            <a id="back" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>
        </div>
           <%
               
           DatabaseConnection db = new DatabaseConnection();
           String commentID = null;
           int examID = Integer.parseInt(request.getParameter("hiddenID"));
                if ((db.setComment(examID, Integer.parseInt(LoginCheckClass.userID),request.getParameter("comment"))) == true)
                {
                    commentID = db.getCommentIDAnnotations(examID);
                    if(commentID == null){
                        out.println("Failure!");
                    }
                    out.println("Success!");
                    
                }
                else
                {
                    out.println("Failure!");
                }
            
        %>
        
                            <center>
                                Would you like to attach any annotated copies of exams?
                            <form method = 'POST' action = 'revisionServlet' enctype = 'multipart/form-data'>
                            <input type='hidden' name='hiddenID' value=' <% out.print(commentID); %> '/>
                            
                            EXAM<input type='file' name='ExamPaper' size='50'/>
                            
                            SOLUTIONS<input type='file' name='ExamSolution' size='50'/>
                            <button type = 'submit' name = 'ReturnFromSubmit'>Submit and Confirm</button>
                            </form>
                            </center>
                    
    </body>
</html>
