<%-- 
    Document   : UpdateAccount
    Created on : 24-Jan-2019, 17:20:14
    Author     : Cyril
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>
    </head>
    <body>
        <h1>Update an Existing account</h1>
        
   <form>
            
   User ID:<br>
  <input type="text" name="useridx" value="">
  <br>          
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
  <button type="button" onclick="alert('Account Updated')">Update</button>
  </form> 
        
        <%
            if ((request.getParameter("Update") != null)) {

            }
        %>
        
        
    </body>
</html>
