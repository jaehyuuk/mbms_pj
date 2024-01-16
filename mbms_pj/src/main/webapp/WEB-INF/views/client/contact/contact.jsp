<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var isValidWriter = false;
	var isValidEmail = false;
	var isValidContent = false;
	
	function sendMail() {
		if ("${sessionScope.memberId == null}" == "true") {
			location.href="${contextPath}/member/login";
		}
		else {
			
			if (!isValidWriter) {
				$("#writerMsg").html("<span style='color:red'>이름을 작성하세요.</span>");
				$("#writer").focus();
				return false;
			}
			if (!isValidEmail) {
				$("#emailMsg").html("<span style='color:red'>이메일을 작성하세요.</span>");
				$("#email").focus();
				return false;
			}
			if (!isValidContent) {
				$("#contentMsg").html("<span style='color:red'>내용을 작성하세요.</span>");
				$("#content").focus();
				return false;
			}
			
			alert("이메일이 전송되었습니다.");
			location.href = "${contextPath}/";
		 
			var param = {
				"writer" : $("[name='writer']").val(),
				"email" : $("[name='email']").val(),
				"content": $("[name='content']").val()
			};
			console.log(param);
			$.ajax({
				url : "${contextPath}/sendMail",
				type : "post",
				data : param,
			});
		}
	};
	
	$().ready(function() {
		
		$("#writer").blur(function() {
			
			if ($("#writer").val() == "") {
				isValidWriter = false;
			} else {
				$("#writerMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidWriter = true;
			}
		});
		
		$("#email").blur(function() {
			
			if ($("#email").val() == "") {
				isValidEmail = false;
			} else {
				$("#emailMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidEmail = true;
			}
		});
		
		$("#content").blur(function() {
			
			if ($("#content").val() == "") {
				isValidContent = false;
			} else {
				$("#contentMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidContent = true;
			}
		});
		
	});
	
	

</script>
</head>
<body>
	<div class="container" style="margin-top: 50px;">
	    <div class="row">
	        <div class="col-lg-12 text-center">
	            <div class="normal__breadcrumb__text">
	                <h2>Contact</h2>
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
                        <h4><strong>Your Info</strong></h4><br>
                        <form>
                        	<span id="writerMsg"></span>
                            <div class="input__item">
                                <input type="text" id="writer" name="writer" placeholder="이름을 입력하세요.">
                                <span class="icon_profile"></span>
                            </div>
                        	<span id="emailMsg"></span>    
                            <div class="input__item">
                                <input type="email" id="email" name="email" placeholder="이메일을 입력하세요.">
                                <span class="icon_mail"></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="anime__details__form">
                            <div class="section-title">
                                <h5>Contact</h5>
                            </div>
                            <form>
                            <span id="contentMsg"></span> 
                            	<textarea name="content" id="content" placeholder="If you have any questions, please contact our customer service."></textarea>
                                <input type="button" class="site-btn" value="Send" onclick="sendMail()"> 
                            </form>
                        </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->
</body>
</html>