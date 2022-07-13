<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-teal, .w3-hover-teal:hover {
    color: #ffc107!important;
    background-color: #000!important;
}
.w3-sidebar {
    height: 100%;
    width: 100px;
    background-color: #000;
    color: #ffc107!important;
}
.w3-button:hover {
    color: #000!important;
}
.w3-card, .w3-card-2 {
    box-shadow: 0 2px 5px 0 #ffc107, 0 2px 10px 0 #ffc107;
}
</style>
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large text-right"
  onclick="w3_close()">|||</button>
  <a href="quan-ly.htm" class="w3-bar-item w3-button">Quản lý</a>
  <a href="danh-muc.htm" class="w3-bar-item w3-button">Danh mục SP</a>
  <a href="thuong-hieu.htm" class="w3-bar-item w3-button">Thương hiệu</a>
  <a href="nguoi-dung.htm" class="w3-bar-item w3-button">Người dùng</a>
  <a href="ad-san-pham.htm" class="w3-bar-item w3-button">Sản Phẩm</a>
  <a href="ad-don-hang.htm" class="w3-bar-item w3-button">Đơn Hàng</a>
  <div class="w3-dropdown-hover">
    <button class="w3-button"><i class="fa fa-caret-down">${taiKhoan.tenTK } </i></button>
    <div class="w3-dropdown-content w3-bar-block">
      <a href="dang-xuat.htm" class="w3-bar-item w3-button">Đăng xuất</a>
    </div>
  </div>
</div>
<script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "15%";
  document.getElementById("mySidebar").style.width = "15%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}
</script>
<!--  -->
<div id="main">
<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1><a href="trang-chu.htm"><img src="resources/images/web/T-icon.ico" alt="logo" style="width:5%"></a>  Trùm Điện Máy</h1>
  </div>
</div>


