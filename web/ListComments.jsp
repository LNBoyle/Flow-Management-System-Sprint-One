<%-- 
    Document   : ListComments
    Created on : 30-Jan-2019, 11:27:24
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        
        <%
            String strid = request.getParameter("ListComments");
            int id = Integer.parseInt(strid);
        %>
        
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
        <form method="POST">
            <div id="header">
                <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
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
        </form>

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <% 
           String[][] comment = db.getAllExamComment(id);  
           String[][] comments = db.getAllResponse(id);
       %>
       
        <div>
                <table border="2">
                    <tr>
                        <td>Comment ID</td>
                        <td>Exam ID</td>
                        <td>Comment</td>
                        <td>Time Stamp</td>
                        <td>Response</td>
                        <td>Response Time Stamp</td>
                    </tr>
                    <%
                    int i = 0;
                    int j = 0;
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
                                    <% 
                                            out.println(comment[i][3]); 
                                            %> 
                                </td>
                                <%  for (j=0; j < comments.length; j++)
                        {%>
                                <td>
                                    <% 
                                        if (comment[i][0].equals(comments[j][0])) {
                                            out.println(comments[j][1]); 
                                        }
                                            %> 
                                </td>
                                <td>
                                    <% 
                                        if (comment[i][0].equals(comments[j][0])) {
                                            out.println(comments[j][2]); 
                                        }
                                            %> 
                                </td>
                            </tr>
                        <%
                            }
                        }
                            %>

                </table>
        </div>
                            
        
    </body>
</html>
