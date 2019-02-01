<%-- 
    Document   : EditExam
    Created on : 31-Jan-2019, 12:35:03
    Author     : abbaslawal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<%@page import ="javax.swing.JOptionPane" %>
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
        
        <%
        String[][] examSetterExams = db.getFullySignedExams();
        %>
        
        <br>
        <br>
        <br>
        <h3>Your Editable Exams</h3>
        <table>
        <tr>
            <th hidden>Exam ID</th>
            <th class="headerTable">Exam Title</th>
            <th class="headerTable">School</th>
            <th hidden>Module Coordinator</th>
            <th class="headerTable">Module Code</th>
            <th class="headerTable">Exam Type</th>
            <th class="headerTable">Exam Sitting</th>
            <th class="headerTable">Exam Level</th>
            <th class="headerTable">Semester</th>
            <th class="headerTable">Year</th>
        </tr>
        <%
        for(int i=0;i<db.CompletedRowss;i++){
        %>
            <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="displayalert(this)">
                <td hidden><%out.print(examSetterExams[i][0]);%></td>
                <td><%out.print(examSetterExams[i][1]);%></td>
                <td><%out.print(examSetterExams[i][2]);%></td>
                <td hidden><%out.print(examSetterExams[i][3]);%></td>
                <td><%out.print(examSetterExams[i][4]);%></td>
                <td><%out.print(examSetterExams[i][5]);%></td>
                <td><%out.print(examSetterExams[i][6]);%></td>
                <td><%out.print(examSetterExams[i][7]);%></td>
                <td><%out.print(examSetterExams[i][8]);%></td>
                <td dden><%out.print(examSetterExams[i][9]);%></td>
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
                        <input type="hidden" name="ExamIDHidden" id="ExamIDHidden" value = ''/>
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
                        <form action="EditExamm.jsp" method="POST">
                            <input type="hidden" name="1" id="1" value = ' ' />
                            <input type="hidden" name="2" id="2" value = ' ' />								
                            <input type="hidden" name="3" id="3" value = ' ' />
                            <input type="hidden" name="4" id="4" value = ' ' />
                            <input type="hidden" name="5" id="5" value = ' ' />
                            <input type="hidden" name="6" id="6" value = ' ' />
                            <input type="hidden" name="7" id="7" value = ' ' />
                            <input type="hidden" name="8" id="8" value = ' ' />
                            <input type="hidden" name="9" id="9" value = ' ' />
                            <input type="hidden" name="10" id="10" value = ' ' />
                            <button type="submit" id="completed" class="btn btn-default"  name="submit">Edit Exam</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
        
    </body>
</html>
