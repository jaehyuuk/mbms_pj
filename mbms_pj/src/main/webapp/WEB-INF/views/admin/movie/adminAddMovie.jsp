<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$().ready(function() {
		
		if ("${sessionScope.managementMovie }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		}

	});
	
</script>
</head>
<body>
<!-- Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h2 class="mb-4">Add Movie</h2>
                             <form action="${contextPath }/admin/movie/adminAddMovie" method="post" enctype="multipart/form-data">
	                            <div class="mb-3">
	                                <label for="formFile" class="form-label">Movie Image</label>
	                                <input type="file" class="form-control bg-dark" name="imgNm">
	                            </div>
                                <div class="mb-3">
                                    <label for="formMovieNm" class="form-label">Movie Name</label>
                                    <input type="text" class="form-control" name="movieNm">
                                </div>
                                <div class="mb-3">
                                    <label for="formDirector" class="form-label">Director</label>
                                    <input type="text" class="form-control" name="director">
                                </div>
                                <div class="mb-3">
                                    <label for="formRunningTime" class="form-label">Running Time</label>
                                    <input type="text" class="form-control" name="runningTime">
                                </div>
                                <label for="formPrice" class="form-label">Price</label>
                                <div class="input-group mb-3">
	                                <input type="text" class="form-control" name="originalPrice">
	                                <span class="input-group-text">원</span>
                            	</div>
	                            <select class="form-select mb-3" aria-label="Default select example" name="genre">
	                                <option selected>Genre</option>
									<option value="action">ACTION</option>                                
									<option value="animation">ANIMATION</option>                                
									<option value="drama">DRAMA</option>                                
									<option value="fantasy">FANTASY</option>                                
									<option value="romance">ROMANCE</option>                                
									<option value="thriller">THRILLER</option>  
	                            </select>
                            	<div class="form-floating">
	                                <textarea class="form-control" placeholder="Leave a plot here" name="plot" style="height: 150px;"></textarea>
	                                <label for="floatingTextarea">Plot</label>
                            	</div><br>
                            	<label for="formRatings" class="form-label">Ratings</label>
                            	<div class="input-group mb-3">
	                                <input type="text" class="form-control" name="ratings">
                                	<span class="input-group-text"><i class="fa fa-star"></i></span>
                            	</div>
                            	<div class="mb-3">
                                    <label for="formReleaseDt" class="form-label">Release Date</label>
                                    <input type="date" class="form-control" name="releaseDt">
                                </div>
                                <button type="submit" class="btn btn-primary">Add Movie</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<!-- Form End -->
</body>
</html>
 