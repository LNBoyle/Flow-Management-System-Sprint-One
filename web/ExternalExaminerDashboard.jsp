<%-- 
    Document   : ExternalModDashboard
    Created on : 22-Jan-2019, 19:49:22
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page import="ExamWebApp.DeadLine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </tr>
        <%
        for(int i=0;i<exam.length;i++){
        %>
        <tr class='clickable-row' data-toggle="modal">
                <td><%out.print(exam[i][0]);%></td>
                <td><%out.print(exam[i][1]);%></td>
                <td><%out.print(exam[i][2]);%></td>
                <td><%out.print(exam[i][3]);%></td>
            </tr>
        <%
        }
        %>
    </table>
    </body>
</html>
