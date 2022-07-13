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
<title>Trùm Điện Máy | Sửa đơn hàng</title>

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
	<h2>Thông tin</h2>
	<div>
		<c:if test="${loiSua != null}">
		<div class="p-3 mb-2 bg-danger text-white">${loiSua}</div>
		</c:if>
		<c:if test="${thongbaoSua != null}">
		<div class="p-3 mb-2 bg-success text-white">${thongbaoSua}</div>
		</c:if>
	</div>
		<div class="row">
			<form:form action="ad-don-hang/sua/${maDH}.htm" method="post" modelAttribute="donHang">
				<label>Mã Đơn hàng: ${oid}</label>
				<form:input type="hidden"  path="maDH" id="maDH" value="${maDH }"/>
				<br>
				<label>Trạng thái đơn hàng:</label>
				<br>
				<form:select path="trangThai.maTT" items="${dsTrangThai}"
					itemLabel="moTaTT" itemValue="maTT" />
				<br>
				<input type="submit" value="lưu" />
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
