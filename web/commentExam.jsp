<%@page language="java" import="ExamWebApp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
        
        <%
           String strid = request.getParameter("ExamIDHidden");
           int id = Integer.parseInt(strid);
        %>
        
        Exam: <% out.print(db.getExamModule(id)); %> <br>
        <%-- Form for user to input comment and button to sign it --%>
            <form method = "POST">
                Your Comment: <input type = "textarea" name = "comment" size = 150px required> <br>
                <input type="file" name="ExamPaper" size="50"/> <br>
                <button type = "submit" name = "commentSubmit"> Sign & Submit</button>
            </form>
    </body>
</html>
