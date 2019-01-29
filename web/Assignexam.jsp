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
  <%String[][] examlist = db.getAllUnassignedExams();
    for (int i = 0; i < examlist.length; i++)
    {
        out.print("<input type='checkbox' name='exam' value=" + examlist[i][1] + ">" + examlist[i][0] + "<br>");
    }
  %>
  <br>
  Exam Setter:<br>  
    <select name = "setter">
    <option value = "0"> Select a name
    <%String[][] setterlist = db.getAllSetters();
    for (int i = 0; i < setterlist.length; i++)
    {
        out.print("<option value=" + setterlist[i][0] + ">" + setterlist[i][1] + " " + setterlist[i][2] + "<br>");
    }
    %>
  </select>
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
        int selectedSetter = Integer.parseInt(request.getParameter("setter"));
        int selectedInternal = Integer.parseInt(request.getParameter("internal"));
        int selectedExternal = Integer.parseInt(request.getParameter("external"));
        int selectedVet = Integer.parseInt(request.getParameter("vet"));
       
        if (selectedExams == null)
        {
           out.print("No exams selected");
        }
        else if (selectedSetter == 0 || selectedInternal == 0 || selectedExternal == 0 || selectedVet == 0)
        {
           out.print("Select a staff member for each role");
        }
        else
        {       
            if (db.allocateExams(selectedExams, selectedSetter, selectedInternal, selectedExternal, selectedVet))
            {
                out.print("Success. Click to reload page and update the update exam list.");
                out.println(
                            "<form method = 'POST' action = 'Assignexam.jsp'>"
                            + "<button type = 'submit' name = 'ReturnFromSubmit'>Return</button>"
                            + "</form>"
                    );
            }
            else
            {
                out.print("Something went wrong. Click to reload page before trying again.");
                out.println(
                            "<form method = 'POST' action = 'Assignexam.jsp'>"
                            + "<button type = 'submit' name = 'ReturnFromSubmit'>Return</button>"
                            + "</form>"
                    );
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