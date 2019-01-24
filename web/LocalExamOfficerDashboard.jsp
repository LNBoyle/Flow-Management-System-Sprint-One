<%-- 
    Document   : LocalExamOfficerDashboard
    Created on : 23-Jan-2019, 12:26:31
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
        <link href="css/LocalExamOfficer.css" rel="stylesheet" type="text/css" >
        <title>Welcome Local Exam Officer</title>
    </head>
    <body>
        <div class="topnav">
            <button type = "Home" name = "Home"> Home</button>
            <button type = "Lock" name = "Lock"> Lock</button>
            <button type = "Back" name = "Back"> Back</button>
            <h1 style="font-size:17px;float:right;padding:0px 10px;">Welcome...</h1>
        </div>
        
        <input type="button" onclick="location.href='Assignexam.jsp';" value="View Account" />
        <input type="button" onclick="location.href='CreateAccount.jsp';" value="Create Account" />   
        <input type="button" onclick="location.href='Assignexam.jsp';" value="Update Account" />
        <input type="button" onclick="location.href='Assignexam.jsp';" value="Assign Exams" />  
        