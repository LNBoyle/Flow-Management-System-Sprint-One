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
        
       <% 
           String[][] exam = db.getExamList("Iain Murray");      
       %>
       <div>
            <table border="2">
                <tr>
                    <td>Exam ID</td>
                    <td>Title</td>
                    <td>Module Coordinator</td>
                    <td>Module Code</td>
                </tr>
                <%
                    int i = 0;
                    for(i=0; i < exam.length; i++)
                    {
                        %>
                        <tr>
                            <td> 
                            <% 
                                out.println(exam[i][0]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][1]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][2]); 
                                %> 
                            </td>
                            <td>
                            <% 
                                out.println(exam[i][3]); 
                                %> 
                            </td>
                        </tr>
                        <%
                            
                    }
                   %>

            </table>
       </div>
    </form>
</html>
