<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		var bno = $('#bno').val();
		var replyform=$(".replyform")
		
		console.log('bno:', bno);
		$.ajax({
			url: '/board/updateReadcnt',
			type: 'POST',
			data: { bno: bno },
			success: function(response) {
				console.log('조회수가 증가되었습니다.');
			},
			error: function(xhr, status, error) {
				console.error('조회수 증가 중 오류 발생:', error);
			}
		});

		$("button").click(function(e){
	        e.preventDefault();
	        var oper = $(this).data("oper");
	        console.log(oper); // 무슨 버튼 눌렸나
	        if (oper === "modify") {
	            window.location.href = '/board/modify?bno='+ bno;
	        } else if (oper === "list") {
	            window.location.href = '/board/list';
            } else if (oper === "remove") {
                $.ajax({
                    url: '/board/remove',
                    type: 'POST',
                    data: { bno: bno },
                    success: function(response) {
                    	alert("게시글이 삭제되었습니다.");
                        window.location.href = '/board/list';
                    },
                    error: function(xhr, status, error) {
                        console.error('삭제 중 오류 발생:', error);
                    }
                });
            }
        });
		$("#replys").click(function(e){
			var  bnoValue =$("#bno").val()
			var  reply =$("input[name='reply']").val()
			var  replyer =$("#replyer").val()
			console.log(bnoValue,reply,replyer)
			 // 사용자가 로그인되어 있는지 확인
        if (replyer === "id") {
            // 로그인되지 않은 경우 알림 표시
            alert("댓글을 작성하려면 먼저 로그인하세요.");
            return;
        }
			var reply = {
					reply,
					replyer,
					bno:bnoValue
			}
			console.log("댓글 등록: ", reply)
			e.preventDefault()
			var str=""
			$.ajax({
					type: 'post',
					url: '/board/replyadd',
					data: JSON.stringify(reply),
					contentType: "application/json; charset=UTF-8",
					success: function(list, status, xhr) {
						var u = $(list).find("item")
						console.log("성공",u)
						for(var i=0; i<list.length; i++){
							str+= "<li class='left clearfix' data-rno='" + list[i].rno +"'>"
							str+= "  <div><div class='header'><strong class='primary-font'>" + list[i].replyer +"</strong>"
							str+= "   <p>" + list[i].reply +"</p></div></li>"
						}
						$("ul").html(str)
						
					}
				})
			
			})
			
		$("#replychat").on("click","li", function(e){
			console.log($(this))
			var rno= $(this).data("rno")
			console.log(rno)
			replyService.get(rno, (reply)=>{ // 데이터 하나 조회하여 modal의 input 태그 에 출력함
				replyInputReply.val(reply.reply)
				replyInputReplyer.val(reply.replyer)
				replyform.data("rno", reply.rno)

			})
		})
        // 세션에서 메시지를 가져와 알림 창 표시
        var message = "${message}";
        if (message) {
            alert(message);
            console.log(message)
        }
    });
</script>
</head>
<body>
	<div class="field">
		<div class="board-header">
			<h1 class="h3 mb-2 text-gray-800" style="text-align:center">게시글 조회</h1>
		</div>
		<div class="card shadow mb-4" style="text-align:center">
			<div class="card-body">
				<form id="boardForm" action="board" role="form" method="get">
					<input type="hidden" id="bno" class="form-control" name='bno' value='${board.bno}' readonly/>	
					<div class="form-group"> 
						<label>제목</label>
						<input class="form-control" name='title' value='${board.title}' readonly/>
					</div>
					<div class="form-group">
						<label>작성일 : </label> <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
					</div>
					<div class="form-group">
						<label>조회수 : </label> ${board.views}
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content' readonly>${board.content}</textarea>
					</div>
					<div class="form-group">
						<label>작성자 : </label> ${board.writer}
					</div>
					<button type="button" data-oper="list" class="btn btn-info">목록</button>
					<button type="button" data-oper="modify" class="btn btn-primary">수정</button>
					<button type="button" data-oper="remove" class="btn btn-danger">삭제</button>
				</form>
			</div>
		</div>
		
			<div class="row">
			<div class="col-lg-12">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw">댓글</i>
				</div>
				<form action="replyadd" method="post" id="replyform">
					<div class="form-group">
						<input class="form-control" type="hidden" name="bno" value="${board.bno}">
						<input class="form-control" type="hidden" name="rno" value="${replyadd.rno}">
						<input class="form-control" type="text" id="a" name="reply" placeholder="댓글을 작성해 주세요">
						<input class="form-control" type="hidden" id="replyer" name="replyer" value="id">
											
						<button id="replys" class='btn btn-primary btn-xs pull-right'>댓글 등록</button>
					</div>

				</form>
				
				<div class="panel-body">
					<ul class="chat" id="replychat">
           				<li class="left clearfix" data-rno="1">
           					<div>
           						<ul></ul>
           					</div>
           				</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
