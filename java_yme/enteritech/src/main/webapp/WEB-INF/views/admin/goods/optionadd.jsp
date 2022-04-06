<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.contents-box{
	position : absolute; top 0; left :10%;
}
.info-box{
	width: 800px; height : 200px;
}
.size-box{
	border : none;
	width : 70px;
	line-height : 40px;
	text-align : center;
}
.size-box:hover{
	border : none;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<div class="contents-box">
 		<h3>상품상세</h3><hr>
	    <div class="input-group mb-3">
	      	<div class="input-group-prepend">
	      	  <span class="input-group-text">상품타입</span>
     		<div class="form-control fu_type mr-2">${futsal.fu_type}</div>
	   	   </div>
	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">브랜드</span>
	     		<div class="form-control mr-2">${futsal.fu_brand}</div>	
	      </div>
	    </div>  
   	    <div class="input-group mb-3">   
	   	   <div class="input-group-prepend">
	   	  	 <span class="input-group-text">상품이름</span>
				<div class="form-control mr-2">${futsal.fu_name}</div>		
	      </div>
	      <div class="input-group-prepend">
	      	 <span class="input-group-text">가격</span>
	      	 <div class="form-control mr-2">${futsal.fu_price}</div>	
	      </div>
 	  </div>     
 	   <form class="option-box" method= "post" action="<%=request.getContextPath()%>/admin/goods/optionadd">
	 	   <c:if test="${list.size() == 0}">
		 	   <div class="input-group mb-3">
		 	      <div>
		 	      	<div class="mb-2" style="color : red;">※ 옵션 등록시 공란 없이 작성하세요. [예) 수량이 없는 경우 0으로 기재]</div>
			   	  	 <div class="mb-2">사이즈</div>
			   	  	 <c:if test="${futsal.fu_type == '풋살화'}">
					  <table class="table table-bordered">
					    <thead>
					      <tr>
					        <th style="text-align : center;">사이즈</th>
					        <th style="text-align : center;">수량</th>
					        <th style="text-align : center;">사이즈</th>
					        <th style="text-align : center;">수량</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="220" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="225" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="230" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="235" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="240" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="245" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="250" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="255" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="260" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="265" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="270" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td><input class="size-box" type="text" name="op_size" value="275" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					      </tr>
					      <tr>
					        <td><input class="size-box" type="text" name="op_size" value="280" readonly></td>
					        <td><input class="form-control" type="text" name="op_count"></td>
					        <td></td>
					        <td></td>
					      </tr>
					    </tbody>
					  </table>
					  </c:if>
			  	      <c:if test="${futsal.fu_type == '의류'}">
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th style="text-align : center;">사이즈</th>
						        <th style="text-align : center;">수량</th>
						        <th style="text-align : center;">사이즈</th>
						        <th style="text-align : center;">수량</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="80" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						        <td><input class="size-box" type="text" name="op_size" value="85" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						      </tr>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="90" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						        <td><input class="size-box" type="text" name="op_size" value="95" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						      </tr>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="100" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						        <td><input class="size-box" type="text" name="op_size" value="105" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						      </tr>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="110" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
								<td></td>
								<td></td>
						      </tr>
						    </tbody>
					   	</table>
			     	  </c:if>
			     	  <c:if test="${futsal.fu_type == '풋살공' || futsal.fu_type == '스포츠가방' || futsal.fu_type == '골키퍼장갑'}">
						<table class="table table-bordered">
						    <thead>
						      <tr>
						        <th style="text-align : center;">사이즈</th>
						        <th style="text-align : center;">수량</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="1" readonly></td>
						        <td><input class="form-control" type="text" name="op_count"></td>
						      </tr>
						    </tbody>
					   	</table>
			     	  </c:if>
			      </div>
			    </div>
      		    <!-- input hidden -->
			    <c:if test="${futsal.fu_type == '풋살화'}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				</c:if> 
			    <c:if test="${futsal.fu_type == '의류'}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				</c:if>	
				<c:if test="${futsal.fu_type == '풋살공' || futsal.fu_type == '스포츠가방' || futsal.fu_type == '골키퍼장갑'}">
				    <input type="hidden" name="fu_num" value="${futsal.fu_num}">
				</c:if>		
			    <button type="submit" class="btn btn-outline-dark">등록</button>
				<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
		    </c:if>
		    <c:if test="${list.size() != 0}">
			    <c:forEach items="${list}" var="option">
					<table class="table table-bordered">
					    <thead>
					      <tr>
					        <th style="text-align : center;">사이즈</th>
					        <th style="text-align : center;">수량</th>
					      </tr>
					    </thead>
					    	<tbody>
						      <tr>
						        <td><input class="size-box" type="text" name="op_size" value="${option.size}" readonly></td>
						        <td><input class="form-control" type="text" name="op_count" value="${option.op_count}" readonly></td>
						      </tr>
						    </tbody>
				   	</table>	
				<a href="<%=request.getContextPath()%>/admin/goods/list"><button type="button" class="btn btn-outline-dark">목록</button></a>
			   	</c:forEach>
		    </c:if>
		</form>  
		</div> 	 
	</div>	
</div>
</body>
</html>