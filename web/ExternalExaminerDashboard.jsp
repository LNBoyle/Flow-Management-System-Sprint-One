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
        <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="scripts/ExternalExaminerDashboard.js"></script>
        <link href="css/SchoolOfficeDashboard.css" rel="stylesheet">
        <title>External Examiner Dashboard</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
         <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>
             
             <a id="back" href="" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="SchoolOfficeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <a id="logout" href="index.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-lock"></i></a>

	</div>
        
        <br>
        
        <%
            DeadLine deadline = new DeadLine();
            %><center><h2> <%
            out.print("Your Deadline to complete your exams is: " + deadline.deadline());
            %></h2></center> <%
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
            <th class="headerTable">Exam Vetting Comittee</th>
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
    
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="ExternalExaminerDashboard.jsp">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="modalHeader" class="modal-title">Exam Details</h4>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" name="modalExamIDHidden" id="modalExamIDHidden" value = ' ' />
                        <input type="hidden" name="modalExamTitleHidden" id="modalExamTitleHidden" value = ' ' />	
                        <input type="hidden" name="modalModuleCodeHidden" id="modalModuleCodeHidden" value = ' ' />
                        <input type="hidden" name="modalModuleCoordinatorHidden" id="modalModuleCoordinatorHidden" value = ' ' />
                        <p id="modalExamID">Exam ID</p>
                        <p id="modalExamTitle">Exam Title</p>
                        <p id="modalModuleCode">Module Code</p>
                        <p id="modalModuleCoordinator">Module Coordinator</p>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="submit" name="DownloadExam" class="btn btn-default">Download Exam</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    
                </form>
                <form method="post" action="commentExam.jsp">
                     <input type="hidden" name="ExamIDHidden" id="ExamIDHidden" value = ' ' />
                 <button type ="submit" name ="commentExam" >Comment and Upload</button>
                </form>  
                </div>
            </div>
        </div>
    </div>
    
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
