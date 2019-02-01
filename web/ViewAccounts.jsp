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
