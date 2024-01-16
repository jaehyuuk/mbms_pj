<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>500</title>
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
<body>

        <!-- 500 Start -->
            <div class="container-fluid" style="padding: 0 0 0 0;">
                <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
                    <div class="col-md-6 text-center p-4">
                        <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                        <h1 class="display-1 fw-bold">500</h1>
                        <h1 class="mb-4">Under Maintenance!</h1>
                        <p class="mb-4">Sorry for the inconvenience but we're performing some maintenance at the moment</p>
                        <a class="btn btn-primary rounded-pill py-3 px-5" href="${contextPath }/">Go Back To Home</a>
                    </div>
                </div>
            </div>
        <!-- 500 End -->
        
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