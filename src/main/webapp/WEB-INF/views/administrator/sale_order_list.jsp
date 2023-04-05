<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<link rel="icon" href="images/favicon.ico" type="image/ico" />
<link rel="stylesheet" type="text/css"
	href="${base }/css/product_management.css">

<title>Gentelella Alela!</title>
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>


</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Gentelella Alela!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="${base }/images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>John Doe</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/slidebar_menu.jsp"></jsp:include>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<jsp:include
						page="/WEB-INF/views/administrator/layout/menu_footer_btn.jsp"></jsp:include>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<jsp:include page="/WEB-INF/views/administrator/layout/top_nav.jsp"></jsp:include>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<h1>Danh sách sản phẩm</h1>
				<form class="form-inline" action=""
					method="get">

					<!-- tìm kiếm sản phẩm trên danh sách -->
					<div class="d-flex flex-row justify-content-between mt-4">
						<div class="d-flex flex-row">
							<input id="page" name="page" class="form-control"
								value="${saleOrderSearch.currentPage }">


							<!-- tìm kiếm theo tên email-->
							<input type="text" id="email" name="email"
								value="${saleOrderSearch.email }" class="form-control"
								placeholder="Search" autocomplete="off"
								style="margin-right: 5px;">

							

							<button type="submit" id="btnSearch" name="btnSearch"
								value="Search" class="btn btn-primary">Search</button>
						</div>
						
					</div>

					<!-- danh sách sản phẩm -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Mã HĐ</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col">Ngày tạo</th>
								<th scope="col">Trạng thái</th>
								<th scope="col">Tên khách hàng</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col">SĐT</th>
								<th scope="col">Email</th>
								<th scope="col">Xem chi tiết </th>							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrders.data}" var="saleOrder"
								varStatus="loop">
								<tr>
									<th scope="row" width="5%">${loop.index + 1}</th>
									<td>${saleOrder.code }</td>
									<td>
										<!-- định dạng tiền tệ --> <fmt:setLocale value="vi_VN"
											scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" />
									</td>
									<td>${saleOrder.createdDate }</td>
									<td><span id="_product_status_${product.id} }"> <c:choose>
												<c:when test="${saleOrder.status }">
													<input type="checkbox" checked="checked"
														readonly="readonly">
												</c:when>
												<c:otherwise>
													<input type="checkbox" readonly="readonly">
												</c:otherwise>
											</c:choose>
									</span></td>
									<td>${saleOrder.customerName }</td>
									<td>${saleOrder.customerAddress }</td>
									<td>${saleOrder.customerPhone }</td>
									<td>${saleOrder.customerEmail }</td>
									<td><a href = "${base}/admin/saleorder/list/${saleOrder.id}">Xem</a></td>
									
										
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- phân trang -->
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>

						</div>
					</div>
					<!-- /phân trang -->

				</form>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
	
		$(document).ready(function() {
			  $('#paging').pagination({
			     currentPage: ${saleOrders.currentPage},
			     items: ${saleOrders.totalItems},
			     itemsOnPage: ${saleOrders.sizeOfPage},
			     cssStyle: 'light-theme',
			     onPageClick: function(pageNumber, event) {
			         // Xử lý sự kiện click trang
			         $('#page').val(pageNumber);
			         $('#btnSearch').trigger('click'); 
			     },
			  });
			});
	</script>
</body>
</html>
