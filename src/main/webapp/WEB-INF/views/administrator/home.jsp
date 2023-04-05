<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>Gentelella Alela!</title>
    <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>            

    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="${base }/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
                <jsp:include page="/WEB-INF/views/administrator/layout/slidebar_menu.jsp"></jsp:include>            
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
                <jsp:include page="/WEB-INF/views/administrator/layout/menu_footer_btn.jsp"></jsp:include>                        
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
                <jsp:include page="/WEB-INF/views/administrator/layout/top_nav.jsp"></jsp:include>            
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>            
  </body>
</html>
