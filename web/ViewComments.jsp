<%-- 
    Document   : ViewExam
    Created on : 24-Jan-2019, 15:41:41
    Author     : Jordan
--%>

<%@page import="java.util.Arrays"%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DatabaseConnection db = new DatabaseConnection();%>
<!DOCTYPE html>
<html>
    <head>
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="scripts/jquery-1.11.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="scripts/Dashboard.js"></script>
        <link href="css/Dashboard.css" rel="stylesheet">
        <title>View Exams</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
    </body>
    
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
       
       <% 

           String[][] comment = db.getUnrepliedComments();  
       %>
       
        <table>
        <tr>
            <th class="headerTable">Comment ID</th>
            <th class="headerTable">Exam ID</th>
            <th hidden>Comment</th>
            <th class="headerTable">User ID</th>
            <th class="headerTable">Module Code</th>
            <th class="headerTable">Title</th>
        </tr>
        <%
        for(int i=0;i<db.CompletedRowsssss;i++){
        %>
            <tr class='clickable-row' data-toggle="modal" data-target="#myModal" onclick="alertedthis(this)">
                <td><%out.print(comment[i][0]);%></td>
                <td><%out.print(comment[i][1]);%></td>
                <td hidden><%out.print(comment[i][2]);%></td>
                <td><%out.print(comment[i][3]);%></td>
                <td><%out.print(comment[i][4]);%></td>
                <td><%out.print(comment[i][5]);%></td>
            </tr>
        <%
        }


        %>
    </table>
       
    
        <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="HomePage.jsp">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="modalHeader" class="modal-title">Comment</h4>
                    </div>
                    
                    <div class="modal-body">
                        <input type="hidden" name="modalCommentIDHidden" id="modalCommentIDHidden" value = ' ' />
                        <input type="hidden" name="modalExamIDHidden" id="modalExamIDHidden" value = ' ' />								
                        <input type="hidden" name="modalCommentHidden" id="modalCommentHidden" value = ' ' />
                        <input type="hidden" name="modalUserIDHidden" id="modalModuleCoordinatorHidden" value = ' ' />
                        <input type="hidden" name="modalModuleCodeHidden" id="modalModuleCodeHidden" value = ' ' />
                        <input type="hidden" name="modalTitleHidden" id="modalTitleHidden" value = ' ' />
                        <p id="modalCommentID" name="commentid">Comment ID</p>
                        <p id="modalExamID">Exam ID</p>
                        <p id="modalComment">Comment</p>
                        <p id="modalUserID">User ID</p>
                        <p id="modalModuleCode">Module Code</p>
                        <p id="modalTitle">Title</p>
                    </div>
                </form>
                <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <form action="commentRespond.jsp" method="POST">
                            <input type="hidden" name="CommentIDHidden" id="CommentIDHidden" value = ''/>
                            <input type="hidden" name="CommentHidden" id="CommentHidden" value = ''/>
                            <input type="hidden" name="ModuleCodeHidden" id="ModuleCodeHidden" value = ''/>
                            <button type="submit" id="completed" class="btn btn-default"  name="submit">Reply</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
</html>
