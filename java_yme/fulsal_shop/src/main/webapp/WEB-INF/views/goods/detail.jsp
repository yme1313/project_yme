<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.main-box{
	display : flex;
}
.img-box img{
	width : 500px; height : 500px; margin-right : 70px;
}
.title{
	font-weight: bold; margin-bottom : 20px;
	font-size : 50px;
}
.first{
	width : 100px;
}
</style>
<style>
</style>
</head>
<body>
<div class="container main-box">
	<div class="img-box">
		<img alt="" src="<%=request.getContextPath()%>/resources/img/${futsal.fu_img}">
	</div>
	<div class="text-box">
		<div class="title">${futsal.fu_name}</div>
		  <table class="table table-borderless">
		    <tbody>
		      <tr>
		        <td class="first">브랜드 :</td>
		        <td>${futsal.fu_brand}</td>
		      </tr>
		      <tr>
		        <td class="first">가격 :</td>
		        <td>${futsal.fu_price}</td>
		      </tr>
		    </tbody>
		  </table>
		  <hr>
		 <div class="option-box">
 		  <table class="table table-borderless">
		    <tbody>
		      <tr>
		        <td class="first">사이즈 :</td>
		        <td>

		        	<select class="form-control col-6 ml-2" name="op_size">
		        		<option value="" selected>옵션 선택</option>
		        		<c:forEach items="${list}" var="option">
							<c:if test="${option.op_size == '220' && option.op_count == 0}">
								<option value="">220(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '220' && option.op_count != 0}">
								<option value="220">220</option>
							</c:if>
							<c:if test="${option.op_size == '225' && option.op_count == 0}">
								<option value="">225(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '225' && option.op_count != 0}">
								<option value="225">225</option>
							</c:if>
							<c:if test="${option.op_size == '230' && option.op_count == 0}">
								<option value="">230(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '230' && option.op_count != 0}">
								<option value="230">230</option>
							</c:if>
							<c:if test="${option.op_size == '235' && option.op_count == 0}">
								<option value="">235(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '235' && option.op_count != 0}">
								<option value="235">235</option>
							</c:if>
							<c:if test="${option.op_size == '240' && option.op_count == 0}">
								<option value="">240(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '240' && option.op_count != 0}">
								<option value="240">240</option>
							</c:if>
							<c:if test="${option.op_size == '245' && option.op_count == 0}">
								<option value="">245(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '245' && option.op_count != 0}">
								<option value="245">245</option>
							</c:if>
							<c:if test="${option.op_size == '250' && option.op_count == 0}">
								<option value="">250(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '250' && option.op_count != 0}">
								<option value="250">250</option>
							</c:if>
							<c:if test="${option.op_size == '255' && option.op_count == 0}">
								<option value="">255(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '255' && option.op_count != 0}">
								<option value="255">255</option>
							</c:if>
							<c:if test="${option.op_size == '260' && option.op_count == 0}">
								<option value="">260(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '260' && option.op_count != 0}">
								<option value="260">260</option>
							</c:if>
							<c:if test="${option.op_size == '265' && option.op_count == 0}">
								<option value="">265(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '265' && option.op_count != 0}">
								<option value="265">265</option>
							</c:if>
							<c:if test="${option.op_size == '270' && option.op_count == 0}">
								<option value="">270(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '270' && option.op_count != 0}">
								<option value="270">270</option>
							</c:if>
							<c:if test="${option.op_size == '275' && option.op_count == 0}">
								<option value="">275(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '275' && option.op_count != 0}">
								<option value="275">750</option>
							</c:if>
							<c:if test="${option.op_size == '280' && option.op_count == 0}">
								<option value="">280(품절)</option>
							</c:if>
							<c:if test="${option.op_size == '280' && option.op_count != 0}">
								<option value="280">280</option>
							</c:if>
						</c:forEach>	
	     			</select>

		        </td>
		      </tr>
		    </tbody>
		  </table>	  	    
		 </div> 
		 <hr>
		 
	</div>
</div>	
</body>
</html>