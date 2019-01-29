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
	<script src="scripts/Dashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>Exam Vetting Comittee Dashboard</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>
            
            <a id="back" href="ExamVettingComitteeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <a id="logout" href="index.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-lock"></i></a>

	</div>
        
        <br>
        
        <%
            DeadLine deadline = new DeadLine();
            %><center><h2> <%
            out.print("Your Deadline to complete your exams is: " + deadline.deadline("Exam Vetting Comittee"));
            %></h2></center> <%
            %>
            <br>
             <%
            DatabaseConnection db = new DatabaseConnection();
            String[][] exam = db.getExamLists("Exam Vetting Comittee");
            
            
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
        <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="alerting(this)">
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
    
    
    <!-- 
            REFACTORED CODE - due to the modals on each of the 3 Dashboards all
            displaying the same content, just differing depending on which dash
            board has loaded, i have refractored this functionality into the Modal
            class by calling the returnModal function and then this code is placed
            into all 3 of the dashboards to cut out on alot of repeated code.
        -->
    <%
            Modal displayModal = new Modal();
            out.print(displayModal.returnModal());
        %>
    
    <%
            FileDownload download = new FileDownload();
            if ((request.getParameter("modalExamIDHidden") != null))
            {
                String dowloadExamID = request.getParameter("modalExamIDHidden");
            
                if (download.download(dowloadExamID) == true)
                {
                    System.out.println("Success!");
                    %><script>alert("Exam Successfully Downloaded - You find the downloaded exam in your downloads folder")</script><%
                }
                else
                {
                   System.out.println("Failure!");
                }
            }
        %>
    
       
    
    
    
    
    
    </body>
</html>
