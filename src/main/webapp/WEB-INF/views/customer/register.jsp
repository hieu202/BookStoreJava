<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Trang đăng ký</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<style>
	.container {
	width: 50%;
	margin: 0 auto;
}

h2 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 10px;
}

input[type="text"], input[type="email"], input[type="password"] {
	margin-bottom: 10px;
	padding: 5px;
	border: none;
	border-radius: 3px;
	box-shadow: 0px 0px 3px grey;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
	
</style>
<body>
	<div class="container">
		<h2>Đăng ký</h2>
		<form action="${base }/regiter/addUser" method="post">
			<label for="username">Tên người dùng:</label>
			<input type="text" id="username" name="username"><br>
			
			<label for="email">Email:</label>
			<input type="email" id="email" name="email"><br>
			
			<label for="shippingAddress">Địa chỉ nhận hàng:</label>
			<input type="text" id="shippingAddress" name="shippingAddress"><br>
			
			<label for="phone">Phone:</label>
			<input type="text" id="phone" name="phone"><br>
			
			<label for="password">Mật khẩu:</label>
			<input type="password" id="password" name="password"><br>

			<label for="confirm_password">Xác nhận mật khẩu:</label>
			<input type="password" id="confirm_password" name="confirm_password"><br>

			<input type="submit" value="Đăng ký">
		</form>
	</div>
</body>
</html>
