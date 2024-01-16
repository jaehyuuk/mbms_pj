<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$().ready(function() {
		
		if ("${sessionScope.adminId}" != 'master') {
			
			if ("${sessionScope.role}" == 'admin') {
				alert("접근할 수 없는 페이지입니다.");	
				location.href="${contextPath}/admin/main";
			}
			else {
				alert("접근할 수 없는 페이지입니다.");	
				location.href="${contextPath}/";
			}
		}
		
	});
	
</script>
<script>

	$().ready(function() {
		

		$('input[type=checkbox]').each(function(){
			
			if ($(this).val() == 'Y') {
				$(this).prop("checked", true);
			}
			else {
				$(this).prop("checked", false);
			}
			
		});
		
		
	    $('input[type=checkbox]').change(function() {
	    	
	    	if ($(this).is(':checked')) {
	    		
	    		$.ajax({
	    			url : "${contextPath}/admin/manager",
	    			type : "post",
	    			data : {
	    				"adminId" : $(this).attr("name"),
	    				"manage"  : $(this).attr("id"),
	    				"able"	  : "Y"
	    			}
	    		});

	    	}
	    	else {
	    		
	    		$.ajax({
	    			url : "${contextPath}/admin/manager",
	    			type : "post",
	    			data : {
	    				"adminId" : $(this).attr("name"),
	    				"manage"  : $(this).attr("id"),
	    				"able"	  : "N"
	    			}
	    		});
	    	}
	    	
		});
	    
	});	
</script>
</head>
<body>
	<!-- Table Start -->
	<div class="container-fluid pt-4 px-4">
		<div class="row g-4">
			<div class="col-12">
				<div class="bg-secondary rounded h-100 p-4">
					<h2 class="mb-4">Manager</h2>
					<div class="table-responsive">
						<table class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr>
									<th rowspan="2" align="center">Admin</th>
									<th colspan="2">Movie</th>
									<th colspan="2">Member</th>
									<th colspan="2">Comment</th>
									<th>Order</th>
								</tr>
								<tr>
                                   <th scope="col">Select</th>
                                   <th scope="col">Management</th>
                                   <th scope="col">Select</th>
                                   <th scope="col">Management</th>
                                   <th scope="col">Select</th>
                                   <th scope="col">Management</th>
                                   <th scope="col">Select</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="adminDTO" items="${adminList }">
					             <tr>
					              	<td>${adminDTO.adminId }</td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="selectMovie" value="${adminDTO.selectMovie }"  name="${adminDTO.adminId }" ></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="managementMovie" value="${adminDTO.managementMovie }" name="${adminDTO.adminId }"></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="selectMember" value="${adminDTO.selectMember }" name="${adminDTO.adminId }"></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="managementMember" value="${adminDTO.managementMember }" name="${adminDTO.adminId }"></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="selectComment" value="${adminDTO.selectComment }" name="${adminDTO.adminId }"></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="managementComment" value="${adminDTO.managementComment }" name="${adminDTO.adminId }"></div></td>
					              	<td><div class="form-check form-switch"><input class="form-check-input" type="checkbox" role="switch" id="selectOrder" value="${adminDTO.selectOrder }" name="${adminDTO.adminId }"></div></td>
					             </tr>
								</c:forEach>
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