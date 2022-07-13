<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="vi">
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<!-- Hỗ trợ kéo màn hình-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/images/web/T-icon.ico"
	type="image/x-icon">
<title>Trùm Điện Máy | Quản lý người dùng</title>

<!-- Bootstrap core CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
	<div class=" bg-light p-5 rounded">
		<h2>Quản lý người dùng</h2>
		<div style="height: 50px"></div>
		<div style="text-align: left; color: red">
			<u>${loiXoa}</u><u>${thongbaoXoa}</u>
		</div>
		<div class="btn btn-outline-success">
			<a href="nguoi-dung/them.htm"><i class="fa fa-plus"> </i></a>
		</div>
		<div style="height: 5px"></div>
		<div class="float-right">
			<span class="text-muted m-r-sm">Trang</span>
			<div class="btn-group">
				<a class="btn btn-default"><i class="fa fa-angle-left"></i></a>
				<c:forEach var="i" begin="0" end="${soLuongTK/10}">
					<a class="btn btn-default" href="nguoi-dung/${i+1}.htm"><c:out
							value="${i+1}" /></a>
				</c:forEach>
				<a class="btn btn-default"><i class="fa fa-angle-right"></i></a>
			</div>
			<div class="clearfix"></div>
		</div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th class="hidden-xs" style="width: 180px;"><b>Tài khoản</b></th>
					<th style="width: 80px; text-align: center"><b>Giới tính</b></th>
					<th style="text-align: center; width: 150px;"><b>Email</b></th>
					<th style="text-align: center; width: 100px;"><b>Số điện
							thoại</b></th>
					<th style="text-align: center; width: 200px;"><b>Địa chỉ</b></th>
					<th style="text-align: center; width: 130px;"><b>Ngày tạo</b>
					</th>
					<th style="text-align: center; width: 100px;"><b>Quyền</b></th>
					<th style="text-align: center; width: 150px;"><b>Tùy chọn</b>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${dsTK}">
					<tr class="unread checked">
						<td class="hidden-xs" style="width: 180px;">${item.tenTK}</td>
						<td style="width: 80px; text-align: center;">${item.gioiTinh?'Nam':'Nữ'}</td>
						<td style="text-align: left; width: 150px;">${item.email}</td>
						<td style="text-align: center; width: 100px;">${item.sdt}</td>
						<td style="text-align: center; width: 200px;">${item.diaChiMD}</td>
						<td style="text-align: center; width: 130px;">
							${item.ngayTaoTK}</td>
						<td style="text-align: center; width: 100px;">
							${item.phanQuyen.moTaQ}</td>
						<c:if test="${item.idTK!=taiKhoan.idTK}">
							<td style="text-align: center; width: 20px;">
								<div class="btn btn-outline-danger">
									<a class="fa fa-trash" href="nguoi-dung/xoa/${item.idTK}.htm"></a>
								</div>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<!-- Nối với chung -->
	<!-- <script></script> -->

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
