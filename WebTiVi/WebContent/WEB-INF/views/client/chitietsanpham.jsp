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
	<title>Trùm Điện Máy | ${sanPham.tenSP }</title>

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
	.top-products{
		overflow: auto;
	}
	.carousel-inner img {
		width: 100%;
		height: 100%;
	}
	
	.img {
		width: 204px;
		height: 177px
	}
	
	.col-md-3 {
		width: 25%;
		float: left;
		position: relative;
		min-height: 1px;
		padding-right: 15px;
		padding-left: 15px;
	}
	
	
	.card {
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		max-width: 300px;
		margin: auto;
		margin-top: 10px;
		margin-bottom: 70px;
		text-align: center;
		font-family: arial;
	}
	
	.card button {
		border: none;
		outline: 0;
		padding: 12px;
		color: white;
		background-color: #000;
		text-align: center;
		cursor: pointer;
		width: 100%;
		font-size: 18px;
	}
	
	.card button:hover {
		opacity: 0.7;
	}
	
	.card h5 {
		height: 100px;
	}
	
	.price {
		color: grey;
		font-size: 22px;
	}
	
	.currSign:after {
		content: ' VND';
	}
	.img-thumbnail{
		width: 500px;
	height: 500px
	}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="trang-chu.htm">Trang chủ</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page">${sanPham.tenSP }</li>
		</ol>
	</nav>
		<div class="container">
		<div class="row">
			<div class="col-sm-4">
			<ul><li> <img
					class="img-thumbnail"
					src="resources/images/sanpham/${sanPham.anh}" alt="">
					</li></ul>
			</div>
			<div class="col-sm-8">
			<h2>${sanPham.tenSP }</h2>
			<hr>
			<strong class="text-dark">Thương hiệu: ${sanPham.thuongHieu.tenTH} </strong>
							<c:if test="${sanPham.giamGia =='0' &&  sanPham.giamGia2 ==0 }">
								<p/>
								<br>
								<p/>
								<p class="price VND">${sanPham.gia}</p>
								<p/>
							</c:if>
							<c:if test="${sanPham.giamGia !='0' || sanPham.giamGia2 !=0}">
								<del><p class="text-danger VND"> ${sanPham.gia} </p></del>
								<p class="price VND">${(sanPham.gia-sanPham.gia*sanPham.giamGia/100)-sanPham.giamGia2}</p>
							</c:if>
			<hr>
			<strong class="text-dark">Số lượng còn trong kho: ${sanPham.soLuong} </strong>
<form action="gio-hang/themsp/${sanPham.maSP}.htm" method="post">
	<ul>
		<li><h4>Số lượng:</h4>
			<select class="form-select" name="slsp">
				<c:forEach begin="1" end="${sanPham.soLuong}" varStatus="status">
					<option  value="${status.index}">${status.index}</option>
				</c:forEach>

			</select>
		</li>
	</ul>
	<br>
	<c:if test="${sanPham.soLuong != 0}">
		<button class="btn btn-outline-warning" >Thêm vào giỏ</button>
	</c:if>
	<c:if test="${sanPham.soLuong == 0}">
		<p class="text-danger">Đã hết hàng</p>
	</c:if>
</form>
			</div>
		</div>
		<h2 class="text-dark">Mô tả</h2>
		<p class="text-dark">${sanPham.moTa}</p>
		<h2 class="text-dark">Sản phẩm tương tự</h2>
	</div>
	
	<hr>
	<div class="container">
		<div class=" top-products">
			<c:forEach var="p" items="${dsSPTT}" varStatus="status">
				<div class="col-md-3 md-col">
					<div class="card">
						<a href="chi-tiet/${p.maSP}.htm" class="compare-in"><img class="img rounded" src="resources/images/sanpham/${p.anh}" alt="" />
						</a>
						<div class="top-content">
							<h5>
							<a href="chi-tiet/${p.maSP}.htm">${p.tenSP}</a>
						</h5>
							<c:if test="${p.giamGia =='0' &&  p.giamGia2 ==0 }">
								<p/>
								<br>
								<p/>
								<p class="price VND">${p.gia}</p>
								<p/>
							</c:if>
							<c:if test="${p.giamGia !='0' || p.giamGia2 !=0}">
								<del><p class="text-danger VND"> ${p.gia} </p></del>
								<p class="price VND">${(p.gia-p.gia*p.giamGia/100)-p.giamGia2}</p>
							</c:if>
							<c:if test="${p.soLuong != 0}">
							<p>
								<button onclick="window.location.href='gio-hang/them/${p.maSP}.htm'">Thêm vào giỏ</button>
							</p>
							</c:if>
							<c:if test="${p.soLuong == 0}">
							<p class="text-danger">Đã hết hàng</p>
							<br>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="phanduoi.jsp"></jsp:include>
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
