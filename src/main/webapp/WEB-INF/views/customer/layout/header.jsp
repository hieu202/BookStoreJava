<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<!--header-title-->
	<div class="header-title">
		<div class="left">
			<a href="#"><i class="fa-solid fa-circle-info"></i>Trợ giúp</a> <a
				href="#"><i class="fa-regular fa-newspaper"></i>Tin tức</a> <a
				href="#"><i class="fa-solid fa-tag"></i>Khuyến mãi</a>
		</div>
		<div class="right">
			<a href="#"><i class="fa-solid fa-location-dot"></i>46 Đường Xuân
				Phương Quận Nam Từ Liêm Hà Nội</a>


			<c:choose>
				<c:when test="${isLogined}">
					<!-- Nội dung sẽ được thực thi nếu biến myVariable có giá trị bằng 'someValue' -->
					<a href="${base }/logout"><i
						class="fa-solid fa-right-to-bracket"></i>Đăng xuất</a>

				</c:when>
				<c:otherwise>

					<a href="${base }/login"><i
						class="fa-solid fa-right-to-bracket"></i>Đăng nhập</a>
					<a href="${base }/regiter"><i class="fa-solid fa-address-card"></i>Đăng
						ký</a> 
    </c:otherwise>
			</c:choose>
		</div>
	</div>
	<!--/header-title-->
	<!--header-body-->
	<div class="header-body">
		<div class="left">
			<div class="logo">
				<a href="${base }/home"><img src="${base }/images/logo.jpg.png" width="140px"
					height="48px" alt="logo"></a>
			</div>
			<div class="header-search">
				<input class="button" type="button" value="Tất cả"> <input
					class="text" type="text" placeholder="Bạn cần tìm gì?"> <i
					class="fa-solid fa-magnifying-glass"></i>
			</div>
		</div>
		<div class="right">
			<a href="#"><i class="fa-solid fa-phone-volume"></i>0369028719</a> <a
				href="#"><i class="fa-regular fa-bell"></i>Thông báo</a> <a
				href="${base }/cart"><i id="soluongsanphamtronggiohang"
				class="fa-solid fa-cart-shopping">(${ TongSoLuongSanPhamTrongGioHang})</i>Giỏ
				hàng</a>
		</div>
	</div>
	<!--/header-body-->
</div>