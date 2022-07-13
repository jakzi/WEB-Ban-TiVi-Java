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
<title>Trùm Điện Máy | Sửa sản phẩm</title>

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
			<form:form action="ad-san-pham/sua/${IdSP }.htm" method="post" modelAttribute="sanPham" enctype="multipart/form-data">
				<form:select path="loaiSP.maLoaiSP" items="${dsDM}" itemLabel="tenLoaiSP" itemValue="maLoaiSP" />
				<form:select path="thuongHieu.maTH" items="${dsTH}" itemLabel="tenTH" itemValue="maTH" />
				<form:input type="hidden" class="form-control" path="maSP" id="maSP" value="${IdSP }"/>
				<div class="form-group">
					<label for="tenSP">Tên sản phẩm</label>
					<form:input type="text" class="form-control" path="tenSP" id="tenSP" value="${p.tenSP }"/>
					<form:errors path="tenSP"/>
				</div>
				<div class="form-group">
				  <label for="gia">Giá</label>
				  <form:input type="number" step="0.01"  class="form-control VND" path="gia" id="gia" value="${p.gia }" />
				  <form:errors path="gia"/>
				</div>
				<div class="form-group">
				  <label for="giamGia">Giảm Giá %</label>
				  <form:input type="number" class="form-control" path="giamGia" id="giamGia" value="${p.giamGia }"/>
				  <form:errors path="giamGia"/>
				</div>
				<div class="form-group">
				  <label for="giamGia2">Giảm Giá VND</label>
				  <form:input type="number" class="form-control" path="giamGia2" id="giamGia2" value="${p.giamGia2 }"/>
				  <form:errors path="giamGia2"/>
				</div>
				<div class="form-group">
				  <label for="soLuong">Số lượng</label>
				  <form:input type="number" class="form-control" path="soLuong" id="soLuong" value="${p.soLuong }"/>
				  <form:errors path="soLuong"/>
				</div>
				<img class="img" src="${pageContext.request.contextPath}/resources/images/sanpham/${p.anh}" alt="" style="width:90px;height:60px;" />
				<div class="form-group">
					<div class="btn btn-default btn-file">
					 <input type="file"
							name="photo">
					</div>
				</div>
				<label  for="moTa">Mô tả:</label>
						<form:textarea path="moTa" rows="3" placeholder="${p.moTa}"/>
				<div class="text-center">
				<button type="submit" class="btn btn-warning">Lưu</button>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	</div><!-- Nối với chung -->
	<!-- <script></script> -->
	    <script>
        let x = document.querySelectorAll(".VND");
        for (let i = 0, len = x.length; i < len; i++) {
            let num = Number(x[i].innerHTML)
                      .toLocaleString('vn');
            x[i].innerHTML = num;
            x[i].classList.add("currSign");
        }
    </script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="<c:url value="/resources/assets/dist/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
