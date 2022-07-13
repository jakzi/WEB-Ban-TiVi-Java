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
<title>Trùm Điện Máy | Chi tiết đơn hàng</title>

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
		<h2>Đơn hàng mã số : ${maDH}</h2>
		<div style="height: 50px"></div>
		<div style="height: 5px"></div>
		<div class="float-right"></div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th style="width: 80px; text-align: center"><b>Tên sản phẩm</b></th>
					<td style="text-align: center; width: 200px;">
						<b>Hình ảnh</b>
					</td>
					<th style="text-align: center; width: 150px;"><b>Số lượng</b></th>
					<th style="text-align: center; width: 150px;"><b>Giá</b></th>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${dsCTDH}">
					<tr class="unread checked">
						<td style="width: 80px; text-align: center;">${item.sanPhamCT.tenSP}</td>
						<td style="text-align: center; width: 200px;">
							<img class="img" src="${pageContext.request.contextPath}/resources/images/sanpham/${item.sanPhamCT.anh}" alt="" style="width:90px;height:60px;" />
						</td>
						<td style="text-align: center; width: 150px;">${item.soLuong}</td>
						<td style="text-align: center; width: 150px;" class="VND">${item.gia}</td>
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
