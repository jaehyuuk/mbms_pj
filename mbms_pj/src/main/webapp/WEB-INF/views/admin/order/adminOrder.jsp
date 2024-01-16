<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$().ready(function() {
		
		if ("${sessionScope.selectOrder }" != "Y") {
			alert("접근하실 수 없는 페이지입니다.");
			location.href="${contextPath}/admin/main";
		}

	});
	
</script>
<script>
	function gerateOrderExcelExport() {
		location.href = "${contextPath}/admin/order/orderExcelExport";
	}
</script>
</head>
<body>
<!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h2 class="mb-4">Ticket</h2>
                            <a href="javascript:gerateOrderExcelExport();"><span class="icon_folder_download"></span><i class="fa fa-download"></i> Excel</a>
                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
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
						            		<c:set var="totalPrice" value="0" />
						            		<c:set var="idx" value="1" />
						            		<c:forEach var="orderDTO" items="${orderList }">
								              <tr>
								              	<td>${idx }</td>
								                <td>${orderDTO.movieNm }</td>
								                <td>${orderDTO.memberId }</td>
								                <td>${orderDTO.seat }</td>
								                <td>${orderDTO.paymentAmt }</td>
								                <td><fmt:formatNumber value="${orderDTO.price }" pattern=",000"/></td>
								                <td><fmt:formatDate value="${orderDTO.payOrderTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								              </tr>
									        <c:set var="idx" value="${idx = idx + 1 }"/>
									        <c:set var="totalPrice" value="${totalPrice = totalPrice + orderDTO.price }"/>
						            		</c:forEach>
					            			<tr>
					            				<td colspan="7"><strong>총 매출 : <fmt:formatNumber value="${totalPrice }" pattern=",000"/>원</strong></td>
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