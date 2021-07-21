<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
</head>
<body>
<div class="container">
	<h2>게시판</h2>
	<div class="form-group">
		<label>제목</label>
		<input type="text" class="form-control" value="<c:out value="${board.title}"/>" readonly>
	</div>
	<div class="form-group">
		<label>작성자</label>
		<input type="text" class="form-control" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
		<label>작성일</label>
		<input type="text" class="form-control" value="${board.registerdDate}" readonly>
	</div>
	<div class="form-group">
		<label>조회수</label>
		<input type="text" class="form-control" value="${board.views}" readonly>
	</div>
	<div class="form-group">
		<button type="button" class="re-btn up btn btn<c:if test="${rvo.state != 1 }">-outline</c:if>-success">추천</button>
		<button type="button" class="re-btn down btn btn<c:if test="${rvo.state != -1 }">-outline</c:if>-success">비추천</button>
	</div>
	<div class="form-group">
		<label>내용</label>
		<div class="form-control" style="height : auto;">${board.contents}</div>
	</div>
	<c:if test="${fileList.size() != 0 }">
		<div class="form-group">
			<label>첨부파일</label>
				<c:forEach items="${fileList}" var="file">
					<a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" class="form-control mb-1">${file.ori_name}</a>
				</c:forEach>
		</div>
	</c:if>
    <div class="reply form-group">
    	<label>댓글</label>
      	<div class="contents">
      	  <div class="reply-list input group">

      	  </div>
          <div class="reply-box form-group">
	          <textarea class="reply-input form-control mb-1"></textarea>
	         	<div align="right">
	        		<button type="button" class="reply-btn btn btn-outline-success">등록</button>
	        	</div>
     	  </div>
      </div>
    </div>
		<div class="input-group">
			<a href="<%=request.getContextPath()%>/board/list" class="mr-2"><button class="btn btn-outline-success">목록</button></a>
			<c:if test="${board != null && user.id == board.writer }">
				<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" class="mr-2"><button class="btn btn-outline-success">수정</button></a>
					<form action="<%=request.getContextPath()%>/board/delete" method="post" class="mr-2">
						<input type="hidden" value="${board.num }" name="num">
					<button class="btn btn-outline-success">삭제</button>
				</form>
			</c:if>
		</div>
</div>
<script type="text/javascript">
$(function(){
	$('.re-btn').click(function(){
		//추천 버튼이면 state를 1로, 비추천버튼이면 state를 -1로
		var state = $(this).hasClass('up') ? 1 : -1;
		var num = '<c:out value="${board.num}"></c:out>'
		var obj = $(this);
		$.ajax({
			type : 'get',
			url : '<%=request.getContextPath()%>/board/recommend/' + state + '/' + num,
			dataType : "json",
			success : function(res, status, xhr){
				var str = '';
				var str2 = '';
				if(state == 1){
					str2 = '추천';
				} else {
					str2 = '비추천';
				}
				if(res.result == 0){
					str = '이 취소되었습니다.';
				} else if (res.result == 1){
					str = '이 되었습니다.';
				} else {
					str = '추천/비추천은 회원만 가능합니다.'
				}
				if(res.result != -1){
					alert(str2+str);
				} else {
					alert(str);
				}
				if(res.result == 1){
					$('.re-btn').removeClass('btn-success').addClass('btn-outline-success')
					obj.removeClass('btn-outline-success').addClass('btn-success');
				} else if(res.result == 0){
					obj.removeClass('btn-success').addClass('btn-outline-success');
				} 
			},
			error : function(xhr, status, e){
				
			}
		})
		
	})
})
$(function(){
	$('.reply-btn').click(function(){
		var rp_bd_num = '${board.num}';
		var rp_me_id = '${user.id}';
		var rp_content = $('.reply-input').val();
		if(rp_me_id ==''){
			alert('댓글을 달려면 로그인하세요.');
			return;
		}
		var data = {'rp_bd_num' : rp_bd_num, 
					'rp_me_id' : rp_me_id,
					'rp_content' : rp_content}
		$.ajax({
			type : 'post',
			url : '<%=request.getContextPath()%>/reply/ins',
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(result == 'ok'){
					alert('댓글 등록이 완료되었습니다.');
					readReply();
				}
			},
			error : function(xhr, status, error){
				
			}
		})
	})
})
function readReply(){
	$.ajax({
		type : 'get',
		url : '<%=request.getContextPath()%>/reply/list/' + '${board.num}',
		dataType : "json",
		success : function(result, status, xhr){
			var list = result['list'];
			var str = '';
			for(i = 0 ; i < list.length ; i++){
				 str += 
			      	'<div class="form-group">' +
		      	  		'<label>' + list[i].rp_me_id + '</label>' +
		      	  		'<div class="form-control">' + list[i].rp_content + '</div>' +
		      	    '</div>';
			}
			$('.reply-list').html(str);

		},
		error : function(xhr, status, error){
			
		}
	})
}
</script>
</body>
</html>