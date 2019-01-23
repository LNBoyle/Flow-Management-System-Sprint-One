<%-- 
    Document   : SchoolOfficeDashboard
    Created on : 22-Jan-2019, 19:48:41
    Author     : Sebastian
--%>

<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
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
        
        <br>
        <% 
            String[][] completedExams = new String[db.CompletedRows][14];
            completedExams = db.getCompletedExams();
            //out.println(Arrays.deepToString(db.getCompletedExams()));
            
            for (int i = 0; i < completedExams.length; i++){
                    out.print(completedExams[i][1] + " - " + completedExams[i][2] + " - " + completedExams[i][4] + " - "+ completedExams[i][5] + " - "+ completedExams[i][6]);
                    
                %>
                <br>
                <%
            }
            
            
            
          //  for (int i = 0; i < completedExams.length; i++){ 
            //    for (int j = 0; j < completedExams[i].length; j++){ 
              //      out.print(completedExams[i][j] + " "); 
               // }
                %>
                <br>
                <%
           // } 
        
        
        
        %>
        <br>
    </body>
</html>
