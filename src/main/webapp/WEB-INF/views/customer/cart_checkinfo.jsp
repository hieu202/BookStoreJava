<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
	xmlns:fmt="http://www.springframework.org/schema/util"
	xmlns:numbers="http://www.decimalformat.org">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bán sách online</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" href="${base }/css/style.css">
<link rel="stylesheet"
	href="fonts/fontawesome-free-6.2.1-web/css/all.min.css">
<link rel="stylesheet" href="${base }/css/styles.css">



</head>
<body>
	<!--header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!--/header-->

	<!-- Danh sách sản phẩm trong giỏ hàng -->
	<div class="middle">
		<!-- form cho việc thanh toán -->
		<form action="" method="post">

			<div class="row py-5 p-4 bg-white rounded shadow-sm">
				<div class="col-lg-6">
					<!-- <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div> -->
					<div
						class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông
						tin khách hàng</div>
					<div class="p-4">

						<c:choose>
							<c:when test="${isLogined }">
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerFullName">Họ và tên khách hàng</label> <input
										type="text" class="form-control" id="customerFullName"
										name="customerFullName" value="${userLogined.username }"
										placeholder="Full name">
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerEmail">Địa chỉ Email</label> <input
										type="email" class="form-control" id="customerEmail"
										name="customerEmail" value="${userLogined.email }"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerPhone">Phone</label> <input type="tel"
										class="form-control" id="customerPhone" name="customerPhone"
										value="${userLogined.phone }" placeholder="Phone">
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerAddress">Địa chỉ giao hàng</label> <input
										type="text" class="form-control" id="customerAddress"
										name="customerAddress"
										value="${userLogined.shippingAddress } " placeholder="Address">
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerPhone">Họ và tên khách hàng</label> <input
										type="text" class="form-control" id="customerFullName"
										name="customerFullName" placeholder="Full name">
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerEmail">Địa chỉ Email</label> <input
										type="email" class="form-control" id="customerEmail"
										name="customerEmail" placeholder="Enter email"> <small
										id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerPhone">Phone</label> <input type="tel"
										class="form-control" id="customerPhone" name="customerPhone"
										placeholder="Phone">
								</div>
								<div class="form-group" style="margin-bottom: 5px;">
									<label for="customerAddress">Địa chỉ giao hàng</label> <input
										type="text" class="form-control" id="customerAddress"
										name="customerAddress" placeholder="Address">
								</div>
							</c:otherwise>
						</c:choose>


					</div>
				</div>
				<div class="col-lg-6">
					<div
						class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông
						tin thanh toán</div>
					<div class="p-4">
						<p class="font-italic mb-4">Shipping and additional costs are
							calculated based on values you have entered.</p>
						<ul class="list-unstyled mb-4">
							<li class="d-flex justify-content-between py-3 border-bottom"><strong
								class="text-muted">Order Subtotal </strong><strong><fmt:setLocale
										value="vi_VN" /> <fmt:setBundle
										basename="com.example.myapp.resources.Messages" /> <fmt:formatNumber
										type="currency" currencySymbol="đ" value="${totalPrice}" /></strong></li>
							<li class="d-flex justify-content-between py-3 border-bottom"><strong
								class="text-muted">Shipping and handling</strong><strong><fmt:setLocale
										value="vi_VN" /> <fmt:setBundle
										basename="com.example.myapp.resources.Messages" /> <fmt:formatNumber
										type="currency" currencySymbol="đ" value="15000" /></strong></li>
							<li class="d-flex justify-content-between py-3 border-bottom">
								<strong class="text-muted">Tax</strong> <strong> <fmt:setLocale
										value="vi_VN" /> <fmt:setBundle
										basename="com.example.myapp.resources.Messages" /> <c:set
										var="totalPriceWithTax"
										value="${(totalPrice + 15000) * 1 / 100}" /> <fmt:formatNumber
										type="currency" currencySymbol="đ"
										value="${totalPriceWithTax.intValue()}" />
							</strong>
							</li>
							<li class="d-flex justify-content-between py-3 border-bottom">
								<strong class="text-muted">Total</strong>
								<h5 class="font-weight-bold totalPrice">
									<fmt:setLocale value="vi_VN" />
									<fmt:setBundle basename="com.example.myapp.resources.Messages" />
									<c:set var="totalPriceEnd"
										value="${(totalPrice + 15000 + totalPriceWithTax)}" />
									<input type="hidden" name="totalPriceEnd" id="totalPriceEnd"
										value=" ${totalPriceEnd} " />
									<fmt:formatNumber type='currency' currencySymbol='đ' value='${totalPriceEnd}' />
								</h5>
							</li>
						</ul>
						<button type="submit"
							class="btn btn-dark rounded-pill py-2 btn-block">Procceed
							to checkout</button>
					</div>
				</div>
			</div>

		</form>
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- /footer -->


	<script src="${base }/js/jquery-3.6.1.js"></script>
	<script src="${base }/js/style.js"></script>

</body>
</html>