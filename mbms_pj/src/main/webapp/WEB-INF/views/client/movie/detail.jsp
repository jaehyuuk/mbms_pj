<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function ticketOrder(){
		
		if ("${sessionScope.memberId == null}" == "true") {
			location.href="${contextPath}/member/login"
		}
		else {
			window.open("${contextPath}/ticket?movieCd=${movieDTO.movieCd}", "ticket", "width=640, height=640");
		}
		
	}
	
	function wishMovie() {
		
		if ("${sessionScope.memberId == null}" == "true") {
			location.href="${contextPath}/member/login"
		}
		else {
			if ($("#follow").hasClass("fa fa-heart-o")){
				
				var param = {
						"memberId" : $("#memberId").val(),
			    		"movieCd"  : $("#movieCd").val()
			    };
			    
				$.ajax({
					url : "${contextPath}/member/myPage",
					type : "post",
					data : param,
					success : function() {
						$("#follow").attr("class", "fa fa-heart");
					}
				});
				
			}
			else {
				
				var param = {
						"memberId" : $("#memberId").val(),
			    		"movieCd"  : $("#movieCd").val()
			    };
			    
				$.ajax({
					url : "${contextPath}/member/deleteHeart",
					type : "get",
					data : param,
					success : function() {
						$("#follow").attr("class", "fa fa-heart-o");
					}
				});
			}
		}
	}
</script>
</head>
<body>
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Movie</a>
                        <a href="${contextpath }/movie/category?genre=all">Categories</a>
                        <span style="text-transform: capitalize;">${movieDTO.genre }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="anime__details__pic set-bg" data-setbg="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}"></div>
                    </div>
                    <div class="col-lg-8">
                        <div class="anime__details__text">
                            <div class="anime__details__title">
                                <h3>${movieDTO.movieNm }</h3>
                                <span>${movieDTO.director }</span>
                            </div>
                            <div class="anime__details__rating">
                                <div class="rating">
                                	<i class="fa fa-star"></i>&ensp;<a style="color: white; font-size: 21px;">${movieDTO.ratings}</a>
                                </div>
                            </div>
                            <p>${movieDTO.plot }</p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li style="text-transform: capitalize;"><span>Genre:</span> ${movieDTO.genre }</li>
                                            <li><span>Duration:</span> ${movieDTO.runningTime }</li>
                                            <li><span>Date:</span> <fmt:formatDate value="${movieDTO.releaseDt }" pattern="MM.dd" /></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <input type="hidden" id="memberId" value="${sessionScope.memberId}">
                        		<input type="hidden" id="movieCd" value="${movieDTO.movieCd }">
                                <a href="javascript:wishMovie()" class="follow-btn" ><i class="fa fa-heart-o" id="follow"></i> Follow</a>
                                <a href="javascript:ticketOrder()" class="watch-btn"><span>Ticketing</span> <i class="fa fa-angle-right"></i></a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="anime__details__review">
                            <div class="section-title">
                                <h5>Reviews</h5>
                            </div>
                          	<c:choose>
	                    		<c:when test="${empty boardList}">
		                            <div class="anime__review__item">
		                                <div class="anime__review__item__text">
		                                    <h6>작성된 리뷰가 없습니다.<span></span></h6>
		                                </div>
		                            </div>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:forEach var="boardDTO" items="${boardList }">
			                            	<div class="anime__review__item">
												<div class="rating">
		                                			<i class="fa fa-star" style="color: orange;"></i>&ensp;<a style="color: white; font-size: 21px;">${boardDTO.ratings}</a>
													<!-- delete button -->
													<a style="color: white;" href="/movie/deleteBoard?boardCd=${boardDTO.boardCd }&memberId=${boardDTO.memberId }&movieCd=${boardDTO.movieCd }&genre=${movieDTO.genre}">&ensp;delete</a>
													<!-- delete button -->
		                                		</div>
				                                <div class="anime__review__item__text">
				                                    <h6>${boardDTO.memberId } &emsp; <span style="float: right"><fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy.MM.dd" /></span></h6>
				                                    <p>${boardDTO.comment }</p>
				                                </div>
				                            </div>
		                            </c:forEach>
	                    		</c:otherwise>
	                    	</c:choose>
                            <!--  -->
                        </div>
                        <div class="anime__details__form">
                            <div class="section-title">
                                <h5>Your Comment</h5>
                            </div>
                            <form action="/movie/addBoard" method="post">
                            	<textarea placeholder="Your Comment" name="comment"></textarea>
                            	&ensp;<i class="fa fa-star" style="color: orange; size: 20px;"></i>
                                <select name="ratings">
						        	<c:forEach var="i" begin="0" end="4" >
						        		<option>${5 - i}</option>
						        	</c:forEach>
						        </select>
						        <input type="hidden" name="movieCd" value="${movieDTO.movieCd }">
						        <input type="hidden" name="genre" value="${movieDTO.genre }">
                                &emsp;<button type="submit"><i class="fa fa-location-arrow"></i> Review</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <div class="anime__details__sidebar">
                            <div class="section-title">
                                <h5>you might like...</h5>
                                <h4>${session.memberId }</h4>
                            </div>
                            <!-- start sidbar -->
                            <c:forEach var="relatedMovieDTO" items="#{movieList }" begin="0" end="3" >
                                <c:choose>
                            		<c:when test="${movieDTO.movieCd ne relatedMovieDTO.movieCd }">
			                            <div class="product__sidebar__comment__item">
								            <div class="product__sidebar__comment__item__pic">
								            	<a href="${contextpath }/movie/detail?movieCd=${relatedMovieDTO.movieCd}&genre=${relatedMovieDTO.genre}">
								                <img src="${contextPath }/thumbnails?imgNm=${relatedMovieDTO.imgNm}" style="height: 160px; width: 110px;">
								            	</a>
								            </div>
								            <div class="product__sidebar__comment__item__text">
								                <ul>
								                    <li>${relatedMovieDTO.genre}</li>
								                </ul>
								                <h5><a href="${contextpath }/movie/detail?movieCd=${relatedMovieDTO.movieCd}&genre=${relatedMovieDTO.genre}">${relatedMovieDTO.movieNm}</a></h5>
								                <span><fmt:formatDate value="${relatedMovieDTO.releaseDt}" pattern="MM.dd" /> 개봉</span>
								                <span><i class="fa fa-star" ></i> ${relatedMovieDTO.ratings}</span>
								            </div>
								        </div>
                            		</c:when>
                            	</c:choose>
                            </c:forEach>
					        <!-- end sidbar -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Anime Section End -->
        <script>
        	
	    	if ("${sessionScope.memberId == null}" == "true") {
	    		$("#follow").attr("class", "fa fa-heart-o");
	    	}else {
				var hasWish = "${wishDTO}"; 
				
				hasWish = hasWish.substring(1, hasWish.length-1);
				hasWish = hasWish.split(', ');
				
				for (var i = 0; i < hasWish.length; i++) {
					if($("#memberId").val() == hasWish[i]){
						$("#follow").attr("class", "fa fa-heart");
					}
				}
	    	}
        
        </script>
</body>
</html>