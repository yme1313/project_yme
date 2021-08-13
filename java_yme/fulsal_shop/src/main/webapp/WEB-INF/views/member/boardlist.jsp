<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

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
.pw-box{
	position : absolute; left : 0; top : 0; bottom :0; right: 0; z-index:10;
	display : none;
}
.pw-box .pw-input-box{
	width : 250px; height : 130px; border: 1px solid darkslategray; background : white;
	top : 30%; left : 40vw; z-index :3;  border-radius : 10px; text-align : center;
	position : absolute; 
}
.pw-bg-box{
	position : absolute; width : 100vw; height : 130vh;
	top : -25%; 
	background : black; opacity : 0.3;
}
</style>
</head>
<body>
	<br>
	<div class="container main-box">
		<div class="right-board-box">	
					<div class="container board-box">       
							<table class="table table-horver">
								<h3>1:1문의 내역</h3>
								<thead>
									<tr>
										<th>번호</th>
										<th>답변여부</th>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
							<tbody>
								<c:forEach items="${list}" var="board" varStatus="status">
									<c:if test="${user.me_id == board.bd_me_id}">
										<tr>
											<td>${pm.totalCount - status.index - pm.criteria.pageStart}</td>
											<td>${board.answerStr}</td>
											<c:if test="${user.me_authority != 'ADMIN' || user.me_authority != 'SUPER ADMIN'}">
												<td class="enter-pw" data="${board.bd_num}">
													<a href="<%=request.getContextPath()%>/board/detail?num=${board.bd_num}">
														${board.bd_title}
													</a>
												</td>
											</c:if>
											<td>${board.dateTime}</td>
										</tr>	
									</c:if>	
								</c:forEach>
							</tbody>
						</table>
					  <ul class="pagination justify-content-center">
						  <c:if test="${pm.prev}">
						    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${pm.startPage-1}">이전</a></li>
						  </c:if> 
						  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						  	<c:choose>
							  	<c:when test="${pm.criteria.page == index}">
							    	<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>//member/boardlist?page=${index}">${index}</a></li>
				    			</c:when>
				    			 <c:otherwise>
				    				<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${index}">${index}</a></li>
				    			</c:otherwise>
			    			</c:choose>
						  </c:forEach> 
						  <c:if test="${pm.next}">
						    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/member/boardlist?page=${pm.endPage+1}">다음</a></li>
						  </c:if>  
					  </ul>
				</div>
		</div>
		<form id="pwBox" class="pw-box" method="post" action="<%=request.getContextPath()%>/board/detail">
			<div class="pw-input-box form-group pl-2 pr-2">
				<label class="mt-1">비밀번호를 입력하세요</label>
				<input type="password" name="bd_pw" class="form-control mb-2">
				<input type="hidden" name="bd_num">
				<button type="button" class="btn btn-outline-danger col-4 mr-2">확인</button>
				<a href="<%=request.getContextPath()%>/board/list"><span class="btn btn-outline-dark col-4">닫기</span></a>
			</div>
			<div class="pw-bg-box"></div>
		</form>	
	</div>	
<script type="text/javascript">
	$(function(){
		$('.enter-pw a').click(function(e){
			e.preventDefault();
			$('.pw-box').show();		
			var num = $(this).parent().attr('data');
			$('.pw-box [name=bd_num]').val(num);
		})
		$('.pw-box button').click(function(){
			var bd_num = $('.pw-box [name=bd_num]').val();
			var bd_pw = $('.pw-box [name=bd_pw]').val();
			var data = {bd_num : bd_num, bd_pw : bd_pw};
			$.ajax({
				type : 'post',
				url : '<%=request.getContextPath()%>/board/check',
				data : JSON.stringify(data),
				contentType : "application/json; charset:utf-8",
				success : function(res){
					if(res == 'true'){
						$('#pwBox').submit();
					} else {
						alert('비밀번호가 일치하지 않습니다.')
					}
				}
			})
		})
	})
</script>	
</body>
</html>