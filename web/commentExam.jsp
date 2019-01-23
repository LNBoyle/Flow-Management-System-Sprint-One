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
        Exam: <% out.print(db.getExamModule(1)); %> <br>
        <%-- Form for user to input comment and button to sign it --%>
            <form method = "POST">
                Your Comment: <input type = "textarea" name = "comment" size = 150px required> <br>
                <button type = "submit" name = "commentSubmit"> Sign & Submit</button>
            </form>
            
        <%-- Check response on submit and update the database. Tell user if successful. --%>
        <%
            if ((request.getParameter("commentSubmit") != null))
            {
                if ((db.setComment(1, 1, request.getParameter("comment"))) == true)
                {
                    out.println("Success!");
                    out.println(
                            "<form method = 'POST' action = 'index.jsp'>"
                            + "<button type = 'submit' name = 'ReturnFromSubmit'>Return</button>"
                            + "</form>"
                    );
                }
                else
                {
                    out.println("Failure!");
                }
            }
        %>
    </body>
</html>
