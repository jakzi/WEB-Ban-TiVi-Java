<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="vi">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<!-- Hỗ trợ kéo màn hình-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/images/web/T-icon.ico" type="image/x-icon">
<title>Trùm Điện Máy | Đăng ký</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/resources/assets/dist/css/header.css' />"
	rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link
	href="<c:url value='/resources/assets/dist/css/footer.css' />"
	rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<style type="text/css">
*[id$=errors]{
color:red;
font-style: italic;
}
super_container a,
super_container a:hover,
super_container a:visited,
super_container a:active,
super_container a:link {
    color: #ffc107;
    text-decoration: none;
    -webkit-font-smoothing: antialiased;
    -webkit-text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
    text-shadow: rgba(0, 0, 0, .01) 0 0 1px
}
main_nav {
  position:relative;
  z-index:-1;
}
body {
    color: #ffc107;
}
.text-center {
    text-align: center!important;
}
label {
    display: inline-block;
    margin-bottom: .5rem;
}
.form-signin .form-control {
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 10px;
    font-size: 16px;
}
.form-signin {
    width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="trang-chu.htm">Trang chủ</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Đăng ký</li>
	  </ol>
	</nav>
	<main class="container ">
	<div class=" bg-light p-5 rounded text-center">
	<h2>Đăng ký</h2>
	<div>
		<c:if test="${loiThem != null}">
		<div class="p-3 mb-2 bg-danger text-white">${loiThem}</div>
		</c:if>
		<c:if test="${thongbaoThem != null}">
		<div class="p-3 mb-2 bg-success text-white">${thongbaoThem}</div>
		</c:if>
	</div>
		<div class="row ">
			<form:form class="form-signin text-center" action="dang-ky.htm" method="post" modelAttribute="taiKhoan2">
				<label for="tenTK">Tài khoản</label>
				<form:input type="text" class="form-control" path="tenTK" id="tenTK" placeholder="Tài khoản"/>
				<form:errors path="tenTK"/>
					
				<label for="hoTen">Họ và Tên</label>
				<input type="text" class="form-control" name="hoTen" id="hoTen" placeholder="Nhập họ và tên">
				<form:errors path="hoTen"/>
	
				<label for="matKhau">Mật Khẩu</label>
				<form:input type="password" class="form-control" path="matKhau" id="matKhau" placeholder="Nhập mật khẩu"/>
				<form:errors path="matKhau"/>

				<label > </label>
				<input type="password" class="form-control" name="repassword" id="repassword" placeholder="Nhập lại mật khẩu"/>

				<label for="sdt">SDT</label>
				<form:input type="text" class="form-control" path="sdt" id="sdt" placeholder="Nhập số điện thoại"/>
				<form:errors path="sdt"/>
				
				<label for="email">Email</label>
				<form:input type="text" class="form-control" path="email" id="email" placeholder="Nhập email"/>
				<form:errors path="email"/>
				
				<label for="diaChiMD">Địa chỉ</label>
				<form:input type="text" class="form-control" path="diaChiMD" id="diaChiMD" placeholder="Nhập địa chỉ"/>
				<form:errors path="diaChiMD"/>
				
				<label>Giới tính</label>
				<form:errors path="gioiTinh"/>		
				<div class="form-group text-center">
					<form:radiobutton path="gioiTinh" value="0" label="Nữ"/>
					<form:radiobutton path="gioiTinh" value="1" label="Nam" />
				</div>
				<form:input type="hidden" path="phanQuyen.maQ" value="eu" label="Client" />
				<div class="text-center">
				<button type="submit" class="btn btn-warning">Lưu</button>
				</div>
			</form:form>
		</div>
	</div>
	</main>
	<jsp:include page="phanduoi.jsp"></jsp:include>
	<!-- <script></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
	<script src="<c:url value="/resources/assets/dist/js/header.js"/>"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
