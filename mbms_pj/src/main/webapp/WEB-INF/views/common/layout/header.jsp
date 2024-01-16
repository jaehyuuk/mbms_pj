<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$().ready(function(){
		
		var link = document.location.pathname
			
		if (link.substr(0,8) == "/contact") {
			$("#contact").toggleClass('active')
		}
		else if (link.substr(0,15) == "/movie/category") {
			$("#category").toggleClass('active')
		}
		else {
			$("#movie").toggleClass('active')
		}
		
	});
 
</script>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="${contextpath }/">
                            <img src="${contextPath }/resources/bootstrap/img/logo.png" style="width: 140px; height: 35px;" >
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li id="movie"><a href="${contextpath }/">MOVIE</a></li>
                                <li id="category"><a href="${contextpath }/movie/category?genre=all">CATEGORIES<span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="${contextpath }/movie/category?genre=action">ACTION</a></li>
                                        <li><a href="${contextpath }/movie/category?genre=animation">ANIMATION</a></li>
                                        <li><a href="${contextpath }/movie/category?genre=drama">DRAMA</a></li>
                                        <li><a href="${contextpath }/movie/category?genre=fantasy">FANTASY</a></li>
                                        <li><a href="${contextpath }/movie/category?genre=romance">ROMANCE</a></li>
                                        <li><a href="${contextpath }/movie/category?genre=thriller">THRILLER</a></li>
                                    </ul>
                                </li>
                                <li id="contact"><a href="${contextPath }/contact">CONTACT</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a class="search-switch"><span class="icon_search"></span></a>
                        <c:choose>
	                        <c:when test="${sessionScope.memberId eq null}">
		                        <a href="${contextPath }/member/login"><i class="fa fa-sign-in"></i> <span style="font-size: 80%">Login</span></a> 
	                        </c:when>
		                    <c:otherwise>
		                       <a href="${contextPath }/member/myPage"><span class="icon_profile"></span></a>
		                       <a href="${contextPath }/member/logout"><span style="font-size: 80%">Logout</span></a>
		                    </c:otherwise>
	                  	</c:choose>
                    </div>
                 </div>
              </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
</body>
</html>