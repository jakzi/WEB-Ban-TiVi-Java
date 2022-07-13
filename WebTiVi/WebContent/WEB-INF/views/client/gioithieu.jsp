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
	<title>Trùm Điện Máy | Giới thiệu</title>

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
	.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc;
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
.container p{
	color:#000;
}
</style>
</head>
<body>
	<jsp:include page="phandau.jsp"></jsp:include>
	<div class="container">
		<h2>Giới thiệu</h2>
		<p>Bấm vào để biết chi tiết.</p>
		
		<button class="accordion">Mục tiêu</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Sứ mệnh</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Khác</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>	
	
	</div>
	<jsp:include page="phanduoi.jsp"></jsp:include>
	<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>
</body>
</html>
