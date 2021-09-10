<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 a{
 	color : black
 }
.main-box{
	position: absolute; top : 2.5%; left : 16%; width : 80%;
}
.right-board-box{
	position: relative;
}
.search-box{
	position : absolute; top 50px; right :0;
}
 a:hover{
	text-decoration : none;	
}
.page-link{
	color : black;
}
.pagination .page-item.active a {
      background-color: darkslategray;
      border : darkslategray;
}
.board-box h3{
	margin-bottom : 1rem;
}
</style>
</head>
<body>
<div class="container main-box"> 
	<div class="right-board-box">	
 		<form class="form-inline search-box" action="<%=request.getContextPath()%>/admin/user/list">
		 	 <select class="form-control mr-2 col-4" name="type">
		 	    <option value="0" <c:if test="${pm.criteria.type == 0}">selected</c:if>>전체</option>
			  	<option value="1" <c:if test="${pm.criteria.type == 1}">selected</c:if>>아이디</option>
			  	<option value="2" <c:if test="${pm.criteria.type == 2}">selected</c:if>>이름</option>
			  	<option value="3" <c:if test="${pm.criteria.type == 3}">selected</c:if>>생년월일</option>
		  	</select>
			<input class="form-control mr-sm-2 col-6" type="text" name="search" value="<c:out value="${pm.criteria.search}"/>">
			<button class="btn btn-outline-white" type="submit"><i class="fas fa-search"></i></button>
		</form> 
		<div class="container board-box">   
		<h3>회원 관리</h3> 
	  <c:if test="${list.size() != 0 }">
		 <table class="table table-striped">   
		   <thead>
		     <tr>
		     <th>이름</th>
			     <th>아이디</th>
				 <th>생년월일</th>
			     <th>등급</th>
			     <c:if test="${user.me_authority ==  'ADMIN'}">  
				     <th>설정</th>
				 </c:if>    
		     </tr>
		   </thead>
		   <tbody>
		   <c:forEach items="${list}" var="member">
		  
			 <c:if test="${member.me_authority == 'USER' && user.me_authority == 'SUB ADMIN'}">
			     <tr>
			       <td>${member.me_name}</td>	
				   <td>
						<a href="<%=request.getContextPath()%>/admin/user/detail?me_id=${member.me_id}">
							${member.me_id}
						</a>
				   </td>	 
			       <td>${member.me_birth}</td>
			       <td>${member.authorityStr}</td>   
			       <c:if test="${user.me_authority == 'ADMIN'}">  
		       			<td>
		       			<c:if test="${user.me_authority != member.me_authority}">
		       				<input type="hidden" name="me_id" value="${member.me_id}">
				     		<select class="form-control grade">
								<option value="USER" <c:if test="${member.me_authority == 'USER'}">selected</c:if>>회원</option>
					     		<c:if test="${user.me_authority == 'ADMIN'}">
					     			<option value="SUB ADMIN" <c:if test="${member.me_authority == 'SUB ADMIN'}">selected</c:if>>보조관리자</option>
					     		</c:if>
					     	</select>
					     </c:if>	
					     <c:if test="${user.me_authority == member.me_authority}">
					     	<span class="form-control">관리자</span>
					     </c:if>
				        </td>
		     		</c:if> 
			     </tr>
		      </c:if>
		      <c:if test ="${user.me_authority == 'ADMIN'}">
		        <tr>
			       <td>${member.me_name}</td>	
				   <td>
						<a href="<%=request.getContextPath()%>/admin/user/detail?me_id=${member.me_id}">
							${member.me_id}
						</a>
				   </td>	 
			       <td>${member.me_birth}</td>
			       <td>${member.authorityStr}</td>   
			       <c:if test="${user.me_authority == 'ADMIN'}">  
		       			<td>
		       			<c:if test="${user.me_authority != member.me_authority}">
		       				<input type="hidden" name="me_id" value="${member.me_id}">
				     		<select class="form-control grade">
								<option value="USER" <c:if test="${member.me_authority == 'USER'}">selected</c:if>>회원</option>
					     		<c:if test="${user.me_authority == 'ADMIN'}">
					     			<option value="SUB ADMIN" <c:if test="${member.me_authority == 'SUB ADMIN'}">selected</c:if>>보조관리자</option>
					     		</c:if>
					     	</select>
					     </c:if>	
					     <c:if test="${user.me_authority == member.me_authority}">
					     	<span class="form-control">관리자</span>
					     </c:if>
				        </td>
		     		</c:if> 
			     </tr>
			   </c:if>
			</c:forEach>
		   </tbody>
		 </table>
		 <ul class="pagination justify-content-center">
		 	<c:if test="${pm.prev}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${pm.startPage-1}&type=${pm.criteria.type}&search=${pm.criteria.search}">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
		   		<li class="page-item <c:if test="${pm.criteria.page == index}">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${index}&type=${pm.criteria.type}&search=${pm.criteria.search}">${index}</a></li>	    
		   </c:forEach>
		    <c:if test="${pm.next}">
		   		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${pm.endPage+1}&type=${pm.criteria.type}&search=${pm.criteria.search}">다음</a></li>
		    </c:if>
		  </ul>
  		 </c:if>
	  	 <c:if test="${list.size() == 0 }">
			 <table class="table table-striped">   
			   <thead>
			     <tr>
			     <th>이름</th>
				     <th>아이디</th>
					 <th>생년월일</th>
				     <th>등급</th> 
					 <th>설정</th>  
			     </tr>
			   </thead>
			   </table>
		 </c:if>
		</div>
	</div>	
</div>
<script>
$(function(){
	$('.grade').change(function(){
		var grade = $(this).val()
		var me_id = $(this).siblings('[name=me_id]').val()
		confirm_val = confirm("등급 변경하시겠습니까?")
		if(confirm_val){
			$.ajax({
				type : 'post',
				url : '<%=request.getContextPath()%>/admin/user/grade',
				data: JSON.stringify({me_authority : grade, me_id : me_id}),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == 'OK'){
						alert('등급이 변경되었습니다.')
					} else {
						alert('등급변경에 실패했습니다.')
					}
				}
			})
		}
	})
})
</script>
</body>
</html>