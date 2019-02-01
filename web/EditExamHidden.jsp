<%-- 
    Document   : EditExamHidden
    Created on : 01-Feb-2019, 04:15:10
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("submit") != null){
            
                String ExamID = request.getParameter("0");
                String Title = request.getParameter("1");
                String School = request.getParameter("2");
                String ModuleCoordinator = request.getParameter("3");
                String ModuleCode = request.getParameter("4");
                String ExamType = request.getParameter("5");
                String ExamPeriod = request.getParameter("6");
                String ExamLevel = request.getParameter("7");
                String Semester = request.getParameter("8");
                String Year = request.getParameter("9");

                DatabaseConnection db = new DatabaseConnection();    
                if(db.editExamMetaData(ExamID, Title, School, ModuleCoordinator, ModuleCode, ExamType, ExamPeriod, ExamLevel, Semester, Year)){
                    %>
                    <script>
                    window.location.href = "StaffDash.jsp";
                    alert("Ammended Data Successfully");
                    </script>
                    <%
                }
                
            }
        %>
        
        <script>
            window.location.href = "StaffDash.jsp";
            alert("Error ammending data");
        </script>
            
    </body>
</html>
