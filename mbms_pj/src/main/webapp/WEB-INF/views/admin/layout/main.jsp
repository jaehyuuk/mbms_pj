<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fas fa-video fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Movie</p>
                                <h6 class="mb-0"><a href="${contextPath }/admin/movie/adminMovieList">${movieCnt }개</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-user fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Member</p>
                                <h6 class="mb-0"><a href="${contextPath }/admin/member/adminMemberList">${memberCnt }명</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-table fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Comment</p>
                                <h6 class="mb-0"><a href="${contextPath }/admin/board/adminBoard">${boardCnt }개</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-film fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Ticket</p>
                                <h6 class="mb-0"><a href="${contextPath }/admin/order/adminOrder">${orderCnt }장</a></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sale & Revenue End -->


            <!-- Movie Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Movie</h6>
                        <a href="${contextPath }/admin/movie/adminMovieList">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col">Code</th>
                                    <th scope="col">Movie Name</th>
                                    <th scope="col">Director</th>
                                    <th scope="col">Genre</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Date</th>
                                    <th scope="col"><i class="fa fa-star"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
				            	<c:when test="${empty movieList }">
				            		<tr align="center">
				            			<td colspan="7">등록된 영화가 없습니다.</td>
				            		</tr>
				            	</c:when>
				            	<c:otherwise>
				            		<c:forEach var="movieDTO" items="${movieList }" begin="0" end="4">
						              <tr>
						                <td>${movieDTO.movieCd }</td>
						                <td>${movieDTO.movieNm }</td>
						                <td>${movieDTO.director }</td>
						                <td>${movieDTO.genre }</td>
						                <td>${movieDTO.runningTime }</td>
						                <td><fmt:formatDate value="${movieDTO.releaseDt }" pattern="yyyy-MM-dd"/></td>
						                <td>${movieDTO.ratings }</td>
						              </tr>
				            		</c:forEach>
			            		</c:otherwise>
			            	</c:choose>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Movie End -->

            <!-- Member Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Member</h6>
                        <a href="${contextPath }/admin/member/adminMemberList">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col">Member ID</th>
                                    <th scope="col">Member Name</th>
                                    <th scope="col">Sex</th>
                                    <th scope="col">Birth Date</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Join Date</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
				            	<c:when test="${empty memberList }">
				            		<tr align="center">
				            			<td colspan="7">가입된 회원이 없습니다.</td>
				            		</tr>
				            	</c:when>
				            	<c:otherwise>
				            		<c:forEach var="memberDTO" items="${memberList }" begin="0" end="4">
						              <tr>
						                <td>${memberDTO.memberId }</td>
						                <td>${memberDTO.memberNm }</td>
						                <td>${memberDTO.sex }</td>
						                <td>${memberDTO.birthDt }</td>
						                <td>${memberDTO.hp }</td>
						                <td>${memberDTO.email }</td>
						                <td><fmt:formatDate value="${memberDTO.joinDt }" pattern="yyyy-MM-dd"/></td>
						              </tr>
				            		</c:forEach>
			            		</c:otherwise>
			            	</c:choose>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Member End -->
            
            <!-- Board Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Board</h6>
                        <a href="${contextPath }/admin/board/adminBoard">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                   <th scope="col">Board Code</th>
                                   <th scope="col">Member ID</th>
                                   <th scope="col">Movie Code</th>
                                   <th scope="col">Comment</th>
                                   <th scope="col">Ratings</th>
                                   <th scope="col">Enroll Date</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
				            	<c:when test="${empty boardList }">
				            		<tr align="center">
				            			<td colspan="6">작성된 코멘트가 없습니다.</td>
				            		</tr>
				            	</c:when>
				            	<c:otherwise>
				            		<c:forEach var="boardDTO" items="${boardList }" begin="0" end="4">
						              <tr>
						                <td>${boardDTO.boardCd }</td>
						                <td>${boardDTO.memberId }</td>
						                <td>${boardDTO.movieCd }</td>
						                <td>${boardDTO.comment }</td>
						                <td>${boardDTO.ratings }</td>
						                <td><fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						              </tr>
				            		</c:forEach>
			            		</c:otherwise>
			            	</c:choose>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Board End -->
            
            <!-- Order Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Order</h6>
                        <a href="${contextPath }/admin/order/adminOrder">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                   <th scope="col">Ticket Code</th>
                                   <th scope="col">Movie Name</th>
                                   <th scope="col">Member ID</th>
                                   <th scope="col">Seat</th>
                                   <th scope="col">Ticket Amt</th>
                                   <th scope="col">Price</th>
                                   <th scope="col">Order Time</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
				            	<c:when test="${empty orderList }">
				            		<tr align="center">
				            			<td colspan="7">예매내역이 없습니다.</td>
				            		</tr>
				            	</c:when>
				            	<c:otherwise>
				            		<c:forEach var="orderDTO" items="${orderList }" begin="0" end="4">
						              <tr>
						                <td>${orderDTO.ticketCd }</td>
						                <td>${orderDTO.movieNm }</td>
						                <td>${orderDTO.memberId }</td>
						                <td>${orderDTO.seat }</td>
						                <td>${orderDTO.paymentAmt }</td>
						                <td><fmt:formatNumber value="${orderDTO.price }" pattern=",000"/></td>
						                <td><fmt:formatDate value="${orderDTO.payOrderTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						              </tr>
				            		</c:forEach>
			            		</c:otherwise>
			            	</c:choose>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Order End -->

</body>
</html>