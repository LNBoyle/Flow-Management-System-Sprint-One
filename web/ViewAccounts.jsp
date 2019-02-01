<%-- 
    Document   : View Accounts
    Created on : 24-Jan-2019, 15:39:54
    Author     : abbaslawal
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="ExamWebApp.*"%>

<%@page import ="javax.swing.JOptionPane" %>

<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="scripts/Dashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>View Accounts </title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <div id="header">
        <nav class="navbar navbar-light">
            <% DatabaseConnection db = new DatabaseConnection();
                String user = db.getName(LoginCheckClass.userID);
                out.print("<span class='navbar-brand'>Welcome " + user + "</span>");
            %>
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
        
        
                <%

        String[][] ViewUsers = new String[db.UserRows][4];
        ViewUsers = db.getViewUsers();
      %>
      
      
      <table>
        <tr>
           
            <th class="headerTable">UserID</th>
            <th class="headerTable">First Name</th>
            <th class="headerTable">Surname</th>
            <th class="headerTable">Email</th>
         

        </tr>
        <%
        for(int i=0;i<db.UserRows;i++)
        {
        %>
           <tr class='table-bordered'> 
             <td> <%out.print(ViewUsers[i][0]);%></td>
             <td><%out.print(ViewUsers[i][1]);%></td>
             <td><%out.print(ViewUsers[i][2]);%></td>
             <td><%out.print(ViewUsers[i][3]);%></td>



            </tr>
        <%
        }
        %>
    </table>
      
      
      
      
      
      
      
    </body>
</html>
