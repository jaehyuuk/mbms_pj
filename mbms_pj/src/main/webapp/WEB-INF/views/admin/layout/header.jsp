<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function openChrome() {
		window.open("${contextPath}/openChrome", "NAVER Ranking", "width=650, height=600");
	}
</script>
</head>
<body>
    <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0" style="height: 60px;">
        <a href="${contextPath }/admin/main" class="navbar-brand d-flex d-lg-none me-4" style="width: 10px;"> 
           <span class="text-primary mb-0"><i class="fa fa-user-edit"></i></span>
        </a>
        <a href="${contextPath }/admin/main" class="sidebar-toggler flex-shrink-0">
            <i class="fa fa-bars"></i>
        </a>
        <form class="d-none d-md-flex ms-4">
        	<!-- <input class="form-control bg-dark border-0" type="search" placeholder="Search"> -->
            <a href="javascript:openChrome()" class="btn btn-sm btn-primary">CGV RANKING</a>
        </form>
        <div class="navbar-nav align-items-center ms-auto">
        	<c:choose>
                <c:when test="${sessionScope.adminId eq null}">
                	<div><a href="${contextPath }/admin/member/adminLogin" class="dropdown-item">Log In</a></div>
                </c:when>
                <c:otherwise>
					<div><a href="${contextPath }/admin/member/adminLogout" class="dropdown-item">Log Out</a></div>
                </c:otherwise>
	        </c:choose>
        </div>
    </nav>
</body>
</html>