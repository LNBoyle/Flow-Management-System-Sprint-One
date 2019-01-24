<%-- 
    Document   : CreateAccount
    Created on : 24-Jan-2019, 13:43:14
    Author     : abbaslawal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <h1>Create a new account</h1>
        
        <form>
            
            
  First name:<br>
  <input type="text" name="firstname" value="">
  <br>
  Surname of Examiner:<br>
  <input type="text" name="surname" value="">
  <br>
  Role:<br>
  <input type="text" name="role" value="">
  <br>
  Email:<br>
  <input type="text" name="email" value="">
  <br>
  Password:<br>
  <input type="password" name="password" value="">
  <br> <br>
  <button type="button" onclick="alert('Account Created')">Create</button>
  </form> 
        
        <%
            if ((request.getParameter("Create") != null)) {

            }
        %>
        
        
    </body>
</html>
