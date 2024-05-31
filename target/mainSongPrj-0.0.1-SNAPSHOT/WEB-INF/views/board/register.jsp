<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function(){
	    $("#reset").click(function(e){
	        e.preventDefault(); // 기본 동작(폼 리셋)을 막음
	        window.location.href = "/board/list";
	    });
	});
</script>
</head>
<body>
     <div class="row">
         <div class="col-lg-12">
             <div class="panel panel-default">
                 <div class="panel-body"> 
                     <form action="/board/register" method="post" role='form'>
                         <div class="form-group">
                             <label for="">제목</label>
                             <input type="text" class="form-control" name="title"/>
                         </div>
                         <div class="form-group">
                             <label for="">내용</label>
                             <textarea  id="" class="form-control" rows="5" name="content"></textarea>
                         </div>
                         <div class="form-group">
                             <label for="">작성자</label>
                             <input type="text" class="form-control" name="writer"/>
                         </div>
                         <button type="submit"  class="btn btn-primary">등록</button>
                         <button type="reset" id="reset" class="btn btn-danger">취소</button>
                     </form>
                 </div>
             </div>
         </div>
     </div>
</body>
</html>