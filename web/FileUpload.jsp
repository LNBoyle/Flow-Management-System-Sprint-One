<%@page language="java" import="ExamWebApp.*" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
   <head>
      <title>File Uploading Form</title>
          <link href="css/Dashboard.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
   </head>
   
   <body>
         <div id="header">
            <nav class="navbar navbar-light">
                    <span class="navbar-brand">Welcome..</span>
            </nav>
            
            <a id="back" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-chevron-left"></i></a>
            <a id="home" href="HomePage.jsp" class="btn btn-blue btn-lg toggle"><i class="fa fa-home"></i></a>
            <form action="Logout.jsp" method="POST">
                <button id="logout" class="btn btn-blue btn-lg toggle" type="submit" name="submit" value="submit"><i class="fa fa-lock"></i></button>
            </form>

	</div>
       
       <div id="bodyWrapper">
       <div id="FormDiv">
      <h3>Create Exam</h3>
     Please enter details for the exam you wish to create: <br />
      <form action = "uploadServlet" method = "post"
         enctype = "multipart/form-data">
         <br />
           <label>Title: </label>
         <input type = "text" name = "Title" size = "50" required/>
         <br>
           <label>School: </label>
           <select name="School" required>
             <option value="Science and Engineering">Science and Engineering</option>
             <option value="Life Sciences">Life Sciences</option>
         </select>
            <br>
              <label>Exam Type: </label>
         <select name="ExamType"required>
             <option value="Online">Online</option>
             <option value="Paper">Paper</option>
         </select>
               <br>
              <label>Examination Period: </label>
          <select name="ExamPeriod"required>
             <option value="Main">Main (December/May)</option>
             <option value="Resit">Resit</option>
         </select>
         <br>
           <label>Module Code: </label>
         <input type = "text" name = "ModuleCode" size = "50" required/>
         <br>
           <label>Level of Study: </label>
         <select name="ExamLevel"required>
             <option value="Undergraduate">Undergraduate</option>
             <option value="Postgraduate">Postgraduate</option>
         </select>
         <br>
           <label>Exam Paper: </label>
         <input type="file" name="ExamPaper" size="50" required/>
         <br>
            <br>
           <label>Exam Solution: </label>
           <input type="file" name="ExamSolution" size="50" required/>
         <br>
         <input type = "submit"  value = "Confirm" />
      </form>
       </div>
       </div>
   </body>
   
</html>
