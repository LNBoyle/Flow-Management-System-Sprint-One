<%-- 
    Document   : CreateAccount
    Created on : 24-Jan-2019, 13:43:14
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
        <title>Create Account</title>
               <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Home" />
       <input type="button" onclick="location.href='index.jsp';" value="Lock" />
       <input type="button" onclick="location.href='LocalExamOfficerDashboard.jsp';" value="Back" />
    </head>
    <body>
        <h1>Create a new account</h1>
        

  <div>
         
  <Form method="POST">
  UserId:    
  <input type="text" name="userid" value=" ">
  First name:
  <br>
  <input type="text" name="firstname" value=" ">
  <br>
  Surname of Examiner:<br>
  <input type="text" name="surname" value=" ">
  <br>
  Role:<br>
  <input type="text" name="role" value=" ">
  <br>
  Email:<br>
  <input type="text" name="email" value=" ">
  <br>
  Password:<br>
  <input type="password" name="password" value=" ">
  <br> <br>
  <input type="submit" value="Create" name="Create"  >
    </Form>

  </div> 
      
   
    <% 
        
        
        

                
        if ((request.getParameter("Create") != null)) 
        {  
       

         
        String u = "";
        String f = "";
        String s = "";
        String r = "";  
        String e = "";
        String p = "";
        
        u = request.getParameter("userid");     
        out.print(u);
        f = request.getParameter("firstname");
        out.print(f);
        s = request.getParameter("surname");
        out.print(s);
        r = request.getParameter("role");
        out.print(r);
        e = request.getParameter("email");
        out.print(e);
        p = request.getParameter("password");
        out.print(p);
    

        int UserID = 0;   
        UserID = Integer.parseInt(u);    
        
       db.CreateAccount(UserID, f, s, r, e, p); 
       
     if (db.CreateAccount(UserID, f, s, r, e, p) == true){
                out.println("This shit is done");
     }

     
     
     
         }
    %>
 
      
        
    </body>
</html>
