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
        <title>View Accounts</title>
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                <span class="navbar-brand">Welcome..</span>
            </nav>
            <a id="back" href="StaffDash.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>
        </div>
        
        
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
