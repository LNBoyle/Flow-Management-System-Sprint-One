<%@page import="java.sql.Blob"%>
<%@page import="ExamWebApp.*"%>
<%@page import="ExamWebApp.DeadLine"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Internal Mod Dashboard</title>
        <link rel="icon" type="image/ico" href="https://cdn.dundee.ac.uk/media/dundeewebsite/themes/brandnewhope/img/favicons/apple-icon-57x57.png" />
    </head>
    <body>
        <div id="header">
            <nav class="navbar navbar-light">
                <% DatabaseConnection db = new DatabaseConnection();
                    String user = db.getName(LoginCheckClass.userID);
                    out.print("<span class='navbar-brand'>Welcome " + user + "</span>");
                %>
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
            DeadLine deadline = new DeadLine();
        %><center><h2> <%
            out.print("Your Deadline to complete your exams is: " + deadline.deadline("Exam Vetting Comittee"));
            %></h2></center> <%
            %>
    <br>
    <%                 String[][] exam = db.getExamLists("Exam Vetting Comittee");
                       String[][] responces = db.getAllResponse();

    %>
    <div id="mainBody">
        <div id="tableDiv" class="split">
            <table>
                <tr>
                    <th class="headerTable">Exam ID</th>
                    <th class="headerTable">Exam Title</th>
                    <th class="headerTable">Module Code</th>
                    <th class="headerTable">Module Coordinator</th>
                    <th class="headerTable">Internal Moderator</th>
                    <th class="headerTable">External Examiner</th>
                    <th hidden class="headerTable">Exam</th>
                </tr>
                <%            for (int i = 0; i < exam.length; i++) {
                        String blobString = null;
                        Blob examPaper = db.getExamPaper(exam[i][0]);
                        if (examPaper != null) {
                            String type = "";
                            int blobLength = (int) examPaper.length();
                            byte[] blobAsBytes = examPaper.getBytes(1, blobLength);
                            blobString = Base64.getEncoder().encodeToString(blobAsBytes);
                        }

                %>

                <tr class="clickable-row" data-toggle="modal" data-target="#myModal" onclick="alerting(this)">
                    <td><%out.print(exam[i][0]);%></td>
                    <td><%out.print(exam[i][1]);%></td>
                    <td><%out.print(exam[i][2]);%></td>
                    <td><%out.print(exam[i][3]);%></td>
                    <td><%out.print(exam[i][4]);%></td>
                    <td><%out.print(exam[i][5]);%></td>
                    <td hidden><%out.print(blobString);%></td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <br>
            <h3 class="table3title"> Responces to Comments </h3>
                    <br>
            <table class="responces">
        <tr>
            <th class="headerTable">Exam ID</th>
            <th class="headerTable">Module Code</th>
            <th class="headerTable">Exam Period</th>
            <th class="headerTable">Exam Type</th>
            <th class="headerTable">Exam Level</th>
            <th class="headerTable">Comment</th>
            <th class="headerTable">Comment Time Stamp</th>
            <th hidden class="headerTable">Responce</th>
            <th hidden class="headerTable">Responce Time Stamp</th>
        </tr>
        <%
        for(int i=0;i<responces.length;i++){
        %>
        <tr class='clickable-row' data-toggle="modal" data-target="#myOtherModal" onclick="modal(this)">
                <td><%out.print(responces[i][0]);%></td>
                <td><%out.print(responces[i][1]);%></td>
                <td><%out.print(responces[i][2]);%></td>
                <td><%out.print(responces[i][3]);%></td>
                <td><%out.print(responces[i][4]);%></td>
                <td><%out.print(responces[i][5]);%></td>
                <td><%out.print(responces[i][6]);%></td>
                <td hidden><%out.print(responces[i][7]);%></td>
                <td hidden><%out.print(responces[i][8]);%></td>
            </tr>
        <%
        }
        %>
    </table>
            
    
            
        </div>

        <div id="pdfDiv" class="split">
            <object id="pdf"
                    data=""
                    type="application/pdf"
                    width="100%"
                    height="100%">
                <iframe id="frame"
                        src=""
                        width="100%"
                        height="100%"
                        style="border: none;">
                    <p>Your browser does not support PDFs.
                        <a href="https://example.com/test.pdf">Download the PDF</a>.</p>
                </iframe>
            </object>
        </div>
    </div>
    
    <div id="myOtherModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <form method="post" action="StaffDash.jsp">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="modalHeader" class="modal-title">Responce</h4>
                    </div>

                    
                    <div class="modal-body">
                        <input type="hidden" name="modalExamIDHidden" id="modalExamIDHidden" value = ' ' />
                        <input type="hidden" name="modalModuleCodeHidden" id="modalModuleCodeHidden" value = ' ' />
                        <input type="hidden" name="modalExamPeriodHidden" id="modalExamPeriodHidden" value = ' ' />								
                        <input type="hidden" name="modalExamTypeHidden" id="modalExamTypeHidden" value = ' ' />
                        <input type="hidden" name="modalExamLevelHidden" id="modalExamLevelHidden" value = ' ' />
                        <input type="hidden" name="modalCommentHidden" id="modalCommentHidden" value = ' ' />
                        <input type="hidden" name="modalCommentTimeStampHidden" id="modalCommentTimeStampHidden" value = ' ' />
                        <input type="hidden" name="modalResponceHidden" id="modalResponceHidden" value = ' ' />
                        <input type="hidden" name="modalResponceTimeStampHidden" id="modalResponceTimeStampHidden" value = ' ' />
                        <p id="modalExamID">Exam ID</p>
                        <p id="modalModuleCode">Module Code</p>
                        <p id="modalExamPeriod">Exam Period</p>
                        <p id="modalExamType">Exam Type</p>
                        <p id="modalExamLevel">Exam Level</p>
                        <p id="modalComment">Comment</p>
                        <p id="modalCommentTimeStamp">Comment Time Stamp</p>
                        <p id="modalResponce">Responce</p>
                        <p id="modalResponceTimeStamp">Responce Time Stamp</p>
                    </div>
                </form>
                <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <!-- 
        REFACTORED CODE - due to the modals on each of the 3 Dashboards all
        displaying the same content, just differing depending on which dash
        board has loaded, i have refractored this functionality into the Modal
        class by calling the returnModal function and then this code is placed
        into all 3 of the dashboards to cut out on alot of repeated code.
    -->
    <%
        Modal displayModal = new Modal();
        out.print(displayModal.returnModal());
    %>

    
    
    
    
</body>





</html>
