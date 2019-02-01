<%-- 
    Document   : EditExamm
    Created on : 01-Feb-2019, 02:33:17
    Author     : Sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        
            if((request.getParameter("submit") != null)){
                String ExamID = request.getParameter("ExamIDHidden");
                String Title = request.getParameter("ExamTitleHidden");
                String School = request.getParameter("SchoolHidden");
                String ModuleCoordinator = request.getParameter("ModuleCoordinatorHidden");
                String ModuleCode = request.getParameter("ModuleCodeHidden");
                String ExamType = request.getParameter("ExamTypeHidden");
                String ExamPeriod = request.getParameter("ExamSittingHidden");
                String ExamLevel = request.getParameter("ExamLevelHidden");
                String Semester = request.getParameter("SemesterHidden");
                String Year = request.getParameter("YearHidden");
               
                
            }else{
                System.out.println("Error somthing when wrong with trying to load in the exam for editing");
            }
            
            
            
            
        %>
        
        
        
        
    </body>
</html>
