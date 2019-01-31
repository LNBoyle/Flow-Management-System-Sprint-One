<%-- 
    Document   : ViewExamProgress
    Created on : 31-Jan-2019, 19:01:46
    Author     : callumscott
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
        <title>View Exams</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
    </body>
    <form method="POST">
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
        
       <% 
           String[][] comment = db.getExamListProgressLEO();  
       %>
       <div>
            <table border="2">
                <tr>
                    <td>Exam ID</td>
                    <td>Module Code</td>
                    <td>Title</td>
                    <td>View Progress</td>
                </tr>
                <%
                    int i = 0;
                    for(i=0; i < comment.length; i++)
                    {
                        %>
                        <tr>
                            <td> 
                            <% 
                                out.println(comment[i][0]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(comment[i][1]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(comment[i][2]); 
                                %> 
                            </td>
                            
                            <td>
                                <form action="ViewProgress.jsp" method="POST">
                                    <button type = "submit" name = "ViewProgress" value =<% out.print(comment[i][0]); %>> View</button>
                                 </form> 
                            </td>
                            
                            
                        </tr>
                        <%
                            
                    }
                   %>
            </table>
       </div>
    </form>
</html>
