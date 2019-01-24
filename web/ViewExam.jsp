<%-- 
    Document   : ViewExam
    Created on : 24-Jan-2019, 15:41:41
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
        <title>View Exam</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    <form method="POST">
        
       <% String[][] exam = db.getExamList("String"); 
           
       %>
        
        <table border="2">
            <tr>
                <td>Exam ID</td>
                <td>Title</td>
                <td>Module Coordinator</td>
                <td>Module Code</td>
            </tr>
            <%
                int i = 0;
                if (exam != null)
                {
                    %>
                    <tr>
                        <td> 
                        <% 
                            System.out.println(exam[i][0]); 
                            %> 
                        </td>
                        <td>
                        <% 
                            System.out.println(exam[i][1]); 
                            %> 
                        </td>
                        <td>
                        <% 
                            System.out.println(exam[i][3]); 
                            %> 
                        </td>
                        <td>
                        <% 
                            System.out.println(exam[i][4]); 
                            %> 
                        </td>
                    </tr>
                    <%
                        i++;
                }
%>
            
        </table>
    </form>
</html>
