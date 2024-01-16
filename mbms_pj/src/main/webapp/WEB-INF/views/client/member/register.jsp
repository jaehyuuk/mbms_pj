<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var isValidId = false;
	var isValidConfirmPasswd = false;
	var isValidName = false;
	var isValidBirthDt = false;
	var isValidHp = false;
	var isValidEmail = false;
	
	function formSubmit() {
		
		if (!isValidId) {
			$("#idMsg").html("<span style='color:red'>아이디를 확인하세요.</span>");
			return false;
		}
		
		if (!isValidConfirmPasswd) {
			$("#passwdMsg").html("<span style='color:red'>패스워드를 확인하세요.</span>");
			$("#confirmPasswd").focus();
			return false;
		}
		
		if (!isValidName) {
			$("#nameMsg").html("<span style='color:red'>이름을 작성하세요.</span>");
			$("#memberNm").focus();
			return false;
		}
		
		if (!isValidBirthDt) {
			$("#birthMsg").html("<span style='color:red'>날짜를 선택하세요.</span>");
			$("#birthDt").focus();
			return false;
		}
		
		if (!isValidHp) {
			$("#hpMsg").html("<span style='color:red'>전화번호를 입력하세요.</span>");
			$("#hp").focus();
			return false;
		}
		
		if (!isValidEmail) {
			$("#emailMsg").html("<span style='color:red'>이메일을 작성하세요.</span>");
			$("#email").focus();
			return false;
		}
		
	    var param = {
	    		"memberId" : $("[name='memberId']").val(),
	    		"passwd" : $("[name='passwd']").val(),
	    		"memberNm" : $("[name='memberNm']").val(),
	    		"sex" : $("[name='sex']:checked").val(),
	    		"birthDt" : $("[name='birthDt']").val(),
	    		"hp" : $("[name='hp']").val(),
	    		"smsstsYn" : $("[name='smsstsYn']:checked").val(),
	    		"email" : $("[name='email']").val(),
	    		"emailstsYn" : $("[name='emailstsYn']:checked").val(),
	    		"zipcode" : $("[name='zipcode']").val(),
	    		"roadAddress" : $("[name='roadAddress']").val(),
	    		"jibunAddress" : $("[name='jibunAddress']").val(),
	    		"namujiAddress" : $("[name='namujiAddress']").val()
	    };
	    
		$.ajax({
			url : "${contextPath}/member/register",
			type : "post",
			data : param,
			success : function() {
				alert("회원가입되었습니다.");
				location.href = "${contextPath}/member/login"
			}
		});
		
	};
	
	$().ready(function() {
		
		$("#confirmPasswd").blur(function(){
			
			if ($("#passwd").val() != "") {
				
				if ($("#passwd").val() == $("#confirmPasswd").val()){
					$("#passwdMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
					isValidConfirmPasswd = true;
				}
				else {
					isValidConfirmPasswd = false;
				}
				
			}
			else {
				isValidConfirmPasswd = false;
			}
			
		});
		
		$("#memberNm").blur(function(){
			
			if ($("#memberNm").val() == "") {
				isValidName = false;
			} else {
				$("#nameMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidName = true;
			}
		
		});
		

		$("#birthDt").blur(function(){
			
			if ($("#birthDt").val() == "") {
				isValidBirthDt = false;
			} else {
				$("#birthMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidBirthDt = true;
			}
			
		});

		$("#hp").blur(function(){
			
			if ($("#hp").val() == "") {
				isValidHp = false;
			} else {
				$("#hpMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidHp = true;
			}
			
		});
		
		$("#email").blur(function(){
			
			if ($("#email").val() == "") {
				isValidEmail = false;
			} else {
				$("#emailMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
				isValidEmail = true;
			}
			
		});

		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		    	$("#idMsg").html("<span style='color:red'>아이디를 입력하세요.</span>");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
		       success : function (data){
		          if (data == "duplicate"){
		        	  $("#idMsg").html("<span style='color:red'>사용할 수 없는 아이디입니다.</span>");
					  isValidId = false;
		          }
		          else {
		        	  $("#idMsg").html("<span style='color:green'><i class='fa fa-check'></i></span>");
		          	  isValidId = true;
		          }
		       }
		    });
		 });	
	 });
	
</script>
</head>
<body>
	<div class="container" style="margin-top: 50px;">
	    <div class="row">
	        <div class="col-lg-12 text-center">
	            <div class="normal__breadcrumb__text">
	                <h2>Register</h2>
	                <p>Welcome to the <strong style="color: #e53637;">MOVIESYNC</strong>.</p>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <form action="#">
                        	<span id="idMsg"></span>
                            <div class="input__item">
                                <input type="text"  id="memberId"  name="memberId" placeholder="아이디를 입력하세요."  style="width: 70%;" required>
                                <input type="button" id="btnOverlapped" value="중복확인" style="width: 28%; padding-left: 0">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요." required>
                                <span class="icon_lock"></span>
                            </div>
                            <span id="passwdMsg"></span>
                            <div class="input__item">
                                <input type="password" id="confirmPasswd" placeholder="비밀번호를 확인하세요." required>
                                <span class="icon_lock"></span>
                            </div>
                            <span id="nameMsg"></span>
                            <div class="input__item">
                                <input type="text" id="memberNm" name="memberNm" placeholder="이름을 입력하세요." required>
                                <span class="icon_pencil"></span>
                            </div>
                            <div style="color:white;">
                               	 성별 : 남 &nbsp;<input type="radio" name="sex" value="m" checked> &emsp;
								 		여 &nbsp;<input type="radio" name="sex" value="f">
                            </div><br>
                            <span id="birthMsg"></span>
                            <div style="color:white;">
                            	생년월일 : &nbsp;<input type="date" id="birthDt" name="birthDt">
                            </div><br>
                            <span id="hpMsg"></span>
                            <div class="input__item">
                                <input type="text" id="hp" name="hp" placeholder="010-0000-0000" required>
                                <span class="icon_phone"></span>
                            </div>
                            <div style="color:white;">
                                SMS 수신에 동의하시겠습니까?
                                네 <input type="radio" name="smsstsYn" value="Y" checked>
                                아니요 <input type="radio" name="smsstsYn" value="N" >
                            </div><br>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                    	<form action="#">
                    	    <span id="emailMsg"></span>
	                        <div class="input__item">
	                        	<input type="text" id="email" name="email" placeholder="@를 포함해서 입력하세요." required>
	                            <span class="icon_mail"></span>
	                        </div>
	                        <div style="color:white;">
                               이메일 수신에 동의하시겠습니까?
                               네 <input type="radio" name="emailstsYn" value="Y" checked>
                               아니요 <input type="radio" name="emailstsYn" value="N" >
	                        </div><br>
	                        <div class="input__item">
	                           	<input type="text" placeholder="우편번호 입력" id="zipcode" name="zipcode" style="width: 70%;">
	                			<input type="button" onclick="javascript:execDaumPostcode()" value="검색" style="width: 28%;  padding-left: 0">
	                			<span class="icon_mail"></span><br><br>
	                            <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명 주소를 입력하세요." style="padding-left: 15px;"><br><br>
								<input type="text"  name="jibunAddress" id="jibunAddress" placeholder="지번 주소를 입력하세요." style="padding-left: 15px;"><br><br>
								<input type="text" name="namujiAddress" id="namujiAddress" placeholder="나머지 주소를 입력하세요." style="padding-left: 15px;"><br><br>
	                        </div>
	                        <input type="button" class="site-btn" value="Register Now" onclick="formSubmit()"/>
                        </form>
                        <h5>Already have an account? <a href="${contextPath }/member/login">Log In!</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
</body>
</html>