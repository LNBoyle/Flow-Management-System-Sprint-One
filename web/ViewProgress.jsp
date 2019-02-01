<%-- 
    Document   : ViewProgress
    Created on : 31-Jan-2019, 16:22:35
    Author     : callumscott
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page language="java" import="ExamWebApp.*" %>
<%DatabaseConnection db = new DatabaseConnection();%>
<%@page import ="javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Progress</title>
    </head>
    <body>
        <%
           String strid = request.getParameter("ViewProgress");
           int id = Integer.parseInt(strid);
        %>
        <div id="header">
            <nav class="navbar navbar-light">
                <span class="navbar-brand">Welcome..</span>
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
        
         <table>
        <tr>
            <th class="headerTable">Role</th>
            <th class="headerTable">Comment</th>
            <th class="headerTable">Response</th>
        </tr>
                  <%
                    boolean[][] responseExists = db.checkExamComment(id);
                    
                    
                %>
           
            <tr class='table-bordered'> 
                  <td> Internal Moderator</td>
                  <td>
                  <%
                      if (responseExists[0][0])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
                  <td>
                  <%
                      if (responseExists[0][1])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
            </tr>
            <tr>
                <td> Exam Vetting Committee</td>
                  <td>
                  <%
                      if (responseExists[1][0])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
                  <td>
                  <%
                      if (responseExists[1][1])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
                
            </tr>
            <tr>
                 <td> External Examiner</td>
                  <td>
                  <%
                      if (responseExists[2][0])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
                  <td>
                  <%
                      if (responseExists[2][1])
                        {
                          out.print("True");
                        }
                    else
                    {
                        out.print("False");
                    }
                  %>
                  </td>
                
            </tr>
    </body>
</html>
