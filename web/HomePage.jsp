<%@page language="java" import="ExamWebApp.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <link href="css/HomePage.css" rel="stylesheet">
        <title>Home Page</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    
       <div id="header">
            <nav class="navbar navbar-light">
                <span class='navbar-brand'>Welcome</span>
            </nav>
            <a id="back" href="InternalModDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>

        </div>
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
                <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='StaffDash.jsp';" value="Exam Setter" />
                
            <%
            }
            if(userRoles[1].equals("1")){
                %>
           <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='InternalModDashboard.jsp';" value="Internal Moderator" />
                
            <%
            }
            if(userRoles[2].equals("1")){
                %>
            
                <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='ExternalExaminerDashboard.jsp';" value="External Examiner" />
            <%
            }
            if(userRoles[3].equals("1")){
                %>
            
                <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='ExamVettingComitteeDashboard.jsp';" value="Exam Vetting Comittee" />
            <%
            }
            if(userRoles[4].equals("1")){
                %>
            <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='SchoolOfficeDashboard.jsp';" value="School Office" />
                
            <%
            }
            if(userRoles[5].equals("1")){
                %>
           <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Local Exam Officer" />
                
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
            <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='StaffDash.jsp';" value="Exam Setter" />
                
            <%
            }
            if(userRoles[1].equals("1")){
                %>
           <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='InternalModDashboard.jsp';" value="Internal Moderator" />
                
            <%
            }
            if(userRoles[2].equals("1")){
                %>
            
                <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='ExternalExaminerDashboard.jsp';" value="External Examiner" />
            <%
            }
            if(userRoles[3].equals("1")){
                %>
            
                <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='ExamVettingComitteeDashboard.jsp';" value="Exam Vetting Comittee" />
            <%
            }
            if(userRoles[4].equals("1")){
                %>
            <input type="button" class="btn btn-lg btn-actuallyblue" onclick="location.href='SchoolOfficeDashboard.jsp';" value="School Office" />
                
            <%
            }
            if(userRoles[5].equals("1")){
                %>
           <input type="button" class="btn btn-lg btn-actuallyblue " onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Local Exam Officer" />
                
            <%
            }
}
        
        %>
        
    </body>
</html>