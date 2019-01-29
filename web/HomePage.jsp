<%@page language="java" import="ExamWebApp.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
    </head>
    <body>
        
        <%
        if(LoginCheckClass.userID == null){    
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        
        
        LoginCheckClass login = new LoginCheckClass();
        if(login.checkStaffLogin(userEmail, userPassword)){
            String[] userRoles = LoginCheckClass.roles;
        
            if(userRoles[0].equals("1")){
                %>
            <input type="button" onclick="location.href='StaffDash.jsp';" value="Exam Setter" />
                
            <%
            }
            if(userRoles[1].equals("1")){
                %>
           <input type="button" onclick="location.href='InternalModDashboard.jsp';" value="Internal Mod" />
                
            <%
            }
            if(userRoles[2].equals("1")){
                %>
            
                <input type="button" onclick="location.href='ExternalExaminerDashboard.jsp';" value="External Examiner" />
            <%
            }
            if(userRoles[3].equals("1")){
                %>
            
                <input type="button" onclick="location.href='ExamVettingComitteeDashboard.jsp';" value="Exam Vetting Comittee" />
            <%
            }
            if(userRoles[4].equals("1")){
                %>
            <input type="button" onclick="location.href='SchoolOfficeDashboard.jsp';" value="School Office" />
                
            <%
            }
            if(userRoles[5].equals("1")){
                %>
           <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Local Exam Officer" />
                
            <%
            }
        }else{
            %>
            <script>
                alert("Incorrect Login Credentials");
                window.location = "index.jsp";
            </script>
            <%
        }
        
}else{
String[] userRoles = LoginCheckClass.roles;
                if(userRoles[0].equals("1")){
                %>
            <input type="button" onclick="location.href='StaffDash.jsp';" value="Exam Setter" />
                
            <%
            }
            if(userRoles[1].equals("1")){
                %>
           <input type="button" onclick="location.href='InternalModDashboard.jsp';" value="Internal Mod" />
                
            <%
            }
            if(userRoles[2].equals("1")){
                %>
            
                <input type="button" onclick="location.href='ExternalExaminerDashboard.jsp';" value="External Examiner" />
            <%
            }
            if(userRoles[3].equals("1")){
                %>
            
                <input type="button" onclick="location.href='ExamVettingComitteeDashboard.jsp';" value="Exam Vetting Comittee" />
            <%
            }
            if(userRoles[4].equals("1")){
                %>
            <input type="button" onclick="location.href='SchoolOfficeDashboard.jsp';" value="School Office" />
                
            <%
            }
            if(userRoles[5].equals("1")){
                %>
           <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Local Exam Officer" />
                
            <%
            }
}
        
        %>
        
    </body>
</html>