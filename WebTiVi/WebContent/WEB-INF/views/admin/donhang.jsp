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
<title>Trùm Điện Máy | Quản lý đơn hàng</title>

<!-- Bootstrap core CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
        .currSign:after {
            content: ' VND';
        }
    </style>
</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
	<div class=" bg-light p-5 rounded">
		<h2>Quản lý Đơn hàng</h2>
		<div style="height: 50px"></div>
		<div style="text-align: left; color: red">
			<u>${loiXoa}</u><u>${thongbaoXoa}</u>
		</div>
		<div style="height: 5px"></div>
		<div class="float-right"></div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th class="hidden-xs" style="width: 180px;"><b>Mã đơn hàng</b></th>
					<th style="width: 80px; text-align: center"><b>Tên tài khoản</b></th>
					<th style="text-align: center; width: 150px;"><b>Họ tên</b></th>
					<th style="text-align: center; width: 150px;"><b>Email</b></th>
					<th style="text-align: center; width: 100px;"><b>Số điện thoại</b></th>
					<th style="text-align: center; width: 200px;"><b>Địa chỉ</b></th>
					<th style="text-align: center; width: 130px;"><b>Ngày đặt</b></th>
					<th style="text-align: center; width: 100px;"><b>Trạng thái</b></th>
					<th style="text-align: center; width: 100px;"><b>Tổng tiền</b></th>
					<th style="text-align: center; width: 150px;"><b>Tùy chọn</b>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${dsCTDonHang}">
					<tr class="unread checked">
						<td class="hidden-xs" style="width: 180px;">
						<a href="ad-don-hang/chitiet/${item[0]}.htm">
						${item[0]}</td>
						<td style="width: 80px; text-align: center;">${item[1]}</td>
						<td style="text-align: left; width: 150px;">${item[2]}</td>
						<td style="text-align: left; width: 150px;">${item[5]}</td>
						<td style="text-align: center; width: 100px;">${item[6]}</td>
						<td style="text-align: center; width: 200px;">${item[4]}</td>
						<td style="text-align: center; width: 130px;">${item[7]}</td>
						<td style="text-align: center; width: 100px;">${item[3]}</td>
						<td style="text-align: center; width: 100px;" class="VND">${item[8]}</td>

						<td style="text-align: center; width: 20px;">
							<a class="btn btn-outline-warning" href="ad-don-hang/sua/${item[0]}.htm">
								<i class="fa fa-edit"></i>
							</a>
							<a class="btn btn-outline-danger" href="ad-don-hang/xoa/${item[0]}.htm">
								<i class="fa fa-trash"></i>
							</a>
						</td>

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
		    <script>
        let x = document.querySelectorAll(".VND");
        for (let i = 0, len = x.length; i < len; i++) {
            let num = Number(x[i].innerHTML)
                      .toLocaleString('vn');
            x[i].innerHTML = num;
            x[i].classList.add("currSign");
        }
    </script>
</body>
</html>
