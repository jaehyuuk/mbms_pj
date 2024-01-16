<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="footer">
	    <div class="page-up">
	        <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
	    </div>
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-3">
	                <div class="footer__logo">
	                    <a href="${contextpath }/"><img src="${contextPath }/resources/bootstrap/img/logo.png" style="height: 35px; width: 140px;"></a>
	                </div>
	            </div>
	            <div class="col-lg-6">
	                <div class="footer__nav">
	                    <ul>
	                        <li class="active"><a href="${contextpath }/">MOVIE</a></li>
	                        <li><a href="${contextpath }/movie/category?genre=all">CATEGORIES</a></li>
	                        <li><a href="${contextPath }/contact">CONTACT</a></li>
	                    </ul>
	                </div>
	            </div>
	            <div class="col-lg-3">
	                <p align="center">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
	              </div>
	          </div>
	      </div>
	 </footer>
</body>
</html>