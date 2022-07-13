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
	<link rel="icon" href="resources/images/web/T-icon.ico" type="image/x-icon">
	<title>Trùm Điện Máy | Quản lý sản phẩm</title>
	<!-- Bootstrap core CSS -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

	<style>
        .currSign:after {
            content: ' VND';
        }
    </style>
	
</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
	<div class=" bg-light p-5 rounded">
		<h2>Quản lý sản phẩm</h2>
		<div style="height: 50px"></div>
		<c:if test="${loiXoa != null}">
			<div class="p-3 mb-2 bg-danger text-white">${loiXoa}</div>
		</c:if>
		<c:if test="${thongbaoXoa != null}">
			<div class="p-3 mb-2 bg-success text-white">${thongbaoXoa}</div>
		</c:if>
		<div class="btn btn-outline-success">
			<a href="ad-san-pham/them.htm"><i
			class="fa fa-plus"> </i></a>
		</div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<td class="hidden-xs" style="width: 180px;">
						<b>Tên sản phẩm</b>
					</td>
					<td class="hidden-xs" style="width: 100px;">
						<b>Loại</b>
					</td>
					<td class="hidden-xs" style="width: 100px;">
						<b>Thương hiệu</b>
					</td>
					<td style="text-align: left; width: 150px;">
						<b>Giá(VND)</b>
					</td>
					<td style="text-align: center; width: 50px;">
						<b>Giảm giá %</b>
					</td>
					<td style="text-align: center; width: 50px;">
						<b>Giảm giá VND</b>
					</td>
					<td style="text-align: left; width: 150px;">
						<b>Giá bán(VND)</b>
					</td>
					<td style="text-align: center; width: 50px;">
						<b>Số lượng</b>
					</td>
					<td style="text-align: center; width: 200px;">
						<b>Hình ảnh</b>
					</td>
					<td style="text-align: right; width: 150px;">
						<b>Ngày tạo</b>
					</td>
					<td style="text-align: center; width: 150px;">
						<b>Tùy chọn</b>
					</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${dsSP}">
					<tr class="unread checked">
						<td class="hidden-xs" style="width: 180px;">
							${item.tenSP}
						</td>
						<td class="hidden-xs" style="width: 100px;">
							${item.loaiSP.tenLoaiSP}
						</td>
						<td class="hidden-xs" style="width: 100px;">
							${item.thuongHieu.tenTH}
						</td>
						<td style="text-align: left; width: 150px;" class="VND">
							${item.gia}
						</td>
						<td style="text-align: center; width: 50px;">
							${item.giamGia}
						</td>
						<td style="text-align: center; width: 50px;" class="VND">
							${item.giamGia2}
						</td>
						<td style="text-align: left; width: 150px;" class="VND">
					    	${item.gia/100*(100-item.giamGia)-item.giamGia2}
						</td>
						<td style="text-align: center; width: 50px;">
							${item.soLuong}
						</td>
						<td style="text-align: center; width: 200px;">
							<img class="img" src="${pageContext.request.contextPath}/resources/images/sanpham/${item.anh}" alt="" style="width:90px;height:60px;" />
						</td>
						<td style="text-align: right; width: 150px;">
							${item.ngayTao}
						</td>
						<td style="text-align: center; width: 150px;">
							<a class="btn btn-outline-warning" href="ad-san-pham/sua/${item.maSP}.htm">
								<i class="fa fa-edit"></i>
							</a>
							<a class="btn btn-outline-danger" href="ad-san-pham/xoa/${item.maSP}.htm">
								<i class="fa fa-trash"></i>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
</body>
</html>
