<%-- 
    Document   : DeleteAccount
    Created on : 26-Jan-2019, 15:18:58
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
        <title>Delete Account</title>
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
        <h1>Delete an account</h1>
        

  <form method = "POST"> 
  UserId of account you want to delete:    
  <input type="Int" name="userid" value="">
    <button type = "submit" onclick="alert(Account Deleted)"  name = "delete">create</button>
  </form> 
        
    <% 
         String u = "123";

        
     if (request.getParameter("delete") != null)
     {

        u = request.getParameter("userid");     
      

        

        db.DeleteAccount(u);
    
     }
   
 

   

   
    %>
        
        
    </body>
</html>