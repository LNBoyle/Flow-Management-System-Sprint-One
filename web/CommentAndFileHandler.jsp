<%-- 
    Document   : CommentAndFileHandler
    Created on : 25-Jan-2019, 04:16:16
    Author     : liamboyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="ExamWebApp.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
           <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>
      <%
                if(LoginCheckClass.userRole.equals("Exam Vetting Comittee")){
                %>    
                <a id="back" href="ExamVettingComitteeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
                <a id="home" href="ExamVettingComitteeDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
                <%
                }else if(LoginCheckClass.userRole.equals("External Examiner")){
                %>
                <a id="back" href="ExternalExaminerDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
                <a id="home" href="ExternalExaminerDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
                <%
                }else if(LoginCheckClass.userRole.equals("Internal Moderator")){
                %>
                <a id="back" href="InternalModDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
                <a id="home" href="InternalModDashboard.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
                <%
                }
            %>
                  <a id="logout" href="index.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-lock"></i></a>

	</div>
           <%
               
           DatabaseConnection db = new DatabaseConnection();
                if ((db.setComment(Integer.parseInt(request.getParameter("hiddenID")), Integer.parseInt(LoginCheckClass.userID),request.getParameter("comment"))) == true)
                {
                    out.println("Success!");
                    out.println(
                            "<center>"
                            +"<form method = 'POST' action = 'revisionServlet' enctype = 'multipart/form-data'>"
                            + "<input type='hidden' name='hiddenID' value='"+request.getParameter("hiddenID")+"'/>"
                            + "<input type='file' name='ExamPaper' size='50'/>" 
                            + "<input type='file' name='ExamSolution' size='50'/>" 
                            + "<button type = 'submit' name = 'ReturnFromSubmit'>Return</button>"
                            + "</form>"
                            + "</center>"
                    );
                }
                else
                {
                    out.println("Failure!");
                }
            
        %>
    </body>
</html>
