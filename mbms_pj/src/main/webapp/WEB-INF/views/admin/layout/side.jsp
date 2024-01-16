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
		
		if (link.substr(0,6) == "/admin" && link != "/admin/member/adminLogin") {
			if ("${sessionScope.role }" != "admin") {
				alert("접근하실 수 없는 페이지입니다.");
				location.href="${contextPath}/admin/member/adminLogin";
			}
		}
			
		if (link == "/admin/movie/adminMovieList" || link == "/admin/movie/adminMovieModify" || link == "/admin/movie/adminAddMovie") {
			$("#dropdown").toggleClass('active')
		}
		else if (link == "/admin/member/adminMemberModify") {
			$("#member").toggleClass('active')
		}
		else {
			$("a[href*='"+link+"']").toggleClass('active')
		}
		
	});
 
</script>
</head>
<body>
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-secondary navbar-dark">
            <a href="${contextPath }/admin/main" class="navbar-brand mx-4 mb-3">
                <strong class="text-primary" style="font-size: x-large;">MOVIE<span style="color: white;">SYNC</span></strong>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <h4><i class="fa fa-user-edit me-2"></i></h4>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">${sessionScope.adminId }</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="${contextPath }/admin/main" class="nav-item nav-link"><i class="fa fa-home me-2"></i>Main</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="dropdown"><i class="fas fa-video me-2"></i>Movie</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="${contextPath }/admin/movie/adminMovieList" class="dropdown-item">List</a>
                        <a href="${contextPath }/admin/movie/adminAddMovie" class="dropdown-item">Add</a>
                    </div>
                </div>
                <a href="${contextPath }/admin/member/adminMemberList" class="nav-item nav-link" id="member"><i class="fa fa-user me-2"></i>Member</a>
                <a href="${contextPath }/admin/board/adminBoard" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Comments</a>
                <a href="${contextPath }/admin/order/adminOrder" class="nav-item nav-link"><i class="fa fa-film me-2"></i>Ticket</a>
                <a href="${contextPath }/admin/manager" class="nav-item nav-link"><i class="fa fa-user-tie me-2"></i>Manager</a>
            </div>
        </nav>
    </div>
</body>
</html>