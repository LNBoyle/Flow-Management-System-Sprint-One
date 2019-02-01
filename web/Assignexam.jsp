<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ExamWebApp.*"%>

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
        <title>Assign </title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <div id="header">
        <nav class="navbar navbar-light">
            <% DatabaseConnection db = new DatabaseConnection();
                String user = db.getName(LoginCheckClass.userID);
                out.print("<span class='navbar-brand'>Welcome " + user + "</span>");
            %>
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
    <body>


        <h1><center>Assign Exams
        <label value=""/></center></h1>
        <form method='POST'>   
  <center>
           <br>
                   <br>
            Internal Moderator:
            <select name = "internal">
                <option value = "0"> Select a name
                    <%String [][] internallist = db.getAllInternalMods();
                    for (int i = 0; i < internallist.length; i++)
                    {
                        out.print("<option value=" + internallist[i][0] + ">" + internallist[i][1] + " " + internallist[i][2] + "<br>");
                    }
                    %>
            </select>
           
            External Moderator:
            <select name = "external">
                <option value = "0"> Select a name
                    <%String [][] externallist = db.getAllExternalExam();
                    for (int i = 0; i < externallist.length; i++)
                    {
                        out.print("<option value=" + externallist[i][0] + ">" + externallist[i][1] + " " + externallist[i][2] + "<br>");
                    }
                    %>
            </select>
           
            Exam Vetting Committee:
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
            <br>
            <button type = "submit" name = "setExam">Set Exams</button>
            <br>
            <br>
            <br>
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
            
                </center>
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
                out.print("<center>Success</center>");
            }
            else
            {
                out.print("Something went wrong.");
            }
        }
    }    
    %>     
</html>