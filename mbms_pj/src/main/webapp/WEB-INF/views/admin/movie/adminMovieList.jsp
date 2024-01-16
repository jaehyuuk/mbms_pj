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
		
		if ("${sessionScope.selectMovie }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		};

	});
	
</script>
<script>
	function removeMovie() {
		
		if ("${sessionScope.managementMovie }" != "Y") {
			alert("삭제할 권한이 없습니다.");
			return false;
		}
		
		var movieCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='movieCd']:checked").each(function(){
				movieCdList += $(this).val() + ",";
			});
			
			if (movieCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/admin/movie/removeMovie?movieCdList="+movieCdList;
		}
		
	}
	
	function selectAllMovie() {
		
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='movieCd']").prop("checked" , true);
		}
		else {
			$("[name='movieCd']").prop("checked" , false);
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
                            <h2 class="mb-4">Movie</h2>
                            <input class="form-check-input"  type="checkbox" id="changeAllChoice" onchange="selectAllMovie()"> &nbsp;Check All &nbsp;<a href="javascript:removeMovie();" >Delete</a><br>
                            <a href="${contextPath }/admin/movie/movieExcelExport"><i class="fa fa-download"></i> Excel</a>
                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Code</th>
                                            <th scope="col">Movie Name</th>
                                            <th scope="col">Director</th>
                                            <th scope="col">Time</th>
                                            <th scope="col">Date</th>
                                            <th scope="col"><i class="fa fa-star"></i></th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Modify</th>
                                            <th scope="col"><i class="fa fa-check"></i></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
						            	<c:when test="${empty movieList }">
						            		<tr align="center">
						            			<td colspan="9">등록된 영화가 없습니다.</td>
						            		</tr>
						            	</c:when>
						            	<c:otherwise>
						            		<c:set var="idx" value="1" />
						            		<c:forEach var="movieDTO" items="${movieList }">
								              <tr>
								              	<td>${idx }</td>
								                <td>${movieDTO.movieCd }</td>
								                <td><label for="${movieDTO.movieCd }">${movieDTO.movieNm }</label></td>
								                <td>${movieDTO.director }</td>
								                <td>${movieDTO.runningTime }</td>
								                <td><fmt:formatDate value="${movieDTO.releaseDt }" pattern="yyyy-MM-dd"/></td>
								                <td>${movieDTO.ratings }</td>
								                <td><img style="height: 80px; width: 60px;" src="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}" onclick="location.href='${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre}'"></td>
								                <td><a class="btn btn-sm btn-primary" href="${contextPath }/admin/movie/adminMovieModify?movieCd=${movieDTO.movieCd}">Modify</a></td>
								                <td><input class="form-check-input"  type="checkbox" name="movieCd" id="${movieDTO.movieCd }" value="${movieDTO.movieCd }"></td>
								              </tr>
									        <c:set var="idx" value="${idx = idx + 1 }"/>
						            		</c:forEach>
						            		<tr>
					            				<td colspan="9"><a href="javascript:removeMovie();" >Delete</a></td>
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