<%-- 
    Document   : SchoolOfficeDashboard
    Created on : 22-Jan-2019, 19:48:41
    Author     : Sebastian
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
	<script src="scripts/SchoolOfficeDashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>School Office</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>

            <a id="back" href="SchoolOfficeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>
         
	</div>
        
        <br>
        
    <%
        String[][] completedExams = new String[db.CompletedRows][14];
        completedExams = db.getCompletedExams();
    %>
        
    <table>
        <tr>
            <th hidden>Exam ID</th>
            <th class="headerTable">Exam Title</th>
            <th class="headerTable">School</th>
            <th hidden>Module Coordinator</th>
            <th class="headerTable">Module Code</th>
            <th class="headerTable">Exam Type</th>
            <th class="headerTable">Exam Sitting</th>
            <th hidden>Exam Level</th>
            <th hidden>Semester</th>
            <th hidden>Year</th>
        </tr>
        <%
        for(int i=0;i<db.CompletedRows;i++){
        %>
            <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="alerting(this)">
                <td hidden><%out.print(completedExams[i][0]);%></td>
                <td><%out.print(completedExams[i][1]);%></td>
                <td><%out.print(completedExams[i][2]);%></td>
                <td hidden><%out.print(completedExams[i][3]);%></td>
                <td><%out.print(completedExams[i][4]);%></td>
                <td><%out.print(completedExams[i][5]);%></td>
                <td><%out.print(completedExams[i][6]);%></td>
                <td hidden><%out.print(completedExams[i][7]);%></td>
                <td hidden><%out.print(completedExams[i][8]);%></td>
                <td hidden><%out.print(completedExams[i][9]);%></td>
            </tr>
        <%
        }
        %>
    </table>
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="SchoolOfficeDashboard.jsp">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="modalHeader" class="modal-title">Exam Details</h4>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" name="modalExamIDHidden" id="modalExamIDHidden" value = ' ' />
                        <input type="hidden" name="modalExamTitleHidden" id="modalExamTitleHidden" value = ' ' />								
                        <input type="hidden" name="modalSchoolHidden" id="modalSchoolHidden" value = ' ' />
                        <input type="hidden" name="modalModuleCoordinatorHidden" id="modalModuleCoordinatorHidden" value = ' ' />
                        <input type="hidden" name="modalModuleCodeHidden" id="modalModuleCodeHidden" value = ' ' />
                        <input type="hidden" name="modalExamTypeHidden" id="modalExamTypeHidden" value = ' ' />
                        <input type="hidden" name="modalExamSittingHidden" id="modalExamSittingHidden" value = ' ' />
                        <input type="hidden" name="modalExamLevelHidden" id="modalExamLevelHidden" value = ' ' />
                        <input type="hidden" name="modalSemesterHidden" id="modalSemesterHidden" value = ' ' />
                        <input type="hidden" name="modalYearHidden" id="modalYearHidden" value = ' ' />
                        <p id="modalExamID" name="examid">Exam ID</p>
                        <p id="modalExamTitle">Exam Title</p>
                        <p id="modalSchool">School</p>
                        <p id="modalModuleCoordinator">Module Coordinator</p>
                        <p id="modalModuleCode">Module Code</p>
                        <p id="modalExamType">Exam Type</p>
                        <p id="modalExamSitting">Exam Sitting</p>
                        <p id="modalExamLevel">Exam Level</p>
                        <p id="modalSemester">Semester</p>
                        <p id="modalYear">Year</p>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="submit" name="DownloadExam" class="btn btn-default">Download Exam</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </form>
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
        
        
        <% 
            //String[][] completedExams = new String[db.CompletedRows][14];
            //completedExams = db.getCompletedExams();
            //out.println(Arrays.deepToString(db.getCompletedExams()));
            
           // for (int i = 0; i < completedExams.length; i++){
                   // out.print(completedExams[i][1] + " - " + completedExams[i][2] + " - " + completedExams[i][4] + " - "+ completedExams[i][5] + " - "+ completedExams[i][6]);
                    
                %>
                <br>
                <%
          //  }
            
            
            
          //  for (int i = 0; i < completedExams.length; i++){ 
            //    for (int j = 0; j < completedExams[i].length; j++){ 
              //      out.print(completedExams[i][j] + " "); 
               // }
                %>
                <br>
                <%
           // } 
        
        
        
        %>
        <br>
    </body>
</html>
