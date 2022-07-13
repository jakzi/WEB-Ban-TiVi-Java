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
	<title>Trùm Điện Máy | Đặt hàng</title>

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
	.currSign:after {
		content: ' VND';
	}

	.total_right {
    float: center;
    font-size: 0.85em;
    color: #92d3d0;
    font-weight: 600;
}
.total {
    padding: 10px;
    background: #F9F9F9;
    margin: 0.3em 0;
}
.clearfix{
overflow: auto;
}
.check_button {
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
.cart_box {
    position: relative;
    margin-bottom: 1em;
    border-bottom: 1px solid #E0E0E0;
    margin-bottom: 10px;
    padding-bottom: 10px;
}
.list_desc {
    float: left;
    width: 50%;
}
.list_img {
    float: left;
    width: 20%;
    border: 1px solid #e0e0e0;
    margin-right: 6%;
}
.btn-light {
    color: #ffffff;
    background-color: #F44336;
    border-color: #f8f9fa;
    font-size: 12px
}

.btn-light:hover {
    color: #ffffff;
    background-color: #F44336;
    border-color: #F44336
}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="trang-chu.htm">Trang chủ</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
	  </ol>
	</nav>
	<hr>
	<div class="container ">
		<div style="text-align:center; color:red" >${msgGio} </div>
                    <div class="shopping_cart">
                    <c:forEach var="map" items="${sessionScope.cnSpGio}">
                        <div class="cart_box clearfix">
                                <div class="list_img col-sm-4">
                                <img  src="resources/images/sanpham/${map.value.sanPham.anh}" class="img rounded" alt="">
                                </div>
                                <div class="list_desc col-sm-8">
                                	<h4><a href="chi-tiet/${map.value.sanPham.maSP }.htm"><c:out value="${map.value.sanPham.tenSP}"/></a></h4>
                                	<h6 class="VND"><c:out value="${(100-map.value.sanPham.giamGia)*map.value.sanPham.gia/100 -map.value.sanPham.giamGia2}"/></h6>
									Số lượng : <c:out value="${map.value.slSP}" />
									<h6 class="VND"><c:out value="${map.value.slSP *((100-map.value.sanPham.giamGia)*map.value.sanPham.gia/100 -map.value.sanPham.giamGia2)}"/></h6>
									<button class="btn btn-light btn-round"
									 onclick="window.location.href='gio-hang/xoa/${map.value.sanPham.maSP}.htm'">Bỏ khỏi giỏ</button>
                                </div>
                        		
                        </div>
                    </c:forEach>
                </div>
                <div class="total">
                    <div class="total_right">Miễn phí vận chuyển</div>
          
                    <div class="total_right">Tổng tiền:<h6 class="VND"><c:out value="${sessionScope.cnGioTong}"/></h6></div>
                  
                    <div class="total_right ">Đã tính VAT</div>
                </div>
                <div>
                </div>
	</div>
	<hr>
	<div  class="container ">
		<div class="row">
		<div class="col-md-6 text-dark">
				<h3>Info</h3>
				<p class="text-dark">Chúng tôi cam kết tất cả sản phẩm trong cửa hàng đều là sản phẩm chất lượng,rẻ,đẹp và chất lượng</p>
				<p  class="text-dark">Cửa hàng của chúng tôi hoạt động được hơn 10 năm.Luôn đặt uy tín,niềm tin khách hàng lên hàng đầu</p>
				<ul class="text-dark ">
					<li><span><i> </i>97 Man Thiện, Quận 9 ,Tp Hồ Chí Minh
					</span></li>
					<li><span><i class="down"> </i>+84916714745</span></li>
					<li><a class="text-dark" href="mailto:phanhiep243@gmail.com"><i >
						</i>thanhryu207@gmail.com</a></li>
				</ul>
			</div>
			<div class="col-md-6 text-dark">
			<form:form action="${pageContext.servletContext.contextPath}/thanh-toan.htm" 
			method="post" modelAttribute="donHang">
				<h3>Thông tin của bạn là:</h3>
				<div class="form-group">
   					 <label for="emailG">Email:</label>
   			 		 <input type="email" class="form-control" value="${taiKhoan.email }" name="emailG">
  				</div>
  				<div class="form-group">
   					 <label for="sdtG">Số điện thoại:</label>
   			 		 <input type="text" class="form-control" value="${taiKhoan.sdt }" name="sdtG">
  				</div>
				<div class="form-group">
   					 <label for="diaChiG">Địa chỉ:</label>
   			 		 <input type="text" class="form-control" value="${taiKhoan.diaChiMD }" name="diaChiG">
  				</div>
  				<button type="submit" class="btn btn-warning">Xác nhận</button>
				</form:form>
				
			</div>
			</div>
	</div>
	<hr>
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
