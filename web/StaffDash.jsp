<%-- 
    Document   : StaffDash
    Created on : 22-Jan-2019, 15:18:17
    Author     : Jordan
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
	<script src="scripts/ExamSetterDashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>Exam Setter Dashboard</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>     

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
            <div id="bodyWrapper">
        <%
            DeadLine deadline = new DeadLine();
            %><center><h2> <%
            out.print("Your Deadline to complete your exams is: " + deadline.deadline("Exam Setter"));
            %></h2></center> <%
            %>
            <br>

             <%
            String[][] signedExams = db.getFullySignedExams();
            
            
            %>
             <div>
            <form method=POST">
                <input type="button" class="btn btn-lg" value="Upload New Exam" name="Upload New Exam" onclick="openPage('FileUpload.jsp')" />

                <button class="btn btn-lg" type="EditExam" name="edit">Edit Current Exam</button>
                <input type="button" class="btn btn-lg" value="View Exam" name="View Exam" onclick="openPage('ViewComments.jsp')" />
            </form>


        </div>
             <br>
             <p>
                 
             </p>
             <br>
             <h3>Completed/Signed Exams Awaiting Approval</h3>
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
        for(int i=0;i<db.CompletedRowss;i++){
        %>
            <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="alerting(this)">
                <td hidden><%out.print(signedExams[i][0]);%></td>
                <td><%out.print(signedExams[i][1]);%></td>
                <td><%out.print(signedExams[i][2]);%></td>
                <td hidden><%out.print(signedExams[i][3]);%></td>
                <td><%out.print(signedExams[i][4]);%></td>
                <td><%out.print(signedExams[i][5]);%></td>
                <td><%out.print(signedExams[i][6]);%></td>
                <td hidden><%out.print(signedExams[i][7]);%></td>
                <td hidden><%out.print(signedExams[i][8]);%></td>
                <td hidden><%out.print(signedExams[i][9]);%></td>
            </tr>
        <%
        }
        %>
    </table>
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="StaffDash.jsp">
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
                </form>
                <div class="modal-footer">
                        <button type="submit" name="DownloadExam" class="btn btn-default">Download Exam</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <form action="CompleteExam.jsp" method="POST">
                            <input type="hidden" name="ExamIDHidden" id="ExamIDHidden" value = ''/>
                            <button type="submit" id="completed" class="btn btn-default"  name="submit">Approve Exam</button>
                        </form>
                </div>
            </div>
        </div>
    </div>

            <%
            String[][] oldExams = db.getOldExams();
            
            
            %>
    
             <br>
             <br>
             <h3 class="table2title">Old Versions of Your Exams</h3>
    <table class="oldexams">
        <tr>
            <th class="headerTable">Exam ID</th>
            <th class="headerTable">TimeStamp</th>
            <th class="headerTable">Title</th>
            <th hidden>School</th>
            <th hidden>Module Coordinator</th>
            <th class="headerTable">Module Code</th>
            <th hidden>Exam Type</th>
            <th class="headerTable">Exam Sitting</th>
            <th class="headerTable">Exam Level</th>
            <th hidden>Semester</th>
            <th class="headerTable">Year</th>
        </tr>
        <%
        for(int i=0;i<db.CompletedRowsss;i++){
        %>
            <tr class='clickable-row' data-toggle="modal" data-target="#myOtherModal" onclick="display(this)">
                <td><%out.print(oldExams[i][0]);%></td>
                <td><%out.print(oldExams[i][1]);%></td>
                <td><%out.print(oldExams[i][2]);%></td>
                <td hidden><%out.print(oldExams[i][3]);%></td>
                <td hidden><%out.print(oldExams[i][4]);%></td>
                <td><%out.print(oldExams[i][5]);%></td>
                <td hidden><%out.print(oldExams[i][6]);%></td>
                <td><%out.print(oldExams[i][7]);%></td>
                <td><%out.print(oldExams[i][8]);%></td>
                <td hidden><%out.print(oldExams[i][9]);%></td>
                <td><%out.print(oldExams[i][10]);%></td>
            </tr>
        <%
        }
        %>
    </table>
    
    <div id="myOtherModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="StaffDash.jsp">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="modalHeader" class="modal-title">Old Exam Details</h4>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" name="modalExamIDHidden2" id="modalExamIDHidden2" value = ' ' />
                        <input type="hidden" name="modalTimeStampHidden2" id="modalTimeStampHidden2" value = ' ' />
                        <input type="hidden" name="modalExamTitleHidden2" id="modalExamTitleHidden2" value = ' ' />								
                        <input type="hidden" name="modalSchoolHidden2" id="modalSchoolHidden2" value = ' ' />
                        <input type="hidden" name="modalModuleCoordinatorHidden2" id="modalModuleCoordinatorHidden2" value = ' ' />
                        <input type="hidden" name="modalModuleCodeHidden2" id="modalModuleCodeHidden2" value = ' ' />
                        <input type="hidden" name="modalExamTypeHidden2" id="modalExamTypeHidden2" value = ' ' />
                        <input type="hidden" name="modalExamSittingHidden2" id="modalExamSittingHidden2" value = ' ' />
                        <input type="hidden" name="modalExamLevelHidden2" id="modalExamLevelHidden2" value = ' ' />
                        <input type="hidden" name="modalSemesterHidden2" id="modalSemesterHidden2" value = ' ' />
                        <input type="hidden" name="modalYearHidden2" id="modalYearHidden2" value = ' ' />
                        <p id="modalExamID2" name="examid">Exam ID</p>
                        <p id="modalTimeStamp2">Time Stamp</p>
                        <p id="modalExamTitle2">Exam Title</p>
                        <p id="modalSchool2">School</p>
                        <p id="modalModuleCoordinator2">Module Coordinator</p>
                        <p id="modalModuleCode2">Module Code</p>
                        <p id="modalExamType2">Exam Type</p>
                        <p id="modalExamSitting2">Exam Sitting</p>
                        <p id="modalExamLevel2">Exam Level</p>
                        <p id="modalSemester2">Semester</p>
                        <p id="modalYear2">Year</p>
                    </div>
                </form>
                <div class="modal-footer">
                        <button type="submit" name="DownloadExam" class="btn btn-default">Download Exam</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    <br>
         
            </div>
    </body>

    <script type="text/javascript">
        function openPage(pageName)
        {
            window.location.href = pageName;
        }
    </script>

</html>
