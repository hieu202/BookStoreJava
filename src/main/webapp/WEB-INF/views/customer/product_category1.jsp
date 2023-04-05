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
<!-- pagination -->
<link href="${base }/css/simplePagination.css" rel="stylesheet">
<link rel="stylesheet"
	href="${base }/fonts/fontawesome-free-6.2.1-web/css/all.min.css">



</head>
<body>
	<!--header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!--/header-->

	<!--middle-category-->
	<div class="middle-category">
		<div class="title">
			<a class="total" href="#">Trang chủ > </a> <a class="inside" href="#">
				${categoryByID.name}</a>
		</div>

		<div class="body">
			<div class="left">
				<div class="name">
					<h3>
						<a href="${base }/category/${categoryByID.id}">${categoryByID.name}</a>
					</h3>
					<ul>
					<c:forEach items="${cateoryBYParentID}" var="cateoryBYParentID">
													<li><a href="${base }/category/${categoryByID.id}/${cateoryBYParentID.id}">${ cateoryBYParentID.name}</a></li>

						</c:forEach>
						
					</ul>
				</div>

				<div class="price">
					<h4 class="check-box-title">Giá</h4>
					<ul>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">0đ - 150,000đ</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">150,000đ - 300,000đ</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">300,000đ - 500,000đ</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">500,000đ - 700,000đ</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">700000đ - Trở lên</li>

					</ul>
				</div>

				<div class="Age">
					<h4 class="check-box-title">Độ tuổi</h4>
					<ul>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">18+</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">15 - 18</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">12 -15</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">6 - 12</li>
						<li class="check-box"><input class="check" type="checkbox"
							name="" id="">0 -6</li>

					</ul>
				</div>
			</div>

			<div class="right">
				<form class="form-inline" action=""
					method="get">

					<div
						class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 first ul">
						<c:forEach items="${products.data }" var="product">
							<li class="col-category"><img
								src="${base }/upload/${product.avatar}" height="224.6px" alt="Ảnh 1"
								class="width-100">
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



					<!-- phân trang -->
					<input id="page" name="page" class="form-control"
						value="${productSearch.currentPage }">
					<button type="submit" id="btnSearch" name="btnSearch"
						value="Search" class="btn btn-primary">Search</button>
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>

						</div>
					</div>

					<!-- /phân trang -->
					</form>
			</div>

		</div>
	</div>
	<!--middle-category-->

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

	<!-- pagination -->
	<script src="${base }/js/jquery.simplePagination.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			  $('#paging').pagination({
			     currentPage: ${products.currentPage},
			     items: ${products.totalItems},
			     itemsOnPage: ${products.sizeOfPage},
			     cssStyle: 'light-theme',
			     onPageClick: function(pageNumber, event) {
			         // Xử lý sự kiện click trang
			    	 $('#page').val(pageNumber);
			         
			         // Trigger the 'click' event on the search button to reload the search results with the new page number
			         $('#btnSearch').trigger('click'); 
			     },
			  });
			});
		var pagingElement = document.getElementById("page");
		// lấy thẻ có id "btnSearch"
		var btnSearchElement = document.getElementById("btnSearch");

		// ẩn thẻ có id "paging"
		pagingElement.style.display = "none";
		// ẩn thẻ có id "btnSearch"
		btnSearchElement.style.display = "none";
	</script>
</body>
</html>