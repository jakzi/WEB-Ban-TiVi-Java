<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="vi">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<!-- Hỗ trợ kéo màn hình-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/images/web/T-icon.ico" type="image/x-icon">
<title>Trùm Điện Máy | 404</title>

<!-- Bootstrap core CSS -->
<!-- <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link
	href="<c:url value='/resources/assets/dist/css/bootstrap.min.css' />"
	rel="stylesheet">
<style>
body {
    background: #dedede;
}
.page-wrap {
    min-height: 100vh;
}
</style>
<!-- Custom styles for this template -->
</head>

<body>
	<div class="page-wrap d-flex flex-row align-items-center">
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-md-12 text-center">
	                <span class="display-1 d-block">404</span>
	                <div class="mb-4 lead">Không thể truy cập vào trang.</div>
	                <a href="trang-chu.htm" class="btn btn-warning">Trang chủ</a>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="<c:url value="/resources/assets/dist/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
