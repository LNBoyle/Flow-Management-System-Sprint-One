<%-- 
    Document   : SetDeadline
    Created on : 26-Jan-2019, 15:40:44
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
        <title>Set Deadline</title>
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
        <h1>Set Deadlines</h1>
        

  <form method = "POST"> 
  Role involved with the deadline :    
  <input type="text" name="role" value="">

      Deadline you want to set:    
  <input type="text" name="date" value="">
    <button type = "submit" onclick="alert(Account Deleted)"  name = "setdeadline">set deadline</button>
  </form> 
        
    <% 
         String role = "test";
         String date = "11-12-13";
        
     if (request.getParameter("setdeadline") != null)
     {

        role = request.getParameter("role"); 
        out.println(role);
        date = request.getParameter("date"); 
        out.println(date);
        

        db.SetDeadline(role,date);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>