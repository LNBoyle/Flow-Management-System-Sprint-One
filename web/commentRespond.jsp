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
           String strid = request.getParameter("respondComment");
           int id = Integer.parseInt(strid);
        %>
        <%-- Fetch and print exam name and the associated comment --%>
        <h1>
            Exam: <% out.print(db.getExamModule(id)); %> <br>
            Comment: <% out.print(db.getExamComment(id)); %> <br>
            <%-- Form for user to input response to comment and button to sign their response --%>
            <form method = "POST">
                Your Response: <input type = "textarea" name = "response" size = 150px required> <br>
                <button type = "submit" name = "responseSubmit"> Sign & Submit</button>
            </form>
        </h1>

        <%-- Check response on submit and update the database. Tell user if successful. --%>
        <%
            if ((request.getParameter("responseSubmit") != null))
            {
                if ((db.setCommentResponse(1, request.getParameter("response"))) == true)
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
