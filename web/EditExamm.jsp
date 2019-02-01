<%-- 
    Document   : EditExamm
    Created on : 01-Feb-2019, 02:33:17
    Author     : Sebastian
--%>

<%@page import="ExamWebApp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Exam</title>
    </head>
    <body>
        <%
            DatabaseConnection db = new DatabaseConnection();
            if((request.getParameter("submit") != null)){
                String ExamID = request.getParameter("1");
                String Title = request.getParameter("2");
                String School = request.getParameter("3");
                String ModuleCoordinator = request.getParameter("4");
                String ModuleCode = request.getParameter("5");
                String ExamType = request.getParameter("6");
                String ExamPeriod = request.getParameter("7");
                String ExamLevel = request.getParameter("8");
                String Semester = request.getParameter("9");
                String Year = request.getParameter("10");
                %>
                
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <form action="EditExamHidden.jsp" method="post">
                    <br>
                    <br>
                    <br>
                    <input required="" class="textbox" type="hidden" id="0" name="0" value="<% out.print(ExamID); %>">
                    Title: <input required="" class="textbox" type="text" id="1" name="1" value="<% out.print(Title); %>">
                    School: <input required="" class="textbox" type="text" id="2" name="2" value="<% out.print(School); %>">
                    ModuleCoordinator: <input required="" class="textbox" type="text" id="3" name="3" value="<% out.print(ModuleCoordinator); %>"><br>
                    <br>
                    ModuleCode: <input required="" class="textbox" type="text" id="4" name="4" value="<% out.print(ModuleCode); %>">
                    ExamType: <input required="" class="textbox" type="text" id="5" name="5" value="<% out.print(ExamType); %>">
                    ExamPeriod: <input required="" class="textbox" type="text" id="6" name="6" value="<% out.print(ExamPeriod); %>"><br>
                    <br>
                    ExamLevel: <input required="" class="textbox" type="text" id="7" name="7" value="<% out.print(ExamLevel); %>">
                    Semester: <input required="" class="textbox" type="text" id="8" name="8" value="<% out.print(Semester); %>">
                    Year: <input required="" class="textbox" type="text" id="9" name="9" value="<% out.print(Year); %>"><br>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <input class="btn btn-blue btn-lg toggle submitbtn" id="submitbtn" type="submit" name="submit" value="submit"/>
                        </li>
                    </ul>     
                </form>
            </div>
                
                
            <%    
                
                
                
                //db.editExamMetaData(ExamID, Title, School, ModuleCoordinator, ModuleCode, ExamType, ExamPeriod, ExamLevel, Semester, Year);
                
                
                
                
                
                
                
                
                
                
            }else{
                System.out.println("Error somthing when wrong with trying to load in the exam for editing");
            }
            
            
            
            
        %>
        
        
        
        
    </body>
</html>
