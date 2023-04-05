<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bán sách online</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" href="${base }/css/style.css">
<link rel="stylesheet" href="${base }/css/styles.css">

<link rel="stylesheet"
	href="fonts/fontawesome-free-6.2.1-web/css/all.min.css">



</head>
<body>
	<!--header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!--/header-->

	<!--middle-->
	<div class="middle">
		<!--middle-top-->
		<div class="middle-top">
			<div class="menu">
				<div class="title">
					<i class="fa-solid fa-bars"></i> Danh mục sản phẩm <i
						class="fa-solid fa-caret-down"></i>
				</div>
				<div class="list">
					<ul>
						<c:forEach items="${parentCategories}" var="parentCategories">
							<li><a href="${base }/category/${parentCategories.id}"><i
									class="fa-solid fa-book"></i>${parentCategories.name}</a></li>
						</c:forEach>
						
					</ul>
				</div>
			</div>
			<div class="slide">
				<img src="images/slide-1.jpg" alt="" id="show-img">
				<div class="choice">
					<ul>
						<li id="slide-1" class="red" onclick="changeImage('slide-1')"><a
							href="#">Sách hay trong tuần</a></li>
						<li id="slide-2" onclick="changeImage('slide-2')"><a href="#">Giảm
								giá tột đỉnh</a></li>
						<li id="slide-3" onclick="changeImage('slide-3')"><a href="#">SALE</a></li>
						<li id="slide-4" onclick="changeImage('slide-4')"><a href="#">Bút
								Cọ New Arrival</a></li>
						<li id="slide-5" onclick="changeImage('slide-5')"><a href="#">Tủ
								sách suối thơm</a></li>
						<li id="slide-6" onclick="changeImage('slide-6')"><a href="#">Tủ
								sách thiếu nhi</a></li>
						<li id="slide-7" onclick="changeImage('slide-7')"><a href="#">Nobel
								văn học 2022</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--middle-top-->
		<!--voucher-->
		<div class="voucher">
			<ul>
				<li><a href="#"><img src="images/voucher-1.jpg" alt=""></a></li>
				<li><a href="#"><img src="images/voucher-2.jpg" alt=""></a></li>
				<li><a href="#"><img src="images/voucher-3.jpg" alt=""></a></li>
				<li><a href="#"><img src="images/voucher-4.jpg" alt=""></a></li>

			</ul>
		</div>
		<!--/voucher-->
		<!--trend-->
		<div class="trend">
			<!--trend-title-->
			<div class="trend-title">
				<div class="title-bar">
					<i class="fa-solid fa-fire"></i> XU HƯỚNG MUA SẮM
				</div>
				<div class="tabs">
					<ul>
						<li class="tab-item active">Xu Hướng Theo Ngày</li>
						<li class="tab-item">Sách HOT - Giảm Sốc</li>
						<li class="tab-item">Bestseller Ngoại Văn</li>
					</ul>
				</div>
			</div>
			<!--trend-title-->
			<!--tab-content-->
			<div class="tab-content">
				<div class="tab-pane active">

					<div
						class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 first ul">


						<c:forEach items="${products}" var="product" begin="0" end="9">
							<li class="col mb-5"><img
								src="${base }/upload/${product.avatar}" height="224.6"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="${base }/home/${product.id}">${product.title }</a>
								</div>
								<div class="author">
									<a href="#">${product.author }</a>
								</div>
								<div class="new-price">
									<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${product.priceSale }" type="currency" />
								</div>
								<div class="old-price">
									<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${product.price }" type="currency" />
								</div> <c:if test="${product.percent == 0 || product.percent == null }">
											
								</c:if> <c:if test="${!(product.percent == 0 || product.percent == null) }">
									<div class="sale">${product.percent }%</div>
								</c:if></li>
						</c:forEach>

					</div>

				</div>


				<div class="tab-pane">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/trend-day-1.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-2.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-4.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-5.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
					</div>

					<div class="second">
						<ul class="row">
							<li class="col"><img src="images/trend-day-5.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-6.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-8.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-10.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-10.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
					</div>
					<div class="bonus">Xem thêm</div>
				</div>
				<div class="tab-pane">
					<div class="first">
						<ul class="row">
							<c:forEach items="${products}" var="product" begin="0" end="4">
								<li class="col"><img src="images/trend-day-1.jpg"
									alt="Ảnh 2" class="width-100">
									<div>
										<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
											Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy
											Giáo Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý
											Cô Nóng Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2
											Cuốn)</a>
									</div>
									<div class="author">
										<a href="#">${product.author }</a>
									</div>
									<div class="new-price">88.000đ</div></li>
							</c:forEach>

						</ul>
					</div>

					<div class="second">
						<ul class="row">
							<li class="col"><img src="images/trend-day-6.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-7.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-8.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-9.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-10.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>
			</div>
			<!--/tab-content-->
		</div>
		<!--/trend-->

		<!--manga-->
		<div class="manga">
			<div class="tabs">
				<ul>
					<li class="tab-item1 active">Manga mới</li>
					<li class="tab-item1">Top Manga</li>
					<li class="tab-item1">Light Novel mới</li>
					<li class="tab-item1">Top Light Novel</li>

				</ul>
			</div>

			<div class="tab-content">
				<div class="tab-pane1 active">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/trend-day-2.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-1.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-5.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-7.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane1">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/trend-day-6.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-7.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-5.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-7.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane1">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-4.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-5.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-7.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane1">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/trend-day-2.jpg"
								alt="Ảnh 1" class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
							<li class="col"><img src="images/trend-day-4.jpg"
								alt="Ảnh 2" class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-3.jpg"
								alt="Ảnh 3" class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/trend-day-8.jpg"
								alt="Ảnh 4" class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">15%</div></li>
							<li class="col"><a href="#"><img
									src="images/trend-day-7.jpg" alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div>
								<div class="old-price">118.000đ</div>
								<div class="sale">25%</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>
			</div>
		</div>
		<!--/manga-->

		<!--toy-->
		<div class="toy">
			<div class="tabs">
				<ul>
					<li class="tab-item2 active">Đồ chơi mới</li>
					<li class="tab-item2">Đồ chơi giá sốc</li>
					<li class="tab-item2">Board game các loại</li>
					<li class="tab-item2">Đồ chơi giáo dục</li>

				</ul>
			</div>

			<div class="tab-content">
				<div class="tab-pane2 active">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/toy-1.jpg" alt="Ảnh 1"
								class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-2.jpg" alt="Ảnh 2"
								class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-3.jpg" alt="Ảnh 3"
								class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-4.jpg" alt="Ảnh 4"
								class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><a href="#"><img src="images/toy-5.jpg"
									alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane2">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/toy-4.jpg" alt="Ảnh 1"
								class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-3.jpg" alt="Ảnh 2"
								class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-2.jpg" alt="Ảnh 3"
								class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-4.jpg" alt="Ảnh 4"
								class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><a href="#"><img src="images/toy-5.jpg"
									alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane2">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/toy-1.jpg" alt="Ảnh 1"
								class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-5.jpg" alt="Ảnh 2"
								class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-4.jpg" alt="Ảnh 3"
								class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-3.jpg" alt="Ảnh 4"
								class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><a href="#"><img src="images/toy-5.jpg"
									alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>

				<div class="tab-pane2">
					<div class="first">
						<ul class="row">
							<li class="col"><img src="images/toy-1.jpg" alt="Ảnh 1"
								class="width-100">
								<div>
									<a class="name-book" href="#">Gia Định Là Nhớ - Sài Gòn Là
										Thương</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-5.jpg" alt="Ảnh 2"
								class="width-100">
								<div>
									<a class="name-book" href="#">Bộ Sách Tri Ân Nhà Giáo:
										Escalante - Người Thầy Xuất Sắc Nhất Nước Mỹ - Người Thầy Giáo
										Giúp 400 Học Sinh Vào Các Trường Danh Tiếng Nhất + Quý Cô Nóng
										Nảy - Hành Trình Khai Mở Tâm Trí Helen Kenller (Bộ 2 Cuốn)</a>
								</div>
								<div class="author">
									<a href="#">Jay Mathews, Sarah Miller</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-1.jpg" alt="Ảnh 3"
								class="width-100">
								<div>
									<a class="name-book" href="#">Blue Flag - Tập 7 - Tặng Kèm
										Bookmark PVC</a>
								</div>
								<div class="author">
									<a href="#">Kaito</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><img src="images/toy-2.jpg" alt="Ảnh 4"
								class="width-100">
								<div>
									<a class="name-book" href="#">Lễ tốt nghiệp sinh tử</a>
								</div>
								<div class="author">
									<a href="#">Cù Mai Công</a>
								</div>
								<div class="new-price">88.000đ</div></li>
							<li class="col"><a href="#"><img src="images/toy-3.jpg"
									alt="Ảnh 1" class="width-100"></a>
								<div>
									<a class="name-book" href="#">Gửi em người bất tử</a>
								</div>
								<div class="author">
									<a href="#">Yoshitoki oima</a>
								</div>
								<div class="new-price">88.000đ</div></li>
						</ul>
						<div class="bonus">Xem thêm</div>
					</div>
				</div>
			</div>
		</div>
		<!--toy-->
	</div>
	<!--/middle-->

	<!--ecaware-->
	<div class="ecaware">
		<a href="#">BookStore.vn</a> <a href="#">Top 3 website TMĐT ngành
			sách tiêu biểu</a>
	</div>
	<!--/ecaware-->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- /footer -->


	<script src="${base }/js/jquery-3.6.1.js"></script>
	<script src="${base }/js/style.js"></script>
</body>
</html>