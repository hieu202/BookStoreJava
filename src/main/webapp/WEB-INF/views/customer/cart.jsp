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
		<c:choose>
			<c:when test="${TongSoLuongSanPhamTrongGioHang == 0}">
				<h1>Chưa có sản phẩm trong giỏ hàng</h1>
			</c:when>
			<c:otherwise>
			<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col" class="border-0 bg-light">
							<div class="p-2 px-3 text-uppercase">Product</div>
						</th>
						<th scope="col" class="border-0 bg-light">
							<div class="py-2 text-uppercase">Price</div>
						</th>
						<th scope="col" class="border-0 bg-light">
							<div class="py-2 text-uppercase">Quantity</div>
						</th>
						<th scope="col" class="border-0 bg-light">
							<div class="py-2 text-uppercase">Remove</div>
						</th>
					</tr>
				</thead>
				<tbody>



					<!-- hiển thị danh sách sản phẩm trong giỏ hàng -->
					<c:forEach items="${cart.cartItems }" var="ci">
						<tr>
							<th scope="row" class="border-0">
								<div class="p-2">
									<img
										src="${base }/upload/${ci.avatar}"
										alt="" width="70" class="img-fluid rounded shadow-sm">
									<div class="ml-3 d-inline-block align-middle">
										<h5 class="mb-0">
											<a href="#" class="text-dark d-inline-block align-middle">
												${ci.productName } </a>
										</h5>
										<span
											class="text-muted font-weight-normal font-italic d-block">Category:
											Watches</span>
									</div>
								</div>
							</th>
							<td class="border-0 align-middle"><fmt:setLocale
									value="vi_VN" /> <strong><fmt:formatNumber
										value="${ci.priceUnit }" type="currency" /></strong></td>
							<td class="border-0 align-middle">
								<button
									onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)"
									value="-">-</button> <strong><span
									id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>
								<button
									onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)"
									value="+">+</button>
							</td>
							<td onclick="DeleteCartItem('${base }', ${ci.productId})"
								class="border-0 align-middle"><a href="#" class="text-dark"><i
									class="fa fa-trash">Xóa</i></a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="bonus"><a href="${base }/cart/checkInfo">Tiếp tục</a></div>
		</div>
			</c:otherwise>
		</c:choose>
		
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<!-- /footer -->


	<script src="${base }/js/jquery-3.6.1.js"></script>
	<script src="${base }/js/style.js"></script>
	<script type="text/javascript">
	function UpdateQuanlityCart(_baseUrl, _productId, _quanlity) {
    	// tạo javascript object để binding với data bên phía controller  
    	var requestBody = {
    		productId: _productId,
    		quanlity: _quanlity
    	};
    	
    	// $ === jQuery
    	// json == javascript object
    	jQuery.ajax({
    		url: _baseUrl + "/ajax/updateToCart", 	   //->request mapping định nghĩa bên controller
    		type: "post",					   //-> method type của Request Mapping	
    		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
    		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json
    	
    		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
    		success: function(jsonResult) {    // gọi ajax thành công
    			/* alert(jsonResult.code + " - " + jsonResult.status + ", Số lượng trong giỏ hàng là: " + jsonResult.totalItems); */
     			/* $("#quanlity_" + _productId).html(jsonResult.currentProductQuality); */
    			 location.reload(true);
     		},
    		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
    			alert("error");
    		}
    	});
    }
	
	
	function DeleteCartItem(_baseUrl, _productId) {
    	// tạo javascript object để binding với data bên phía controller  
    	var requestBody = {
    		productId: _productId
    		
    	};
    	
    	// $ === jQuery
    	// json == javascript object
    	jQuery.ajax({
    		url: _baseUrl + "/ajax/deleteToCart", 	   //->request mapping định nghĩa bên controller
    		type: "delete",					   //-> method type của Request Mapping	
    		contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
    		data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json
    	
    		dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
    		success: function(jsonResult) {    // gọi ajax thành công
    			/* alert(jsonResult.code + " - " + jsonResult.status + ", Số lượng trong giỏ hàng là: " + jsonResult.totalItems); */
     			/* $("#quanlity_" + _productId).html(jsonResult.currentProductQuality); */
    			 location.reload(true);
     		},
    		error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
   			 
    		}
    	});
    }
	</script>
</body>
</html>