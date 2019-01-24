<%-- 
    Document   : StaffDash
    Created on : 22-Jan-2019, 15:18:17
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet" type="text/css" href="StaffDashCSS.css">
        <title>Staff: Exam Setter</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
             <form method=POST">
                <input type="button" class="btn-blue" value="Upload New Exam" name="Upload New Exam" onclick="openPage('FileUpload.html')" />
                
                <button class="btn-blue" type="EditExam" name="edit">Edit Current Exam</button>
                <button class="btn-blue" type="ViewExam" name="view">View Current Exam</button>
             </form>
        </div>        
        <div class="topnav">
            <a class="active" href="#">Home</a>
            <a href="#Lock">Lock</a>
            <a href="#Back">Back</a>
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
            <br>
            
            
            <%
                
            LoginCheckClass loggedin = new LoginCheckClass();
            out.print(loggedin.userID);
            
            %>
            <br>
            <%
                
            out.print(loggedin.userRole);
            
            %>
        </div>
    </body>
    
    <script type="text/javascript">
        function openPage(pageName)
        {
            window.location.href = pageName;
        }
    </script>
        
</html>
