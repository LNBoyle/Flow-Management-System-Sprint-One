<%-- 
    Document   : View Accounts
    Created on : 24-Jan-2019, 15:39:54
    Author     : abbaslawal
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<%@page import ="javax.swing.JOptionPane" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Back" />
    </head>
    <body>
        
        
                <%

                String[][] ViewUsers = new String[db.UserRows][5];
                ViewUsers = db.getViewUsers();
          
            for (int i = 0; i < ViewUsers.length; i++)
            { 
                for (int j = 0; j < ViewUsers[i].length; j++)
                    { 
                    out.println(ViewUsers[i][j] + " "); 
                    }
             
                
            }
            
         
      %>
    </body>
</html>
