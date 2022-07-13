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
<title>Trùm Điện Máy | Đăng nhập</title>

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
<style>
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
  position:fixed;
  z-index:-1;
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
.font-weight-normal {
    font-weight: 400!important;
}
.h3, h3 {
    font-size: 1.75rem;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}
body {
    color: #ffc107;
}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="trang-chu.htm">Trang chủ</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Đăng nhập</li>
	  </ol>
	</nav>
	<div style="height: 100px"></div>
	<form:form class="form-signin text-center" action="dang-nhap.htm" modelAttribute="taiKhoan" method="post">
      <h1 class="h3 mb-3 font-weight-normal">Đăng nhập</h1>
      <p style="text-align:center; color:red" >${loiDangNhap}</p>
      <label for="inputTK" class="sr-only">Tài khoản</label>
      <input type="text" name="tenTK" class="form-control" placeholder="Tài khoản">
      <label for="inputMK" class="sr-only">Mật khẩu</label>
      <input type="password" name="matKhau" class="form-control" placeholder="Mật khẩu" >
        <p><a href="${pageContext.servletContext.contextPath}/quenMK.htm">Quên mật khẩu?</a></p>
      <button class="btn btn-lg btn-warning btn-block" type="submit">Đăng nhập</button>
    </form:form>	
    <div style="height: 150px"></div>
	<jsp:include page="phanduoi.jsp"></jsp:include>
	<!-- <script></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
	<script src="<c:url value="/resources/assets/dist/js/header.js"/>"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
