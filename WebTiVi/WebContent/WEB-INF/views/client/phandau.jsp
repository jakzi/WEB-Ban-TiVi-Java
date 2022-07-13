<!-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link
	href="<c:url value='/resources/assets/dist/css/header.css' />"
	rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
-->
<style>
.hassubs {
    z-index: 3;
}
</style>
<div class="super_container">
	<div class="top_bar">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-row">
					<div class="top_bar_contact_item">
						<div class="top_bar_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918577/phone.png" alt="">
						</div>+84 943 906 331
					</div>
					<div class="top_bar_contact_item">
						<div class="top_bar_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918597/mail.png" alt="">
						</div><a href="mailto:fastsales@gmail.com">thanhryu207@gmail.com</a>
					</div>
					<div class="top_bar_content ml-auto">
						<div class="top_bar_menu">
							<ul class="standard_dropdown top_bar_dropdown">
								<li> <a href="#">vi<i class="fas fa-chevron-down"></i></a>
									<ul>
										<li><a href="#">en</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="top_bar_user">
							<div class="user_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg" alt="">
							</div>
							<c:choose>
								<c:when test="${taiKhoan.tenTK==null}">
									<div><a href="dang-ky.htm">Đăng ký</a>
									</div>
									<div><a href="dang-nhap.htm">Đăng nhập</a>
									</div>
								</c:when>
								<c:otherwise>
									<div><a href="tai-khoan.htm">${taiKhoan.hoTen}</a>
									</div>
									<div><a href="dang-xuat.htm">Đăng xuất</a>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header_main">
		<div class="container">
			<div class="row">
				<!-- Logo -->
				<div class="col-lg-2 col-sm-3 col-3 order-1">
					<div class="logo_container">
						<a class="navbar-brand" href="#">
							    <img src="<c:url value="resources/images/web/T-icon.ico"/>" width="30" height="30" class="d-inline-block align-top" alt="">
							    Trùm Điện Máy
							  </a>
					</div>
				</div>
				<!-- Search -->
				<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
					<div class="header_search">
						<div class="header_search_content">
							<div class="header_search_form_container">
								<form action="tim-kiem.htm" class="header_search_form clearfix">
									<input type="search" name="search"  class="header_search_input" placeholder="Tìm kiếm...">
									<button type="submit" class="header_search_button trans_300" value="Submit"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918770/search.png" alt="">
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
					<!-- Cart -->
					<div class="cart">
						<div class="cart_container d-flex flex-row align-items-center justify-content-end">
							<div class="cart_icon"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918704/cart.png" alt="">
								<div class="cart_count"><span>${sessionScope.cnGioSL}</span>
								</div>
							</div>
							<div class="cart_content">
								<div class="cart_text"><a href="gio-hang.htm">Giỏ hàng</a>
								</div>
								<div class="cart_price">VND</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<nav class="main_nav sticky-top">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="main_nav_content d-flex flex-row">
					<div class="main_nav_menu">
						<ul class="standard_dropdown main_nav_dropdown">
							<li><a href="trang-chu.htm">Trang chủ<i class="fas fa-chevron-down"></i></a>
							</li>
							<li class="hassubs"> <a href="san-pham.htm">Sản phẩm<i class="fas fa-chevron-down"></i></a>
								<ul>
									<c:forEach var="c" items="${dsDM}">
										<li><a href="san-pham/${c.maLoaiSP}.htm">${c.tenLoaiSP}<i class="fas fa-chevron-down"></i></a>
										</li>
									</c:forEach>
								</ul>
							</li>
							<li class="hassubs"> <a href="gioi-thieu.htm">Giới thiệu<i class="fas fa-chevron-down"></i></a>
								<ul>
									<li><a href="chinh-sach.htm">Chính sách<i class="fas fa-chevron-down"></i></a>
									</li>
								</ul>
							</li>
							<li><a href="lien-he.htm">Liên hệ<i class="fas fa-chevron-down"></i></a>
							</li>

						</ul>
					</div>
					<div class="menu_trigger_container ml-auto">
						<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
							<div class="menu_burger">
								<div class="menu_trigger_text">menu</div>
								<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>
<!--
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
	<script src="<c:url value="/resources/assets/dist/js/header.js"/>"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
-->
