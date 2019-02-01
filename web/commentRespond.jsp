<%@page language="java" import="ExamWebApp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EFMS</title>
    </head>
    <body>
        <%
           
           String id = request.getParameter("CommentIDHidden");
           String modulecode = request.getParameter("ModuleCodeHidden");
           String comment = request.getParameter("CommentHidden");


        %>
        <%-- Fetch and print exam name and the associated comment --%>
        <h1>
            Exam: <% out.print(modulecode); %> <br>
            Comment: <% out.print(comment); %> <br>
            <%-- Form for user to input response to comment and button to sign their response --%>
            <form action="responseHandler.jsp" method = "POST">
                Your Response: <input type = "textarea" name = "responce" id = "responce" size = 150px required> <br>
                <input type="hidden" name="hiddenID" id="hiddenID" value="<% out.print(id); %>"/>
                <button type = "submit" name = "responseSubmit"> Sign & Submit</button>
            </form>
        </h1>

       
      
    </body>
</html>
