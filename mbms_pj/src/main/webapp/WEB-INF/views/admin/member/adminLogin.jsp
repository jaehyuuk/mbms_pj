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
<!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <strong class="text-primary" style="font-size: x-large;"><i class="fa fa-user-edit me-2"></i>MOVIE<span style="color: white;">SYNC</span></strong>
                            </a>
                        </div>
                        <form action="${contextPath }/admin/member/adminLogin" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="adminId" placeholder="ID" required>
                            <label for="floatingInput">Admin ID</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" name="passwd" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>
                        <c:if test="${param.err == true}">
								<p style="color: red;">ID와 Password를 확인해주세요.</p>
						</c:if>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <br><a style="color: white;" href="${contextPath }/">Go to Main</a>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
</body>
</html>