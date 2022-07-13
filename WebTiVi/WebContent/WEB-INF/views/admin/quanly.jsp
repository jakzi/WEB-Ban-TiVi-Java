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
<title>Trùm Điện Máy | Quản lý</title>

<!-- Bootstrap core CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Custom styles for this template -->
<style>
.col-md-4 {
    width: 33.33333333%;
    float: left;

}
.market-update-block.clr-block-1 {
    background: #68ae00;
    margin-right: 0.8em;
    box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
}
.market-update-block.clr-block-2 {
    background: #FC8213;
    margin-right: 0.8em;
    box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
}
.market-update-block.clr-block-3 {
    background: #337AB7;
    box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
}
.market-update-right i.fa.fa-file-text-o {
    font-size: 3em;
    color: #68AE00;
    width: 80px;
    height: 80px;
    background: #fff;
    text-align: center;
    border-radius: 49px;
    -webkit-border-radius: 49px;
    -moz-border-radius: 49px;
    -o-border-radius: 49px;
    line-height: 1.7em;
}
.market-update-right i.fa.fa-eye {
    font-size: 3em;
    color: #FC8213;
    width: 80px;
    height: 80px;
    background: #fff;
    text-align: center;
    border-radius: 49px;
    -webkit-border-radius: 49px;
    -moz-border-radius: 49px;
    -o-border-radius: 49px;
    line-height: 1.7em;
}
.market-update-right i.fa.fa-envelope-o {
    font-size: 3em;
    color: #337AB7;
    width: 80px;
    height: 80px;
    background: #fff;
    text-align: center;
    border-radius: 49px;
    -webkit-border-radius: 49px;
    -moz-border-radius: 49px;
    -o-border-radius: 49px;
    line-height: 1.7em;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.col-md-8 {
    width: 66.66666667%;
    float: left;
}
.market-update-block {
    padding: 2em 2em;
    background: #999;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

</head>
<body>
	<jsp:include page="chung.jsp"></jsp:include>
<div class="container">
<br>
		<div class="market-updates">
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
						<h3>${tongSP}</h3>
						<h4>Sản phẩm đang được bán</h4>
						<p></p>
					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-file-text-o"> </i>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-8 market-update-left">
						<h3>${tongTK}</h3>
						<h4>Số người đăng ký tài khoản</h4>
						<p></p>
					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-eye"> </i>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-3">
					<div class="col-md-8 market-update-left">
						<h3>${tongDHcxn}</h3>
						<h4>Đơn hàng đang đợi xác nhận</h4>

					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-envelope-o"> </i>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</div>
<div class="container">
<h3>Top sản phẩm bán chạy</h3>
<table class="table table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Tên</th>
            <th>Loại</th>
            <th>Số lượng đặt mua</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${top}" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${item[0]}</td>
                <td><span class="label label-info">${item[1]}</span>
                </td>
                <td><span class="badge badge-info">${item[2]}</span>
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
