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
            int commentID = 0;
            int examID = 0;
            String strid = request.getParameter("respondComment");
            
            if (strid != null)
            {
                commentID = Integer.parseInt(strid);
                examID = db.getExamIDFromComment(commentID);
                out.println(
                            "Exam: " + db.getExamModule(examID) + " <br>"
                            + "Comment: " + db.getExamComment(commentID) + " <br>"
                            + "<form method = 'POST'>"
                            + "Your Response: <input type = 'textarea' name = 'response' size = 150px required> <br>"
                            + "<button type = 'submit' name = 'responseSubmit' value= " + commentID + "> Sign & Submit</button>"
                            + "</form>"
                            + "</h1>"
                    );   
            }
            
        %>
        <%-- Check response on submit and update the database. Tell user if successful. --%>
        <%
            if ((request.getParameter("responseSubmit") != null))
            {
                if ((db.setCommentResponse(Integer.parseInt(request.getParameter("responseSubmit")), request.getParameter("response"))) == true)
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
