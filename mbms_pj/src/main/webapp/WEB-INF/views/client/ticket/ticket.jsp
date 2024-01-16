<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ticket</title>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/plyr.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/style.css" type="text/css">
	<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>

	$().ready(function() {
		
		var checkedSeat = [];
		
		var hasTicketMember = "${hasTicketMember}";   
		
		hasTicketMember = hasTicketMember.substring(1, hasTicketMember.length-1);
		hasTicketMember = hasTicketMember.split(', ');
		
		$(".seat").click(function(){
			
		    if($(this).hasClass("seat")) {
		        $(this).addClass("selectedSeat").removeClass("seat");
		        checkedSeat.push($(this).attr("id"));
		    } else {
		        $(this).addClass("seat").removeClass("selectedSeat");
		        checkedSeat.pop($(this).attr("id"));
		    }
			
			var selectedSeatCount = $(".selectedSeat").length;
			
			$("#count").text(selectedSeatCount);
			$("#cost").text(selectedSeatCount * $("#originalPrice").val());
			
		});
		
		$(".main-button").click(function(){
			
			var hasTicket = false;
						
			for (var i = 0; i < hasTicketMember.length; i++) {
				
				if ($("#sessionMemberId").val() == hasTicketMember[i]) {
					hasTicket = true;
				}
				else {
					hasTicket = false;
				}
			};
			
			if (!hasTicket) {
				if ($(".selectedSeat").length != 0) {
					
					var param = {
							"memberId" : $("#sessionMemberId").val(),
				    		"movieCd" : $("#movieCd").val(),
				    		"movieNm" : $("#movieNm").val(),
				    		"genre" : $("#genre").val(),
				    		"originalPrice" : $("#originalPrice").val(),
				    		"seat" : checkedSeat.toString(),
				    		"paymentAmt" : $("#count").text(),
				    		"price" : $("#cost").text()
				    };
				    
					$.ajax({
						url : "${contextPath}/ticket",
						type : "post",
						data : param,
						success : function() {
							alert("예매되었습니다.");	
							window.close();
						}
					});
					
				}
				else {
					alert("좌석을 선택해주세요.");
				}
			}
			else {
				alert("이미 예매하신 내역이 존재합니다.");	
			}
			
		});	
		
	});
	
</script>
</head>
<body>
	<div class="container" style="margin-top: 20px; margin-bottom: 80px;">
	    <div class="row">
	        <div class="col-lg-12 text-center">
	            <div class="normal__breadcrumb__text">
	                <h2>Ticket</h2>
	                <p>Booking a <strong style="color: #e53637;">MOVIE</strong>.</p>
	                <input type="hidden" id="sessionMemberId" value="${sessionScope.memberId}">
	            </div>
	        </div>
	    </div>
	</div>
    <!-- Ticket Section Begin -->
    <div class="ticket">
    	<div id="container">
	        <ul class="showcase">
	            <li>
	                <div class="availableSeat"></div>
	                <small class="small">Available Seat</small>
	            </li>
	            <li>
	                <div class="selectedSeatIcon"></div>
	                <small class="small">Selected Seat</small>
	            </li>
	            <li>
	                <div class="occupiedSeat"></div>
	                <small class="small">Occupied Seat</small>
	            </li>
	        </ul>
        	<div class="seatContainer">
            	<div class="screen"></div>
	            <div class="row">
	                <span class="seat" id="A열 1번"></span>
	                <span class="seat" id="A열 2번"></span>
	                <span class="seat" id="A열 3번"></span>
	                <span class="seat" id="A열 4번"></span>
	                <span class="seat" id="A열 5번"></span>
	                <span class="seat" id="A열 6번"></span>
	                <span class="seat" id="A열 7번"></span>
	                <span class="seat" id="A열 8번"></span>
	            </div>
	            <div class="row">
	                <span class="seat" id="B열 1번"></span>
	                <span class="seat" id="B열 2번"></span>
	                <span class="seat" id="B열 3번"></span>
	                <span class="seat" id="B열 4번"></span>
	                <span class="seat" id="B열 5번"></span>
	                <span class="seat" id="B열 6번"></span>
	                <span class="seat" id="B열 7번"></span>
	                <span class="seat" id="B열 8번"></span>
	            </div>
	            <div class="row">
	                <span class="seat" id="C열 1번"></span>
	                <span class="seat" id="C열 2번"></span>
	                <span class="seat" id="C열 3번"></span>
	                <span class="seat" id="C열 4번"></span>
	                <span class="seat" id="C열 5번"></span>
	                <span class="seat" id="C열 6번"></span>
	                <span class="seat" id="C열 7번"></span>
	                <span class="seat" id="C열 8번"></span>
	            </div>
	            <div class="row">
	                <span class="seat" id="D열 1번"></span>
	                <span class="seat" id="D열 2번"></span>
	                <span class="seat" id="D열 3번"></span>
	                <span class="seat" id="D열 4번"></span>
	                <span class="seat" id="D열 5번"></span>
	                <span class="seat" id="D열 6번"></span>
	                <span class="seat" id="D열 7번"></span>
	                <span class="seat" id="D열 8번"></span>
	            </div>
	            <div class="row">
	                <span class="seat" id="E열 1번"></span>
	                <span class="seat" id="E열 2번"></span>
	                <span class="seat" id="E열 3번"></span>
	                <span class="seat" id="E열 4번"></span>
	                <span class="seat" id="E열 5번"></span>
	                <span class="seat" id="E열 6번"></span>
	                <span class="seat" id="E열 7번"></span>
	                <span class="seat" id="E열 8번"></span>
	            </div>
	        </div>
	        <input type="hidden" id="movieCd" value="${movieDTO.movieCd }">
	        <input type="hidden" id="movieNm" value="${movieDTO.movieNm }">
	        <input type="hidden" id="genre" value="${movieDTO.genre }">
	        <input type="hidden" id="originalPrice" value="${movieDTO.originalPrice }">
        	<p class="text" style="color: white;">You have selected <span id="count">0</span> seats for a price of ₩ <span id="cost">0</span></p>
	        <div class="main-button" align="center" style="margin-bottom: 150px;">
	             <a href="#none">Ticketing</a>
	        </div>
		</div>
    </div>
    <!-- Ticket Section End -->
    <footer class="footer">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-6">
	                <div class="footer__logo">
	                    <a href="${contextpath }/"><img src="${contextPath }/resources/bootstrap/img/logo.png" style="height: 35px; width: 140px;"></a>
	                </div>
	            </div>
	            <div class="col-lg-6">
	                <p align="center">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
	            </div>
	        </div>
	    </div>
	</footer>
	<script>
		var num = "${seatList}";   
		
		num = num.substring(1, num.length-1);
		num = num.split(', ');
		
		for (var i = 0; i < num.length; i++) {
			if (document.getElementById(num[i])){
				document.getElementById(num[i]).setAttribute('class', 'occupiedSeat');
			}
		}
	</script>  	
    <script src="${contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/player.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/mixitup.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/jquery.slicknav.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/main.js"></script>
</body>
</html>