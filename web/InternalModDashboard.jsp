<%@page import="ExamWebApp.DeadLine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="topnav">
            <a class="active" href="#">Home</a>
            <a href="#Lock">Lock</a>
            <a href="#Back">Back</a>
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>
        
        <%
            DeadLine deadline = new DeadLine();
            out.print("Your Deadline to complete your exams is: " + deadline.deadline());
            
            %>
        
            <form method=POST">                
                <input type="button" class="btn-blue" value="View Exam" name="View Exam" onclick="openPage('ViewExam.jsp')" />
             </form>
            
            <script type="text/javascript">
            function openPage(pageName)
            {
                window.location.href = pageName;
            }
            </script>
            
    </body>
</html>
