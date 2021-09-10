reply.js/**
 * 
 */
var replyService = (function(){
	
	function insert(contextPath, data, callback, callback2){
		$.ajax({
			type : 'post',
			url : contextPath + '/reply/insert',
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if(callback){
					callback(res,'등록');
					show(contextPath, {rp_bd_num : data.rp_bd_num}, callback2);
				} 
			}
		})
	}

	function show(contextPath, data, callback){
		$.ajax({
			type : 'get',
			url  : contextPath + '/reply/show/' + '/'+ data.rp_bd_num,
			dataType : "json",
			success  : function(res){
				if(callback)
					callback(res);
			}
		})
	}
	function modify(contextPath, data, callback, callback2){
				$.ajax({
			type: 'post',
			url : contextPath + '/reply/modify',
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if(callback){
					callback(res,'수정');
					show(contextPath, {rp_bd_num : data.rp_bd_num}, callback2);
				} 
			}
		})
	}
	function deleteReply(contextPath, data, callback, callback2){
		$.ajax({
			type : 'post',
			url : contextPath + '/reply/delete',
			data : data,
			success : function(res){
				if(callback){
					callback(res,'삭제');
					show(contextPath, {rp_bd_num : data.rp_bd_num}, callback2);
				}
			}
		})
	}
	return { 
		name : '서비스',
		insert : insert,
		show : show,
		modify : modify,
		deleteReply : deleteReply
	}
})();