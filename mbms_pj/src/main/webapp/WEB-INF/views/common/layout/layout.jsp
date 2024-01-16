<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><tiles:insertAttribute name="title" /> </title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/style.css" type="text/css">
	<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		
		            var fullRoadAddr = data.roadAddress; 
		            var extraRoadAddr = ''; 
		
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if (data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if (extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            if (fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
		
		            document.getElementById('zipcode').value = data.zonecode;
		            document.getElementById('roadAddress').value = fullRoadAddr;
		            document.getElementById('jibunAddress').value = data.jibunAddress;
		          
		        }
		    }).open();
		}
	</script>	
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<tiles:insertAttribute name="header"/>
    <!-- Header Section End -->
	
	<!-- Body Section Begin -->
	<tiles:insertAttribute name="body" />
	<!-- Body Section End -->

	<!-- Footer Section Begin -->
	<tiles:insertAttribute name="footer" />
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
    	<div class="h-100 d-flex align-items-center justify-content-center">
        	<div class="search-close-switch"><i class="icon_close"></i></div>
	        <form class="search-model-form" action="${contextPath }/movie/search" method="post">
	            <input type="text" id="search-input" name="search" placeholder="Search here.....">
	        </form>
   		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="${contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/player.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/mixitup.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/jquery.slicknav.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/main.js"></script>
</body>
</html>