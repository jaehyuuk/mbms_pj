<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$().ready(function() {
		
		if ("${sessionScope.selectMember }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		}

	});
	
</script>
<script>
	function removeMember() {
		
		if ("${sessionScope.managementMember }" != "Y") {
			alert("삭제할 권한이 없습니다.");
			return false;
		}
		
		var memberIdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='memberId']:checked").each(function(){
				memberIdList += $(this).val() + ",";
			});
			
			if (memberIdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/admin/member/removeMember?memberIdList="+memberIdList;
		}
		
	}
	
	function selectAllMember() {
		
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='memberId']").prop("checked" , true);
		}
		else {
			$("[name='memberId']").prop("checked" , false);
		}
		
	}	
</script>
</head>
<body>
<!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h2 class="mb-4">Member</h2>
                            <input class="form-check-input"  type="checkbox" id="changeAllChoice" onchange="selectAllMember()"> &nbsp;Check All &nbsp;<a href="javascript:removeMember();" >Delete</a><br>
                            <a href="${contextPath }/admin/member/memberExcelExport" style="text-align: right"><i class="fa fa-download"></i> Excel</a> &emsp;&emsp;
                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Member ID</th>
                                            <th scope="col">Member Name</th>
                                            <th scope="col">Sex</th>
                                            <th scope="col">Birth Date</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Join Date</th>
                                            <th scope="col">Modify</th>
                                            <th scope="col"><i class="fa fa-check"></i></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
						            	<c:when test="${empty memberList }">
						            		<tr align="center">
						            			<td colspan="9">가입된 회원이 없습니다.</td>
						            		</tr>
						            	</c:when>
						            	<c:otherwise>
						            		<c:set var="idx" value="1" />
						            		<c:forEach var="memberDTO" items="${memberList }">
								              <tr>
								              	<td>${idx }</td>
								                <td><label for="${memberDTO.memberId }">${memberDTO.memberId }</label></td>
								                <td>${memberDTO.memberNm }</td>
								                <td>${memberDTO.sex }</td>
								                <td>${memberDTO.birthDt }</td>
								                <td>${memberDTO.hp }</td>
								                <td>${memberDTO.email }</td>
								                <td><fmt:formatDate value="${memberDTO.joinDt }" pattern="yyyy-MM-dd"/></td>
								                <td><a class="btn btn-sm btn-primary" href="${contextPath }/admin/member/adminMemberModify?memberId=${memberDTO.memberId}">Modify</a></td>
								                <td><input class="form-check-input"  type="checkbox" name="memberId" value="${memberDTO.memberId }" id="${memberDTO.memberId }"></td>
								              </tr>
									        <c:set var="idx" value="${idx = idx + 1 }"/>
						            		</c:forEach>
						            		<tr>
					            				<td colspan="9"><a href="javascript:removeMember();" >Delete</a></td>
					            			</tr>
					            		</c:otherwise>
					            	</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table End -->
</body>
</html>