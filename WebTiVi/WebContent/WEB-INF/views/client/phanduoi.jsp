<!-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link
	href="<c:url value='/resources/assets/dist/css/footer.css' />"
	rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
-->
<style>
.dk-footer-box-info {
    position: absolute;
    top: -75px;
    background: #202020;
    padding: 40px;
    padding-bottom: 20px;
    z-index: 2;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<footer id="dk-footer" class="dk-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-4">
				<div class="dk-footer-box-info">
					<a href="trang-chu.htm" class="footer-logo">
                            <img src="<c:url value="/resources/images/web/T-icon.ico"/>" height="80px" alt="footer_logo" class="img-fluid">
                        </a>
					<p class="footer-info-text">
						TRÙM ĐIỆN MÁY, nhà phân phối sản phẩm đồ điện tử chính hãng.
						<br> Uy tín - Chất lượng - An toàn.
					</p>
					<div class="footer-social-link">
						<h3>Theo dõi</h3>
						<ul>
							<li>
								<a href="#">
									<i class="fa fa-facebook"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-youtube"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-instagram"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-8">
				<div class="row">
					<div class="col-md-6">
						<div class="contact-us">
							<div class="contact-icon">
								<i class="fa fa-map-o" aria-hidden="true"></i>
							</div>
							<div class="contact-info">
								<h3>PTIT HCM</h3>
								<p>Đường Man Thiện, P. Hiệp Phú, Q.9 TP Hồ Chí Minh</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="contact-us contact-us-last">
							<div class="contact-icon">
								<i class="fa fa-volume-control-phone" aria-hidden="true"></i>
							</div>
							<div class="contact-info">
								<h3>(+84)943 906 331</h3>
								<p>Liên hệ với tôi</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="footer-widget footer-left-widget">
							<div class="section-heading">
								<h3>Liên Kết</h3>
								<span class="animate-border border-black"></span>
							</div>
							<ul>
								<li>
									<a href="gioi-thieu.htm">Giới thiệu</a>
								</li>
								<li>
									<a href="chinh-sach.htm">Chính sách</a>
								</li>
								<li>
									<a href="san-pham.htm">Sản phẩm</a>
								</li>
								<li>
									<a href="lien-he.htm">Liên hệ</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="dang-ky.htm">Đăng ký</a>
								</li>
								<li>
									<a href="dang-nhap.htm">Đăng nhập</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-12 col-lg-6">
						<div class="footer-widget">
							<div class="section-heading">
								<h3>Email</h3>
								<span class="animate-border border-black"></span>
							</div>
							<p>
								Email liên hệ: thanhryu207@gmail.com
								<br>Từ 8h00 – 16h00 các ngày từ thứ 2 đến thứ 6.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<span>Copyright © 2021| N17DCPT058</span>
				</div>
				<!-- End Col -->
				<div class="col-md-6">
					<div class="copyright-menu">
						<ul>
							<li>
								<a href="trang-chu.htm">Trang chủ</a>
							</li>
							<li>
								<a href="#">Sản phẩm</a>
							</li>
							<li>
								<a href="lien-he.htm">Liên hệ</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- End col -->
			</div>
			<!-- End Row -->
		</div>
		<!-- End Copyright Container -->
	</div>
	<div id="back-to-top" class="back-to-top">
		<button class="btn btn-dark" title="Back to Top" style="display: block;" onclick="topFunction()">
			<i class="fa fa-angle-up"></i>
		</button>
	</div>
</footer>
<script>
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>