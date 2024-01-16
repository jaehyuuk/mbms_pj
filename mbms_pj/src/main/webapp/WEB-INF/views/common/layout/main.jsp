<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Top3 Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/main/main-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Animation</div>
                                <h2>스파이더맨-어크로스 더 유니버스: <br>스파이더맨 VS 스파이더맨?!</h2>
                                <p>상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!</p>
                                <a href="${contextPath }/movie/detail?movieCd=1&genre=animation"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/main/main-2.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Action</div>
                                <h2>귀공자: <br>“난 단 한번도 타겟을 놓쳐 본 적이 없거든”</h2>
                                <p>단 하나의 타겟, 광기의 추격이 시작된다!</p>
                                <a href="${contextPath }/movie/detail?movieCd=2&genre=action"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/main/main-3.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Animation</div>
                                <h2>엘리멘탈: <br>디즈니·픽사의 놀라운 상상력!</h2>
                                <p>올여름, 세상이 살아 숨 쉰다</p>
                                <a href="${contextPath }/movie/detail?movieCd=3&genre=animation"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Top3 Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Trending Now</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="${contextpath }/movie/category?genre=all" class="primary-btn">View All <span class="arrow_right"></span></a>
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
	                    			<c:set var="ranking" value="1"/>
			                    	<c:forEach var="movieDTO" items="${movieList }" begin="0" end="8">
				                        <div class="col-lg-4 col-md-6 col-sm-6">
				                            <div class="product__item">
				                            	<div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?imgNm=${movieDTO.imgNm}" onclick="location. href='${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre}'">
			                                        <div class="ep">TOP ${ranking }</div>
			                                        <div class="comment"><i class="fa fa-star"></i> ${movieDTO.ratings }</div>
			                                    </div>
				                                <div class="product__item__text">
				                                    <ul>
			                                            <li style="text-transform: capitalize;">${movieDTO.genre}</li>
			                                            <li><fmt:formatDate value="${movieDTO.releaseDt}" pattern="MM.dd" /> 개봉</li>
			                                        </ul>
			                                        <h5><a href="${contextPath }/movie/detail?movieCd=${movieDTO.movieCd}&genre=${movieDTO.genre}">${movieDTO.movieNm}</a></h5>
			                                    </div>
				                            </div>
				                        </div>
				                    <c:set var="ranking" value="${ranking = ranking + 1 }"/>    
			                    	</c:forEach>
	                    		</c:otherwise>
	                    	</c:choose>
                    	</div>
                    </div>
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
	                                		data-setbg="${contextPath }/resources/bootstrap/img/sidebar/${movieDTO.imgNm }">
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