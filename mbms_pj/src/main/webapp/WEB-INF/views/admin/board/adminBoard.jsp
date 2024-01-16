<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		if ("${sessionScope.selectComment }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		}

	});
	
</script>
<script>

	function removeBoard() {
		
		if ("${sessionScope.managementComment }" != "Y") {
			alert("삭제할 권한이 없습니다.");
			return false;
		}
		
		var boardCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='boardCd']:checked").each(function(){
				boardCdList += $(this).val() + ",";
			});
			
			if (boardCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/admin/board/removeBoard?boardCdList="+boardCdList;
		}
		
	}
	
	function selectAllBoard() {
		
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='boardCd']").prop("checked" , true);
		}
		else {
			$("[name='boardCd']").prop("checked" , false);
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
                            <h2 class="mb-4">Comment</h2>
                            <input class="form-check-input"  type="checkbox" id="changeAllChoice" onchange="selectAllBoard()"> &nbsp;Check All &nbsp;<a href="javascript:removeBoard();" >Delete</a>
                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Member ID</th>
                                            <th scope="col">Movie Code</th>
                                            <th scope="col">Comment</th>
                                            <th scope="col">Ratings</th>
                                            <th scope="col">Enroll Date</th>
                                            <th scope="col">Check box</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
						            	<c:when test="${empty boardList }">
						            		<tr align="center">
						            			<td colspan="7">작성된 코멘트가 없습니다.</td>
						            		</tr>
						            	</c:when>
						            	<c:otherwise>
						            		<c:set var="idx" value="1" />
						            		<c:forEach var="boardDTO" items="${boardList }">
								              <tr>
								              	<td>${idx }</td>
								                <td>${boardDTO.memberId }</td>
								                <td>${boardDTO.movieCd }</td>
								                <td>${boardDTO.comment }</td>
								                <td>${boardDTO.ratings }</td>
								                <td><fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								                <td><input class="form-check-input"  type="checkbox" name="boardCd" value="${boardDTO.boardCd }"></td>
								              </tr>
									        <c:set var="idx" value="${idx = idx + 1 }"/>
						            		</c:forEach>
					            			<tr>
					            				<td colspan="7"><a href="javascript:removeBoard();" >Delete</a></td>
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