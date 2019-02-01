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
            <a id="back" href="LocalExamOfficerDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
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
            <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="alerting(this)">
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
                            <input type="hidden" name="ExamIDHidden" id="ExamIDHidden" value = ''/>
                            <input type="hidden" name="ExamTitleHidden" id="ExamTitleHidden" value = ' ' />								
                            <input type="hidden" name="SchoolHidden" id="SchoolHidden" value = ' ' />
                            <input type="hidden" name="ModuleCoordinatorHidden" id="ModuleCoordinatorHidden" value = ' ' />
                            <input type="hidden" name="ModuleCodeHidden" id="ModuleCodeHidden" value = ' ' />
                            <input type="hidden" name="ExamTypeHidden" id="ExamTypeHidden" value = ' ' />
                            <input type="hidden" name="ExamSittingHidden" id="ExamSittingHidden" value = ' ' />
                            <input type="hidden" name="ExamLevelHidden" id="ExamLevelHidden" value = ' ' />
                            <input type="hidden" name="SemesterHidden" id="SemesterHidden" value = ' ' />
                            <input type="hidden" name="YearHidden" id="YearHidden" value = ' ' />
                            <button type="submit" id="completed" class="btn btn-default"  name="submit">Edit Exam</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
        
        
        
        
        
    <br>
    <br>
        <br>
    <br>
    <br>
    <br>

        
        
        
        
        
        
        
        
        
        <h1>Edit an exam</h1>
        
  <form method = "POST"> 
  ID of the Exam you want to edit:  
  <br>  
  <input type="text" name="examid" value="" pattern="[0-9]+" title="number only">
  <br>
  Title:
  <br>
  <input type="text" name="title" value="">
  <br>
  School:<br>
  <input type="text" name="school" value="">
  <br>
  Module Coordinator:<br>
  <input type="text" name="modulecoordinator" value="">
  <br>
  Module Code:<br>
  <input type="text" name="modulecode" value="">
  <br>
  Exam Type:<br>
  <input type="text" name="examtype" value="">
  <br>
   Exam Period:<br>
  <input type="text" name="examperiod" value="">
  <br>
   Exam Level:<br>
  <input type="text" name="examlevel" value="">
  <br>
  Semester:<br>
  <input type="text" name="semester" value="" pattern="[0-9]+" title="number only">
  <br>
  Year:<br>
  <input type="text" name="year" value="" pattern="[0-9]+" title="number only">
  <br>
  Date Created:<br>
  <input type="text" name="datecreated" value="" pattern="[0-9]+" title="number only">
  <br>
  Status:<br>
  <input type="text" name="status" value="">
  <br>
  Exam Setter:<br>
  <input type="text" name="examsetter" value="" pattern="[0-9]+" title="number only">
  <br>
  Internal Moderator:<br>
  <input type="text" name="internalmoderator" value="" pattern="[0-9]+" title="number only">
  <br>
  External Examiner:<br>
  <input type="text" name="externalexaminer" value="" pattern="[0-9]+" title="number only" > 
  <br>
  Exam Vetting Committee:<br>
  <input type="text" name="examvettingcommittee" value="" pattern="[0-9]+" title="number only" >
  <br> <br>
    <button type = "submit" name = "Update">Update/Change Exam</button>
  </form> 
        
    <% 
      
        int AssignedExamID = 0;
        String Title = "Test Title";
        String School = "School of hard knocks";
        String ModuleCoordinator = "Abbas Lawal";
        String ModuleCode = "12345667";
        String ExamType = "TestOnline";
        String ExamPeriod = "Test";
        String ExamLevel = "TestLevel";
        String Semester = "1";
        int Year = 2019;
        String DateCreated = "2019";
        String Status = "Complete";
        int ExamSetter = 10007;
        int InternalModerator = 10007;
        int ExternalExaminer = 10007;
        int ExamVettingComittee = 10007;
        
        
     if (request.getParameter("Update") != null)
     { 
        String examid = request.getParameter("examid"); 
        AssignedExamID =  Integer.parseInt(examid);
        out.println(AssignedExamID);
        
        Title = request.getParameter("title");
        out.println(Title);
        School = request.getParameter("school");
        out.println(School);
        ModuleCoordinator = request.getParameter("modulecoordinator");
        out.println(ModuleCoordinator);
        ModuleCode = request.getParameter("modulecode");
        out.println(ModuleCode);
        ExamType = request.getParameter("examtype");
        out.println(ExamType);
        ExamPeriod = request.getParameter("examperiod");
        out.println(ExamPeriod);
        ExamLevel = request.getParameter("examlevel");
        out.println(ExamLevel);
        Semester = request.getParameter("semester");
        out.println(Semester);
        
        
        String year = request.getParameter("year");
        Year =  Integer.parseInt(year); 
        out.println(Year);
        
        DateCreated = request.getParameter("datecreated");
        out.println(DateCreated);
        
        Status = request.getParameter("status");
        out.println(Status);
        
        

        
        String examsetter = request.getParameter("examsetter");
        ExamSetter =  Integer.parseInt(examsetter); 
        out.println(ExamSetter);
        
        
        
        String internalmoderator = request.getParameter("internalmoderator");
        InternalModerator =  Integer.parseInt(internalmoderator); 
        out.println(InternalModerator);
        
        String externalexaminer = request.getParameter("externalexaminer");
        ExternalExaminer =  Integer.parseInt(externalexaminer); 
        out.println(ExternalExaminer);
        

        String examvettingcommittee = request.getParameter("examvettingcommittee");
        ExamVettingComittee =  Integer.parseInt(examvettingcommittee); 
        out.println(ExamVettingComittee);
        
        
 
        db.EditExam(AssignedExamID, Title, School,ModuleCoordinator,ModuleCode,ExamType,ExamPeriod,ExamLevel,Semester, Year, DateCreated,Status,ExamSetter, InternalModerator,  ExternalExaminer, ExamVettingComittee);
        
        
        
     }
   
 

   

   
    %>
        
        
    </body>
</html>
