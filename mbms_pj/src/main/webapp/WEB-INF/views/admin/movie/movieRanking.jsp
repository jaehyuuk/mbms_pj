<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>CGV RANKING</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<link href="${contextPath }/resources/adminBootstrap/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${contextPath }/resources/adminBootstrap/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="${contextPath }/resources/adminBootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath }/resources/adminBootstrap/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h2 class="mb-4">CGV Ranking</h2>
                            <div class="table-responsive">
                             	<table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">TOP</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Ratings</th>
                                            <th scope="col">Release</th>
                                        </tr>
                                    </thead>
                                    <tbody>
					            		<c:set var="idx" value="1" />
					            		<c:forEach var="cgvRanking" items="${cgvRankingList }">
							              <tr>
							              	<td>${idx }</td>
							                <td>${cgvRanking.title }</td>
							                <td>${cgvRanking.score }</td>
							                <td>${cgvRanking.info }</td>
							              </tr>
								        <c:set var="idx" value="${idx = idx + 1 }"/>
					            		</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table End -->
            
    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/easing/easing.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath }/resources/adminBootstrap/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath }/resources/adminBootstrap/js/main.js"></script>            
</body>
</html>