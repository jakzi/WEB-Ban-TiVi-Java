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
	<title>Trùm Điện Máy | Tài khoản</title>

	<!-- Bootstrap core CSS -->
	<link href="<c:url value='/resources/assets/dist/css/header.css' />" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link href="<c:url value='/resources/assets/dist/css/footer.css' />" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/assets/dist/js/header.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	
	body {
		color: #ffc107;
	}
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #000;
    background-color: #ffc107;
}
.btn-check {
    position: absolute;
    clip: rect(0,0,0,0);
    pointer-events: none;
}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="trang-chu.htm">Trang chủ</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page">Trang cá nhân</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h3 class="text-info">${taiKhoan.tenTK}</h3>
				<p class="text-info">Xin chào! ${taiKhoan.hoTen}</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item">
						<a class="nav-link active" href="tai-khoan.htm">Thông tin</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="doi-mat-khau.htm">Đổi mật khẩu</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="don-hang.htm">Đơn hàng</a>
					</li>
				</ul>
				<br>
			</div>
			<div class="col-sm-8">
				<div>
		<c:if test="${loiSua != null}">
		<div class="p-3 mb-2 bg-danger text-white">${loiSua}</div>
		</c:if>
		<c:if test="${thongbaoSua != null}">
		<div class="p-3 mb-2 bg-success text-white">${thongbaoSua}</div>
		</c:if>
	</div>
				<form:form action="${pageContext.servletContext.contextPath}/doi-thong-tin/${taiKhoan.idTK }.htm" method="post" modelAttribute="u">
					 <div class="form-group">
   					 <label for="hoTen">Họ và Tên:</label>
   			 		 <input type="text" class="form-control" value="${taiKhoan.hoTen }" name="hoTen">
  					 </div>
					 <div class="form-group">
   					 <label for="email">Email:</label>
   			 		 <input type="email" class="form-control" value="${taiKhoan.email }" name="email">
  					 </div>
  					 <div class="form-group">
   					 <label for="sdt">Số điện thoại:</label>
   			 		 <input type="text" class="form-control" value="${taiKhoan.sdt }" name="sdt">
  					 </div>
					 <div class="form-group">
   					 <label for="diaChiMD">Địa chỉ:</label>
   			 		 <input type="text" class="form-control" value="${taiKhoan.diaChiMD }" name="diaChiMD">
  					 </div>
  					 <div class="form-group">
   					 <label for="gioiTinh">Giới tính:</label>
   					 <c:if test="${taiKhoan.gioiTinh == true }">
   			 		 <select class="form-control" name="gioiTinh">
					  <option value="1">Nam</option>
					  <option value="0">Nữ</option>
					</select>
					</c:if>
					 <c:if test="${taiKhoan.gioiTinh == false }">
   			 		 <select class="form-control" name="gioiTinh">
   			 		 <option value="0">Nữ</option>
					  <option value="1">Nam</option>
					</select>
					</c:if>
  					 </div>
  					 <input type="hidden" value="${taiKhoan.phanQuyen.maQ }" name="phanQuyen.maQ">
  					<button type="submit" class="btn btn-warning">Lưu</button>
				</form:form>
			</div>
		</div>
	</div>
	<hr>
	<jsp:include page="phanduoi.jsp"></jsp:include>
</body>
</html>
