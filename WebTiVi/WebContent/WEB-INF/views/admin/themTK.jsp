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
<title>Trùm Điện Máy | Thêm tài khoản</title>

<!-- Bootstrap core CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Custom styles for this template -->
<link
	href="<c:url value='/resources/assets/dist/css/bootstrap.min.css' />"
	rel="stylesheet">
<style type="text/css">
*[id$=errors]{
color:red;
font-style: italic;
}
</style>
</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
	<div class="container">
	<div class=" bg-light p-5 rounded">
	<h2>Thông tin tài khoản</h2>
	<div>
		<c:if test="${loiThem != null}">
		<div class="p-3 mb-2 bg-danger text-white">${loiThem}</div>
		</c:if>
		<c:if test="${thongbaoThem != null}">
		<div class="p-3 mb-2 bg-success text-white">${thongbaoThem}</div>
		</c:if>
	</div>
		<div class="row">
			<form:form action="nguoi-dung/them.htm" method="post" modelAttribute="taiKhoan2">
				<div class="form-group">
					<label for="tenTK">Tài khoản</label>
					<form:input type="text" class="form-control" path="tenTK" id="tenTK" placeholder="Tài khoản"/>
					<form:errors path="tenTK"/>
				</div>
				<div class="form-group">
				  <label for="hoTen">Họ và Tên</label>
				  <form:input type="text" class="form-control" path="hoTen" id="hoTen" placeholder="Nhập họ và tên"/>
				  <form:errors path="hoTen"/>
				</div>
				<div class="form-group">
				  <label for="matKhau">Mật Khẩu</label>
				  <form:input type="password" class="form-control" path="matKhau" id="matKhau" placeholder="Nhập mật khẩu"/>
				  <form:errors path="matKhau"/>
				</div>
				<div class="form-group">
				  <label > </label>
				  <input type="password" class="form-control" name="repassword" id="repassword" placeholder="Nhập lại mật khẩu"/>
				</div>
				<div class="form-group">
				  <label for="sdt">SDT</label>
				  <form:input type="text" class="form-control" path="sdt" id="sdt" placeholder="Nhập số điện thoại"/>
				  <form:errors path="sdt"/>
				</div>
				<div class="form-group">
				  <label for="email">Email</label>
				  <form:input type="text" class="form-control" path="email" id="email" placeholder="Nhập email"/>
				  <form:errors path="email"/>
				</div>
				<div class="form-group">
				  <label for="diaChiMD">Địa chỉ</label>
				  <form:input type="text" class="form-control" path="diaChiMD" id="diaChiMD" placeholder="Nhập địa chỉ"/>
				  <form:errors path="diaChiMD"/>
				</div>
				<div class="form-group text-center">
				<label>Giới tính</label>
				</div>
				<form:errors path="gioiTinh"/>		
				<div class="form-group text-center">
					<form:radiobutton path="gioiTinh" value="0" label="Nữ"/>
					<form:radiobutton path="gioiTinh" value="1" label="Nam" />
				</div>
				<div class="form-group text-center">
				<label>Phân Quyền</label>
				</div>
				<form:errors path="phanQuyen.maQ"/>		
				<div class="form-group text-center">
					<form:radiobutton path="phanQuyen.maQ" value="ad" label="Admin"/>
					<form:radiobutton path="phanQuyen.maQ" value="eu" label="Client" />
				</div>
				<div class="text-center">
				<button type="submit" class="btn btn-warning">Lưu</button>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	</div><!-- Nối với chung -->
	<!-- <script></script> -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="<c:url value="/resources/assets/dist/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
