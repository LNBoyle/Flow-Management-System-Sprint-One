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
