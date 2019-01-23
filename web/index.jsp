<%@page language="java" import="ExamWebApp.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Login Page For Users To Log Into The Workflow Management System">
    <meta name="author" content="Team 5">

    <link href="css/staffLogin.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">


	<title>Login</title>

</head>


<body>
    <!-- Login Form -->
    <div class="container">
        <div class="card card-container">
            <div class="text-middle-center">
                <h3>UNIVERSITY OF</h3>
                <h1>DUNDEE</h1>
                <h4>Exam Workflow Management</h4>
            </div>
            <img id="profile-img" class="profile-img-card" src="images/7176043816_dca8d26950_b.jpg" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="staffCheckLoginCredentials.jsp" method="POST">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <div>
                    <button class="btn btn-blue btn-lg" type="submit" name="submit" value="submit">Sign in</button>
                </div>
            </form>
            
            
        </div>
    </div>
 
    <script src="scripts/jquery-1.11.1.js"></script>
    <script src="scripts/staffLogin.js"></script>

</body>


</html>
