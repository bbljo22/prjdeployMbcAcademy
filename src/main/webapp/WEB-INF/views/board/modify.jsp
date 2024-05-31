<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function(){
	    $("button").click(function(e){
	        e.preventDefault();
	        var oper = $(this).data("oper");
	        console.log(oper);
	        if(oper === "modify"){
	            $("form").attr("action", "/board/modify").attr("method","post").submit();
	        } else if(oper === "cancel"){
	            var bno = $("#bno").val();
	            window.location.href = "/board/detail?bno=" + bno;
	        }
	    });
	});
</script>
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>게시글 수정</h3></div>
                <div class="panel-body">
                    <form action="/board/modify" method="post">
                        <div class="form-group">
                            <input type="hidden" id="bno" class="form-control" name="bno" value='${board.bno}' readonly/>
                        </div>      
                        <div class="form-group">
                            <label for="">제목</label>
                            <input type="text" class="form-control" name="title" value="${board.title}" />
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea id="" class="form-control" rows="5" name="content">${board.content}</textarea>
                        </div>
                        <div class="form-group">
                            <label>작성자 : </label> ${board.writer}
                        </div>
                        <div class="form-group">
                            <label>등록일 : </label> <fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate}"/>
                        </div>
                        <button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
                        <button type="submit" data-oper="cancel" class="btn btn-info">취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
