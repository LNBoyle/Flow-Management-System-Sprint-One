<%-- 
    Document   : ViewExam
    Created on : 24-Jan-2019, 15:41:41
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="scripts/SchoolOfficeDashboard.js"></script>
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
        <a id="back" onclick="goBack()" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
                     <script>
function goBack() {
  window.history.back();
}
</script>
            <a id="home" href="SchoolOfficeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
           <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>

	</div>
            <br>
            
            
            <%
                
            LoginCheckClass loggedin = new LoginCheckClass();
            out.print(loggedin.userID);
            
            %>
            <br>
        </div>  
        
       <% 
           String[][] exam = db.getExamList("Iain Murray");      
       %>
       <div>
            <table>
                <tr>
                    <th class="headerTable">Exam ID</th>
                    <th class="headerTable">Title</th>
                    <th class="headerTable">Module Coordinator</th>
                    <th class="headerTable">Module Code</th>
                </tr>
                <%
                    int i = 0;
                    for(i=0; i < exam.length; i++)
                    {
                        %>
                        <tr>
                            <td> 
                            <% 
                                out.println(exam[i][0]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][1]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][2]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][3]); 
                                %> 
                            </td>
                            
                            <td>
                                <form action="commentExam.jsp" method="POST">
                                    <button type ="hidden" style="display: none;" </button>
                                 </form> 
                                <form action="commentExam.jsp" method="POST">
                                    <button type = "submit" name = "commentExam" value =<% out.print(exam[i][0]); %>> Comment</button>
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
