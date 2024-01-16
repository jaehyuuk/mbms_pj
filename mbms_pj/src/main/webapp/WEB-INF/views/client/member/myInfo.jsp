<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   
	var isValidName = false;
	var isValidBirthDt = false;
	var isValidHp = false;
	var isValidEmail = false;
   
   function formSubmit() {
      
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
         url : "${contextPath}/member/modify",
         type : "post",
         data : param,
         success : function() {
            alert("수정되었습니다.");
         }
      });
      
   };
   
	$().ready(function() {   

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
	});
   
</script>
<script>
	function withdraw() {
		
		if(confirm('정말 탈퇴하시겠습니까?')) {
			location.href="/member/withdraw";
		}
		else {
			location.reload();
		}
		
	}
</script>
</head>
<body>
   <div class="container" style="margin-top: 50px;">
       <div class="row">
           <div class="col-lg-12 text-center">
               <div class="normal__breadcrumb__text">
                   <h2>My Info</h2>
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
                            <div class="input__item">
                                <input type="text"  id="memberId"  name="memberId" value="${memberDTO.memberId }"  disabled>
                                <span class="icon_profile"></span>
                            </div>
                            <span id="nameMsg"></span>
                            <div class="input__item">
                                <input type="text" id="memberNm" name="memberNm" value="${memberDTO.memberNm }" required>
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
                                <input type="text" id="hp" name="hp" value="${memberDTO.hp }" required>
                                <span class="icon_phone"></span>
                            </div>
                            <div style="color:white;">
                                SMS 수신에 동의하시겠습니까?
                                네 <input type="radio" name="smsstsYn" value="Y" checked>
                                아니요 <input type="radio" name="smsstsYn" value="N" >
                            </div><br>
                            <span id="emailMsg"></span>
                            <div class="input__item">
                               <input type="text" id="email" name="email" value="${memberDTO.email }" required>
                               <span class="icon_mail"></span>
                           </div>
                           <div style="color:white;">
                               이메일 수신에 동의하시겠습니까?
                               네 <input type="radio" name="emailstsYn" value="Y" checked>
                               아니요 <input type="radio" name="emailstsYn" value="N" >
                           </div><br>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                       <form action="#">
                           <div class="input__item">
                                 <input type="text" value="${memberDTO.zipcode }" id="zipcode" name="zipcode" style="width: 70%;">
                            <input type="button" onclick="javascript:execDaumPostcode()" value="검색" style="width: 28%;  padding-left: 0">
                            <span class="icon_mail"></span><br><br>
                               <input type="text" name="roadAddress" id="roadAddress" value="${memberDTO.roadAddress }" style="padding-left: 15px;"><br><br>
                        <input type="text"  name="jibunAddress" id="jibunAddress" value="${memberDTO.jibunAddress }" style="padding-left: 15px;"><br><br>
                        <input type="text" name="namujiAddress" id="namujiAddress" value="${memberDTO.namujiAddress }" style="padding-left: 15px;"><br><br>
                           </div>
                           &emsp;<input type="button" class="site-btn" value="Modify" onclick="formSubmit()" style="width: 155px;"/>
                           &emsp;<input type="button" class="site-btn" value="Withdraw" onclick="withdraw()"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
</body>
</html>