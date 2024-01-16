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
</script>
</head>
<body>
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">  
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextpath }/"><i class="fa fa-home"></i>Movie</a>
                        <a href="${contextpath }/movie/category?genre=all">Categories</a>
                        <span style="text-transform: capitalize;">
                        	<c:set var="name" value="${movieDTO.genre }"/>
	                        <c:choose>
	                        	<c:when test="${name ne 'all'}">${name }</c:when>
	                        	<c:otherwise>
	                        		<c:set var="name" value="all"/>
	                        		${name }
	                        	</c:otherwise>
	                        </c:choose>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4 style="text-transform: uppercase;">
                                       		<c:set var="name" value="${movieDTO.genre }"/>
                        					<c:choose>
                        						<c:when test="${name ne 'all'}">${name }</c:when>
                        						<c:otherwise>
					                        		<c:set var="name" value="all"/>
					                        		${name }
	                        					</c:otherwise>
                       						 </c:choose>
                     					</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
	                        <c:choose>
	                    		<c:when test="${empty movieList}">
		                            <div class="product__item">
		                    			<h4>상영중인 영화가 없습니다.</h4>
		                            </div>
	                    		</c:when>
	                    		<c:otherwise>
			                    	<c:forEach var="movieDTO" items="${movieList }">
				                        <div class="col-lg-4 col-md-6 col-sm-6">
				                            <div class="product__item">
				                            	<div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}" onclick="location. href='${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre }'">
			                                        <div class="comment" ><i class="fa fa-star"></i> ${movieDTO.ratings }</div>
			                                    </div>
				                                <div class="product__item__text">
				                                    <ul>
			                                            <li style="text-transform: capitalize;">${movieDTO.genre}</li>
			                                            <li><fmt:formatDate value="${movieDTO.releaseDt}" pattern="MM.dd" /> 개봉</li>
			                                        </ul>
			                                        <h5><a href="${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre }">${movieDTO.movieNm}</a></h5>
			                                    </div>
				                            </div>
				                        </div>
			                    	</c:forEach>
	                    		</c:otherwise>
	                    	</c:choose>
                    	</div>
                    	<div>
                    	</div>
                    </div>
                    <c:if test="${name eq 'all' }">
	                    <div class="product__pagination">
							<a href="${contextPath }/movie/category?genre=all&currentPageNumber=${currentPageNumber - 1}&onePageViewCnt=${onePageViewCnt  }" ><i class="fa fa-angle-left"></i> </a>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${currentPageNumber eq i }">
										<a href="${contextPath }/movie/category?genre=all&currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }" class="current-page">${i }</a>
									</c:when>
									<c:otherwise>
										<a href="${contextPath }/movie/category?genre=all&currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }">${i }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="${contextPath }/movie/category?genre=all&currentPageNumber=${currentPageNumber + 1}&onePageViewCnt=${onePageViewCnt  }"><i class="fa fa-angle-right"></i></a>
	                    </div>
                    </c:if>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>Top Views</h5>
                            </div>
                            <ul class="filter__controls">
                                <li class="active" data-filter="*"><i class="fa fa-star"></i></li>
                                <li data-filter=".four">4</li>
                                <li data-filter=".three">3</li>
                                <li data-filter=".two">2</li>
                            </ul>
                            <div class="filter__gallery">
                            <c:choose>
	                    		<c:when test="${empty movieList}">
		                            <div class="product__item">
		                    			<h4>상영중인 영화가 없습니다.</h4>
		                            </div>
	                    		</c:when>
	                    		<c:otherwise>
			                    	<c:forEach var="movieDTO" items="${movieList }" begin="0" end="5">
			                    		<fmt:parseNumber var="rating" value="${movieDTO.ratings }" integerOnly="true" />
			                    		<c:choose>
			                    			<c:when test="${rating eq 4}">
			                    				<c:set var="change" value="four"/>
			                    			</c:when>
			                    			<c:when test="${rating eq 3}">
			                    				<c:set var="change" value="three"/>
			                    			</c:when>
			                    			<c:when test="${rating eq 2}">
			                    				<c:set var="change" value="two"/>
			                    			</c:when>
			                    		</c:choose>
				                    	<div class="product__sidebar__view__item set-bg mix ${change }"
	                                		data-setbg="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}">
	                                    	<div class="view"><i class="fa fa-star"></i> ${movieDTO.ratings }</div>
	                                		<h5><a href="${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre}">${movieDTO.movieNm }</a></h5>
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
	</section>
	<!-- Product Section End -->
</body>
</html>