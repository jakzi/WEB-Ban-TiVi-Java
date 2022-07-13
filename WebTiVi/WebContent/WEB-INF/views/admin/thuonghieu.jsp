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
<title>Trùm Điện Máy | Thương hiệu</title>

<!-- Bootstrap core CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
	<div class=" bg-light p-5 rounded">
	<h2>Quản lý thương hiệu</h2>
	<div style="height: 50px"></div>
		<c:if test="${loiXoa != null}">
		<div class="p-3 mb-2 bg-danger text-white">${loiXoa}</div>
		</c:if>
	<div class="btn btn-outline-success">
		<a
			href="thuong-hieu/them.htm"><i
			class="fa fa-plus"> </i></a>
	</div>
	<div style="height: 5px"></div>
	<table class="table table-hover">
			<thead class="thead-light">
			<tr>
				<th class="hidden-xs" style="width: 180px;"><b>Mã Thương hiệu</b></th>
				<th style="width: 80px; text-align: center"><b>Tên thương hiệu</b></th>
				<th style="text-align: center; width: 150px;"><b>Tùy chọn</b>
				</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${dsTH}">
				<tr class="unread checked">					
					<td class="hidden-xs" style="width: 180px;">
						${item.maTH}</td>
					<td style="width: 80px; text-align: center;">
					${item.tenTH}</td>
					<td style="text-align: center; width: 20px;">
						<div class="btn btn-outline-warning">
						<a class="fa fa-pencil"
						href="thuong-hieu/sua/${item.maTH}.htm"></a>
						</div>
						<div class="btn btn-outline-danger">
						<a class="fa fa-trash"
						href="thuong-hieu/xoa/${item.maTH}.htm"></a>
						</div>
					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div><!-- Nối với chung -->
	<!-- <script></script> -->

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
