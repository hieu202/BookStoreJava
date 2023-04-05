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
<link rel="stylesheet" href="${base }/css/style.css">
<link rel="stylesheet"
	href="${base }/fonts/fontawesome-free-6.2.1-web/css/all.min.css">



</head>
<body>
	<!--header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!--/header-->
	<!--middle-detail-->
	<div class="middle-detail">
		<div class="title">
			<a href="#">Trang chủ ></a> <a href="#">Sách trong nước></a> <a
				href="#">Sách giá khoa - tham khảo</a>
		</div>

		<div class="body">
			<div class="left">
				<div class="img">

					<ul>
						<c:forEach items="${product.productImages }" var="productImage">
							<li><img alt="" style="width: 76px; height: 76px;"
								src="${base }/upload/${productImage.path}"></li>

						</c:forEach>
					</ul>
					<img src="${base }/upload/${product.avatar}" alt="" width="388px"
						height="388px">
				</div>
				<div class="button">
					<div class="add" onclick="AddToCart('${base }', ${product.id }, 1)">
						<i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng
					</div>
					<div class="buy">Mua ngay</div>
				</div>
			</div>
			<div class="right">
				<div class="name">
					<h3>${product.title }</h3>
				</div>
				<div class="content">
					<div class="product">
						Nhà xuất bản: <b>${product.publish } </b>
						<div class="author" style="font-size: 14px; color: black">
							Tác giả: <b>${product.author }</b>
						</div>
					</div>
					<div class="format">
						Hình thức bìa: <b>${product.cover_form }</b>
					</div>
					<div class="format">
						Nhà cung cấp: <b>${product.publish }</b>
					</div>
				</div>
				<div class="price">
					<h1>180,000đ</h1>
					Chính sách đổi trả : Đổi trả sản phẩm trong 30 ngày

				</div>

			</div>
		</div>
	</div>
	<!--/middle-detail-->

	<!--description-->
	<div class="description">
		<h1>Thông tin sản phẩm</h1>
		<table style="width: 900px; height: 500px;">
			<tr>
				<td>Mã hàng:</td>
				<td>3300000015422</td>
			</tr>
			<tr>
				<td>Cấp Độ/ Lớp:</td>
				<td>Lớp 12</td>
			</tr>
			<tr>
				<td>Cấp học:</td>
				<td>Cấp 3</td>
			</tr>
			<tr>
				<td>Nhà cung cấp:</td>
				<td>Nhà xuất bản giáo dục</td>
			</tr>
			<tr>
				<td>Tác giả:</td>
				<td>Bộ giáo dục và đào tạo</td>
			</tr>
			<tr>
				<td>NXB:</td>
				<td>NXB giáo dục Việt Nam</td>
			</tr>
			<tr>
				<td>Năm XB:</td>
				<td>2022</td>
			</tr>
			<tr>
				<td>Ngôn ngữ:</td>
				<td>Tiếng Việt</td>
			</tr>
			<tr>
				<td>Trọng lượng (gr)</td>
				<td>2975</td>
			</tr>
			<tr>
				<td>Kích Thước Bao Bì</td>
				<td>24 x 17 x 8.4 cm</td>
			</tr>
			<tr>
				<td>Hình thức</td>
				<td>Bìa mềm</td>
			</tr>

		</table>
	</div>
	<!--/description-->

	<div class="footer">
		<div class="top">
			<i class="fa-solid fa-envelope"></i>
			<h3>ĐĂNG KÝ NHẬN BẢN TIN</h3>
			<input class="text" type="text"
				placeholder="Nhập địa chỉ email của bạn"> <input
				class="button" type="button" value="Đăng ký">
		</div>

		<div class="bottom">
			<div class="left">
				<a class=title href="#">BookStore.com.vn</a>
				<p>Ngõ 46 Đường Xuân Phương Quận Nam Từ Liêm Hà Nội</p>
				<p>Công Ty Cổ Phần Phát Hành Sách TP Hà Nội</p>
				<p>60 - 62 Lê Lợi, Quận 1, TP. HCM, Việt Nam</p>
				<p>BookStore nhận đặt hàng trực tuyến và giao hàng tận nơi.
					KHÔNG hỗ trợ đặt mua và nhận hàng trực tiếp tại văn phòng cũng như
					tất cả Hệ Thống Fahasa trên toàn quốc.</p>
				<img src="images/footer-1.png" alt="" width="100px" height="31px">
				<ul>
					<li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
					<li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
					<li><a href="#"><i class="fa-brands fa-tumblr"></i></a></li>
					<li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa-brands fa-pinterest"></i></a></li>
				</ul>
			</div>

			<div class="right">
				<div class="right-first">
					<ul class="first1">
						<li>
							<div class="title">
								<h3>DỊCH VỤ</h3>
							</div>
							<div class="content">
								<ul>
									<li><a href="#">Điều khoản sử dụng</a></li>
									<li><a href="#">Chính sách bảo mật thông tin cá nhân</a></li>
									<li><a href="#">Chính sách bảo mật thanh toán</a></li>
									<li><a href="#">Giới thiệu BookStore</a></li>
									<li><a href="#">Hệ thống trung tâm nhà sách</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="title">
								<h3>HỖ TRỢ</h3>
							</div>
							<div class="content">
								<ul>
									<li><a href="#">Điều khoản sử dụng</a></li>
									<li><a href="#">Chính sách bảo mật thông tin cá nhân</a></li>
									<li><a href="#">Chính sách bảo mật thanh toán</a></li>
									<li><a href="#">Giới thiệu BookStore</a></li>
									<li><a href="#">Hệ thống trung tâm nhà sách</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="title">
								<h3>TÀI KHOẢN CỦA TÔI</h3>
							</div>
							<div class="content">
								<ul>
									<li><a href="#">Điều khoản sử dụng</a></li>
									<li><a href="#">Chính sách bảo mật thông tin cá nhân</a></li>
									<li><a href="#">Chính sách bảo mật thanh toán</a></li>
									<li><a href="#">Giới thiệu BookStore</a></li>
									<li><a href="#">Hệ thống trung tâm nhà sách</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>

				<div class="right-second">
					<h3>LIÊN HỆ</h3>
					<ul>
						<li><a href="#"><i class="fa-solid fa-location-dot"></i>Ngõ
								46 Đường Xuân Phương Nam Từ Liêm Hà Nội</a></li>
						<li><a href="#"><i class="fa-solid fa-envelope"></i>hieubvc159@gmail.com</a></li>
						<li><a href="#"><i class="fa-solid fa-phone"></i>0369028719</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="footer-end">Giấy chứng nhận Đăng ký Kinh doanh số
			0304132047 do Sở Kế hoạch và Đầu tư Thành phố Hồ Chí Minh cấp ngày
			20/12/2005, đăng ký thay đổi lần thứ 10, ngày 20/05/2022.</div>
	</div>
	<script src="${base }/js/jquery-3.6.1.js"></script>
	<script src="${base }/js/style.js"></script>
	<script type="text/javascript">
    function AddToCart(_baseUrl, _productId, _quanlity) {
    	// tạo javascript object để binding với data bên phía controller  
    	var requestBody = {
    		productId: _productId,
    		quanlity: _quanlity
    	};
    	
    	// $ === jQuery
    	// json == javascript object
    	jQuery.ajax({
    		url: _baseUrl + "/ajax/addToCart", 	   //->request mapping định nghĩa bên controller
    		type: "post",					   //-> method type của Request Mapping	
    		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
    		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json
    	
    		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
    		success: function(jsonResult) {    // gọi ajax thành công
    			/* alert(jsonResult.code + " - " + jsonResult.status + ", Số lượng trong giỏ hàng là: " + jsonResult.totalItems); */
    			$("#soluongsanphamtronggiohang").html(jsonResult.totalItems);
    		},
    		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
    			alert("error");
    		}
    	});
    }
    
    
    
    </script>
</body>
</html>