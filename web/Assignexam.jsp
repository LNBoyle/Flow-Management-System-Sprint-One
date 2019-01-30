<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ExamWebApp.*"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Exam</title>
    </head>
    <body>
        
        <div class="topnav">
            <a class="active" </a>
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Back" />
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>
        <h1><center>Assign Exams</center></h1>
        
  <form method='POST'>   
            
  Exam:<br>
  <table>
      <th>Module Code</th>
      <th>Exam Period</th>
      <th>Exam Level</th>
      <th>Semester</th>
      <th>Year</th>
      <tr>
  <%String[][] examlist = db.getAllExams();
    for (int i = 0; i < examlist.length; i++)
    {
        out.print("<tr><td><input type='checkbox' name='exam' value=" + examlist[i][1] + ">" + examlist[i][0] + "</td> <td> " + examlist[i][2] + "</td> <td> " + examlist[i][3] + "</td> <td> " + examlist[i][4] + "</td> <td> " + examlist[i][5] + "</td> </tr>");
    }
  %>
      </tr>
  </table>
  <br>
  Internal Moderator:<br>
    <select name = "internal">
    <option value = "0"> Select a name
    <%String [][] internallist = db.getAllInternalMods();
    for (int i = 0; i < internallist.length; i++)
    {
        out.print("<option value=" + internallist[i][0] + ">" + internallist[i][1] + " " + internallist[i][2] + "<br>");
    }
  %>
    </select>
  <br>
  External Moderator:<br>
    <select name = "external">
    <option value = "0"> Select a name
    <%String [][] externallist = db.getAllExternalExam();
    for (int i = 0; i < externallist.length; i++)
    {
        out.print("<option value=" + externallist[i][0] + ">" + externallist[i][1] + " " + externallist[i][2] + "<br>");
    }
  %>
    </select>
  <br>
  Exam Vetting Committee:<br>
    <select name = "vet">
    <option value = "0"> Select a name
    <%String [][] vetlist = db.getAllExamVets();
    for (int i = 0; i < vetlist.length; i++)
    {
        out.print("<option value=" + vetlist[i][0] + ">" + vetlist[i][1] + " " + vetlist[i][2] + "<br>");
    }
  %>
    </select>
  <br>  
  <button type = "submit" name = "setExam">Set Exams</button>
  </form> 
      
    </body>    
    
    <%
    if (request.getParameter("setExam") != null)
    {
        String[] selectedExams = request.getParameterValues("exam");
        int selectedInternal = Integer.parseInt(request.getParameter("internal"));
        int selectedExternal = Integer.parseInt(request.getParameter("external"));
        int selectedVet = Integer.parseInt(request.getParameter("vet"));
       
        if (selectedExams == null)
        {
           out.print("No exams selected");
        }
        else if (selectedInternal == 0 || selectedExternal == 0 || selectedVet == 0)
        {
           out.print("Select a staff member for each role");
        }
        else
        {       
            if (db.allocateExams(selectedExams, selectedInternal, selectedExternal, selectedVet))
            {
                out.print("Success.");
            }
            else
            {
                out.print("Something went wrong.");
            }
        }
    }    
    %>
    
        <%
            if ((request.getParameter("Home") != null)) {
        %>
       <jsp:forward page="LocalExamOfficerDashboard.jsp"></jsp:forward>
        <%
            }
        %>
        
         <%
            if ((request.getParameter("Back") != null)) {
        %>
       <jsp:forward page="LocalExamOfficerDashboard.jsp"></jsp:forward>
        <%
            }
        %>        
        
            <%
            if ((request.getParameter("Lock") != null)) {
        %>
       <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
</html>