<%@page language="java" import="ExamWebApp.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        //testPackage.MyClass.checkStaffLogin(email, password);
        
        LoginCheckClass login = new LoginCheckClass();
        String role = login.checkStaffLogin(email, password);
        if(role != null){
            if(role.equals("Local Exam Officer")){
                response.sendRedirect("LocalExamOfficerDashboard.jsp");
            }else if(role.equals("Exam Vetting Comittee")){
                response.sendRedirect("ExamVettingComitteeDashboard.jsp");
            }else if(role.equals("Internal Moderator")){
                response.sendRedirect("InternalModDashboard.jsp");
            }else if(role.equals("School Office")){
                response.sendRedirect("SchoolOfficeDashboard.jsp");
            }else if(role.equals("External Examiner")){
                response.sendRedirect("ExternalExaminerDashboard.jsp");
            }
        }else{
            %>
            <script>
                alert("Incorrect Login Credentials");
                window.location = "index.jsp";
            </script>
            <%
        }
        
        %>
        
    </body>
</html>
