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
	<div class="container" style="margin-top: 50px;">
	    <div class="row">
	        <div class="col-lg-12 text-center">
	            <div class="normal__breadcrumb__text">
	                <h2>Login</h2>
	                <p>Welcome to the <strong style="color: #e53637;">MOVIESYNC</strong>.</p>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="${contextPath }/member/login" method="post">
                            <div class="input__item">
                                <input type="text" name="memberId" placeholder="ID" required>
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="passwd" placeholder="Password" required>
                                <span class="icon_lock"></span>
                            </div>
							<c:if test="${param.err == true}">
								<p style="color: red">ID와 Password를 확인해주세요.</p>
							</c:if><br>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>Dont’t Have An Account?</h3>
                        <a href="${contextPath}/member/register" class="primary-btn">Register Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->
</body>
</html>