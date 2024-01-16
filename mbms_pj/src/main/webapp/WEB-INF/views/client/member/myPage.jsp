<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="col-lg-12">
      <div class="heading-section">
        <h4 align="center" style="margin-top: 20px;"><strong><span style="color: white;">My</span> Page</strong></h4>
      </div>
    </div>
	<div class="container">
	  <div class="row">
	    <div class="col-lg-12">
	      <div class="page-content">
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="main-profile">
	              <div class="row">
                   	<c:choose>
                   		<c:when test="${empty myTicketList}">
                            <div class="product__item" style="height: 35px;">
                    			<div class="main-button" style="margin-top: -17px; margin-left: 10px;">
                 				<a href="${contextPath }/movie/category?genre=all"><i class="fa fa-ticket"></i> 예매하러가기</a>
               					</div>
                            </div>
                   		</c:when>
                   		<c:otherwise>
	                    	<c:forEach var="ticketDTO" items="${myTicketList }">
		                        <div class="col-lg-4">
		                          <a href="${contextPath }/movie/detail?movieCd=${ticketDTO.movieCd}&genre=${ticketDTO.genre}">
				                  <img src="${contextPath }/thumbnails?imgNm=${ticketDTO.imgNm}" style="border-radius: 23px;">
				                  </a>
				                </div>
				                <div class="col-lg-4 align-self-center">
				                  <div class="main-info header-text">
				                    <span>Ticket</span>
				                    <h4><a style="color: white;" href="${contextPath }/movie/detail?movieCd=${ticketDTO.movieCd}&genre=${ticketDTO.genre}">${ticketDTO.movieNm }</a></h4>
				                    <p style="color: #666; font-size: 14px;">${ticketDTO.director }
				                    <br>${ticketDTO.runningTime }</p>
				                    <p style="color: white;">좌석 : ${ticketDTO.seat }</p>
				                    <div class="main-border-button">
				                      <a href="${contextPath }/member/cancel?ticketCd=${ticketDTO.ticketCd}">예매 취소하기</a>
				                    </div>
				                  </div>
				                </div>
				                <div class="col-lg-4 align-self-center">
				                  <ul>
				                    <li>티켓번호 <span>${ticketDTO.ticketCd }<fmt:formatDate value="${ticketDTO.payOrderTime }" pattern="yyyyMMddHHmm"/>${ticketDTO.movieCd }</span></li>
				                    <li>예매일시 <span><fmt:formatDate value="${ticketDTO.payOrderTime }" pattern="MM월dd일 HH:mm"/></span></li>
				                    <li>인원 <span>${ticketDTO.paymentAmt }명</span></li>
				                    <li>가격 <span><fmt:formatNumber value="${ticketDTO.price }" pattern=",000"/>원</span></li>
				                  </ul>
				                </div>
	                    	</c:forEach>
                   		</c:otherwise>
                   	</c:choose>
	              </div>
	              <div class="row">
	                <div class="col-lg-12">
	                  <div class="clips">
	                    <div class="row">
	                    <c:choose>
	                    	<c:when test="${empty myTicketList}">
	                    	<div class="col-lg-12">
	                        <div class="heading-section">
	                          <h4><strong><em>RECOMMEND</em> MOVIE</strong></h4>
	                        </div>
	                      </div>
                    	  <c:forEach var="movieDTO" items="${movieList }">
		                      <div class="col-lg-3 col-sm-6">
		                        <div class="item">
		                          <div class="thumb">
		                            <img src="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}" style="border-radius: 23px;">
		                          </div>
		                          <div class="down-content">
		                            <h4><a style="color: white;" href="${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre}">${movieDTO.movieNm }</a></h4>
		                            <span><i class="fa fa-star"></i>${movieDTO.ratings }</span>
		                          </div>
		                        </div>
		                      </div>
                    	  	</c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
		                    	<div class="col-lg-12">
		                        <div class="heading-section">
		                          <h4><strong><em>RELATED</em> MOVIE</strong></h4>
		                        </div>
		                      </div>
	                    	  <c:forEach var="relatedMovieDTO" items="${relatedMovieList }">
			                      <div class="col-lg-3 col-sm-6">
			                        <div class="item">
			                          <div class="thumb">
			                            <img src="${contextPath }/thumbnails?imgNm=${relatedMovieDTO.imgNm}" style="border-radius: 23px;">
			                          </div>
			                          <div class="down-content">
			                            <h4><a style="color: white;" href="${contextPath }/movie/detail?movieCd=${relatedMovieDTO.movieCd}&genre=${relatedMovieDTO.genre}">${relatedMovieDTO.movieNm }</a></h4>
			                            <span><i class="fa fa-star"></i>${relatedMovieDTO.ratings }</span>
			                          </div>
			                        </div>
			                      </div>
	                    	  	</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        <!-- ***** Banner End ***** -->
	
	        <!-- ***** Gaming Library Start ***** -->
	        <div class="gaming-library profile-library" id="wishListSection">
	          <div class="col-lg-12">
	            <div class="heading-section">
	              <h4><strong><em>WISH</em>LIST</strong></h4>
	            </div>
                <c:choose>
                	<c:when test="${empty wishList}">
                    	<div class="item">
							<h4>위시리스트가 없습니다.</h4>
                        </div>
                	</c:when>
                 <c:otherwise>
                 <c:forEach var="wishDTO" items="${wishList }">
                     <div class="item">
		              <ul>
		                <li><a href="${contextPath }/movie/detail?movieCd=${wishDTO.movieCd}&genre=${wishDTO.genre}"><img src="${contextPath }/thumbnails?imgNm=${wishDTO.imgNm}" class="templatemo-item"></a></li>&emsp;
		                <li><span>제목</span><h4><a style="color: white;" href="${contextPath }/movie/detail?movieCd=${wishDTO.movieCd}&genre=${wishDTO.genre}">${wishDTO.movieNm }</a></h4></li>
		                <li><span>감독</span><h4>${wishDTO.director }</h4></li>
		                <li><span>상영시간</span><h4>${wishDTO.runningTime }</h4></li>
		                <li><span>개봉일</span><h4>${wishDTO.releaseDt }</h4></li>
		                <li><div class="main-border-button border-no-active"><a href="${contextPath }/member/deleteWish?wishListCd=${wishDTO.wishListCd }">Delete</a></div></li>
		              </ul>
		            </div>
                  	</c:forEach>
                 	</c:otherwise>
                 </c:choose>
	          </div>
	        </div>
	        <!-- ***** Gaming Library End ***** -->
	        <div class="col-lg-12" align="center" style="top: 20px;">
               <div class="main-button">
                 <a href="${contextPath }/member/myInfo?memberId=${sessionScope.memberId }">My Info</a>
               </div>
             </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>