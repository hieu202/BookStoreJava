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
				<sf:form method="post"
					action="${base}/admin/product/management/saveOrUpdate"
					modelAttribute="product" enctype="multipart/form-data">
					<div class="form-group mb-2">
						<label for="productId">Product Id</label>
						<sf:input path="id" id="productId" class="form-control"></sf:input>
					</div>

					<div class="form-group mb-2">
						<label for="category">Category (required)</label>
						<sf:select path="categories.id" class="form-control" id="category">
							<sf:options items="${categories1 }" itemValue="id"
								itemLabel="name" />
						</sf:select>
					</div>

					<div class="form-group mb-2">
						<label for="title">Title (required)</label>
						<sf:input path="title" autocomplete="off" type="text"
							class="form-control" id="title" placeholder="Title"
							required="required"></sf:input>
					</div>

					<div class="form-group mb-2">
						<label for="price">Price (required)</label>
						<sf:input type="number" autocomplete="off" path="price"
							class="form-control" id="price" placeholder="Price"
							required="required"></sf:input>
					</div>
					<div class="form-group mb-2">
						<label for="percent">Percent (required)</label>
						<sf:input type="number" autocomplete="off" path="percent"
							class="form-control" id="percent" placeholder="Percent"></sf:input>
					</div>
					<div class="form-group mb-2">
						<label for="priceSale">Price Sale </label>
						<sf:input type="number" autocomplete="off" path="priceSale"
							class="form-control" id="priceSale" placeholder="Price sale"
							readonly="true"></sf:input>
					</div>

					<div class="form-group mb-2">
						<label for="short_description">Description (required)</label>
						<sf:textarea autocomplete="off" path="shortDes"
							class="form-control" placeholder="Short Description"
							id="short_description" rows="3" required="required"></sf:textarea>
					</div>

					<div class="form-group mb-2">
						<label for="detail_description">Details (required)</label>
						<sf:textarea autocomplete="off" path="details"
							class="form-control summernote" id="detail_description" rows="3"
							required="required"></sf:textarea>
					</div>
					<div class="form-group mb-2">
						<label for="author">Author (required)</label>
						<sf:input path="author" autocomplete="off" type="text"
							class="form-control" id="author" placeholder="Author"
							required="required"></sf:input>
					</div>
					<div class="form-group mb-2">
						<label for="supplier">Supplier (required)</label>
						<sf:input path="supplier" autocomplete="off" type="text"
							class="form-control" id="supplier" placeholder="Supplier"
							required="required"></sf:input>
					</div>
					<div class="form-group mb-2">
						<label for="publish">Publish (required)</label>
						<sf:input path="publish" autocomplete="off" type="text"
							class="form-control" id="publish" placeholder="Publish"
							required="required"></sf:input>
					</div>
					<div class="form-group mb-2">
						<label for="cover_form">CoverForm (required)</label>
						<sf:input path="cover_form" autocomplete="off" type="text"
							class="form-control" id="cover_form" placeholder="CoverForm"
							required="required"></sf:input>
					</div>
					<div class="form-group form-check mb-2">
						<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
						<label class="form-check-label" for="isHot">Is Hot
							Product?</label>
					</div>

					<!-- avatar -->
					<div class="form-group mb-2">
						<label for="fileProductAvatar">Avatar</label> <input type="file"
							id="fileProductAvatar" name="productAvatar" class="form-control">
					</div>
					<div class="form-group">
						<img alt="" style="width: 100px; height: 100px;"
							src="${base }/upload/${product.avatar}">
					</div>

					<!-- pictures -->
					<div class="form-group mb-2">
						<label for="fileProductPictures">Picture(Multiple)</label> <input
							type="file" id="fileProductPictures" name="productPictures"
							class="form-control" multiple="multiple">
					</div>
					<div class="form-group">
						<c:forEach items="${product.productImages }" var="productImage">
							<img alt="" style="width: 100px; height: 100px;"
								src="${base }/upload/${productImage.path}">
						</c:forEach>
					</div>

					<br />
					<a href="/admin/product/list" class="btn btn-secondary active"
						role="button" aria-pressed="true">Back to list</a>
					<button type="submit" onclick="TinhSale()" class="btn btn-primary">Save
						Product</button>
				</sf:form>
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
		function TinhSale() {
			var price = document.getElementById("price").value;
			var percent = document.getElementById("percent").value;
			if (percent == "") {
				percent = 0;
				var priceSale = price - price * percent / 100;
			} else {
				var priceSale = price - price * percent / 100;
			}
			document.getElementById("priceSale").value = priceSale;
		}
	</script>
</body>
</html>
