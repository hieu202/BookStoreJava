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
				<form class="form-inline" action="${base }/admin/product/list"
					method="get">

					<!-- tìm kiếm sản phẩm trên danh sách -->
					<div class="d-flex flex-row justify-content-between mt-4">
						<div class="d-flex flex-row">
							<input id="page" name="page" class="form-control"
								value="${productSearch.currentPage }">


							<!-- tìm kiếm theo tên sản phẩm -->
							<input type="text" id="keyword" name="keyword"
								value="${productSearch.keyword }" class="form-control"
								placeholder="Search" autocomplete="off"
								style="margin-right: 5px;">

							<!-- tìm kiếm theo danh mục sản phẩm -->
							<select class="form-control" name="categoryId" id="categoryId"
								style="margin-right: 5px;">
								<option value="0">All</option>

								<c:forEach items="${categories1}" var="category">


									<c:if test="${category.id == productSearch.categoryId}">
										<option selected="selected" value="${category.id}">${category.name}</option>
									</c:if>
									<c:if test="${category.id != productSearch.categoryId}">
										<option value="${category.id}">${category.name}</option>
									</c:if>


								</c:forEach>
							</select>

							<button type="submit" id="btnSearch" name="btnSearch"
								value="Search" class="btn btn-primary">Search</button>
						</div>
						<div>
							<a class="btn btn-outline-primary mb-1"
								href="${base }/admin/product/management/" role="button"> Add
								New </a>
						</div>
					</div>

					<!-- danh sách sản phẩm -->
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Title</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Status</th>
								<th scope="col">Avatar</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products.data}" var="product"
								varStatus="loop">
								<tr>
									<th scope="row" width="5%">${loop.index + 1}</th>
									<td>${product.title }</td>
									<td>
										<!-- định dạng tiền tệ --> <fmt:setLocale value="vi_VN"
											scope="session" /> <fmt:formatNumber
											value="${product.priceSale }" type="currency" />
									</td>
									<td>${product.categories.name }</td>
									<td><span id="_product_status_${product.id} }"> <c:choose>
												<c:when test="${product.status }">
													<input type="checkbox" checked="checked"
														readonly="readonly">
												</c:when>
												<c:otherwise>
													<input type="checkbox" readonly="readonly">
												</c:otherwise>
											</c:choose>
									</span></td>
									<td><img src="${base }/upload/${product.avatar}"
										width="100" height="100"></td>
									<td width="15%">
										<div>
											<a class="btn btn-primary"
												href="${base }/admin/product/management/${product.id}"
												role="button">Edit</a> <a class="btn btn-danger"
												role="button" onclick="DeleteProduct(${product.id});">Delete</a>
										</div>
									</td>
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
			     currentPage: ${products.currentPage},
			     items: ${products.totalItems},
			     itemsOnPage: ${products.sizeOfPage},
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
