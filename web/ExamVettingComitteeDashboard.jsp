<%-- 
    Document   : ExamVettingComittee
    Created on : 22-Jan-2019, 20:10:15
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page import="ExamWebApp.DeadLine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="scripts/SchoolOfficeDashboard.js"></script>
        <link href="css/SchoolOfficeDashboard.css" rel="stylesheet">
        <title>Exam Vetting Comittee Dashboard</title>
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>

            <a id="home" href="SchoolOfficeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <a id="logout" href="index.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-lock"></i></a>

	</div>
        
        <br>
        
        <%
            DeadLine deadline = new DeadLine();
            out.print("Your Deadline to complete your exams is: " + deadline.deadline());
            
            %>
            <br>
             <%
            DatabaseConnection db = new DatabaseConnection();
            String[][] exam = db.getExamLists();
            
            
            %>
            <table>
        <tr>
            <th class="headerTable">Exam ID</th>
            <th class="headerTable">Exam Title</th>
            <th class="headerTable">Module Code</th>
            <th class="headerTable">Module Coordinator</th>
            <th class="headerTable">Internal Moderator</th>
            <th class="headerTable">External Examiner</th>
        </tr>
        <%
        for(int i=0;i<exam.length;i++){
        %>
        <tr class='clickable-row' data-toggle="modal">
                <td><%out.print(exam[i][0]);%></td>
                <td><%out.print(exam[i][1]);%></td>
                <td><%out.print(exam[i][2]);%></td>
                <td><%out.print(exam[i][3]);%></td>
                <td><%out.print(exam[i][4]);%></td>
                <td><%out.print(exam[i][5]);%></td>

            </tr>
        <%
        }
        %>
    </table>
    </body>
</html>
