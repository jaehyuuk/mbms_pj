<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$().ready(function() {
		
		if ("${sessionScope.managementMember }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		}
		
		if ('${memberDTO.sex }' == 'm') $("[name='sex'][value='m']").prop('checked', true);
		else 							$("[name='sex'][value='f']").prop('checked', true);
		
		if ('${memberDTO.smsstsYn }' == 'Y') $("[name='smsstsYn'][value='Y']").prop('checked', true);
		else 								 $("[name='smsstsYn'][value='N']").prop('checked', true);
		
		if ('${memberDTO.emailstsYn }' == 'Y') $("[name='emailstsYn'][value='Y']").prop('checked', true);
		else 								   $("[name='emailstsYn'][value='N']").prop('checked', true);

	});
	
</script>
</head>
<body>
<!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h2 class="mb-4">Modify Member</h2>
                            <form action="${contextPath }/admin/member/adminMemberModify" method="post">
                            	<input type="hidden" name="memberId" value="${memberDTO.memberId }">
	                            <div class="mb-3">
	                                <label class="form-label">Member ID</label>
	                                <input type="text" class="form-control" name="memberId" value="${memberDTO.memberId }" disabled>
	                            </div>
                                <div class="mb-3">
                                    <label class="form-label">Member Name</label>
                                    <input type="text" class="form-control" name="memberNm" value="${memberDTO.memberNm }">
                                </div>
                                <label class="form-label">Sex</label><br>
                                <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sex" value="m">
                                <label class="form-check-label">Male</label>
	                            </div>
	                            <div class="form-check form-check-inline">
	                                <input class="form-check-input" type="radio" name="sex" value="f">
	                                <label class="form-check-label">Female</label>
	                            </div><br><br>
                                <div class="mb-3">
                                    <label class="form-label">Birth</label>
                                    <input type="date" class="form-control" name="birthDt" value="${memberDTO.birthDt }" >
                                </div>
	                            <div class="mb-3">
	                                <label class="form-label">Phone</label>
	                                <input type="text" class="form-control" name="hp" value="${memberDTO.hp }">
	                            </div>
	                            <label class="form-label">SMS 수신에 동의하시겠습니까?</label>&emsp;
	                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="smsstsYn" value="Y">
                                <label class="form-check-label">Y</label>
	                            </div>
	                            <div class="form-check form-check-inline">
	                                <input class="form-check-input" type="radio" name="smsstsYn" value="N">
	                                <label class="form-check-label">N</label>
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">Email</label>
	                                <input type="email" class="form-control" name="email" value="${memberDTO.email }">
	                            </div>
	                            <label class="form-label">E-mail 수신에 동의하시겠습니까?</label>&emsp;
	                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="emailstsYn" value="Y">
                                <label class="form-check-label">Y</label>
	                            </div>
	                            <div class="form-check form-check-inline">
	                                <input class="form-check-input" type="radio" name="emailstsYn" value="N">
	                                <label class="form-check-label">N</label>
	                            </div><br><br>
	                                <label class="form-label">Zip Code</label><br>
	                            <div class="mb-3">
		                            <input type="text" class="form-control" value="${memberDTO.zipcode }" name="zipcode" style="width: 30%; display: initial;">
		                            <input type="button" class="btn btn-primary m-2" onclick="javascript:execDaumPostcode()" value="검색" style="width: 5%;">
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">Road Address</label>
	                                <input type="text" class="form-control" name="roadAddress" value="${memberDTO.roadAddress }" >
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">Jibun Address</label>
	                                <input type="text" class="form-control" name="jibunAddress" value="${memberDTO.jibunAddress }" >
	                            </div>
	                            <div class="mb-3">
	                                <label class="form-label">Namuji Address</label>
	                                <input type="text" class="form-control" name="namujiAddress" value="${memberDTO.namujiAddress }" >
	                            </div>
                                <button type="submit" class="btn btn-primary">Modify Member</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<!-- Form End -->
</body>
</html>
 