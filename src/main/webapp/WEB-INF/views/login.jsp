<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
		body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

form {
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	max-width: 500px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"] {
	display: block;
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

input[type="submit"] {
	display: block;
	margin: 0 auto;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}
	</style>
</head>
<body>
	<form method="POST" action="${base }/login_processing_url">
		<h2>Login</h2>
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" required>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required>
		<input type="submit" value="Login">
	</form>
</body>
</html>