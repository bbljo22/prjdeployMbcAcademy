<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>민원/신고 게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function() {
	    $("#regBtn").click(function(e) {
	        window.location.href = "/board/register";
	    });
        var searchForm = $("#searchForm")
        $("#searchForm button").click(function(e){
          var findSelected=  searchForm.find("option:selected").val()
          var findKeyword=  searchForm.find("input[name='keyword']").val()
          var pageNum=  searchForm.find("input[name='pageNum']").val()
          if(!findSelected){
            alert("검색 종류를 선택하세요")
            return false
          }
          if(!findKeyword){
            alert("키워드를 이력하세요")
            return false
          }
          searchForm.find("input[name='pageNum']").val(pageNum)
          e.preventDefault()
          searchForm.submit()
        })
    });
</script>
<style>
    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
    }
    .pagination li {
        margin: 0 5px;
    }
    .pagination li a {
        text-decoration: none;
        color: #007bff;
    }
    .pagination li.active a {
        font-weight: bold;
        color: #000;
    }
</style>
</head>
<body>
	<div class="field">
		<div class="new-btn" id="regBtn">
			<button>새글등록</button>
		</div>
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${board}" var="board">
						<tr>
							<td>${board.bno}</td>
							<td><a href="/board/detail?bno=${board.bno}">${board.title}</a></td>
							<td>${board.writer}</td>
							<td>
								<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>${board.views}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
            <form action="/board/list" id="searchForm">
                <select name="type" id="">
                	<option value="" "${pageMaker.cri.type ==null?'selected':''}">--</option>
	                <option value="T" "${pageMaker.cri.type eq 'T' ?'selected':''}">제목</option>
	                <option value="W" "${pageMaker.cri.type eq 'W' ?'selected':''}" >작성자</option>
                </select>
                <input type="text" name="keyword"/>
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
                <button class="btn btn-default">검색</button>
            </form>
            <form action="/board/list" id="actionForm">
            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>   
               	<input type="hidden" name="type" value="${pageMaker.cri.type}"/>   
               	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>   
            </form>
			<div class="pull-right">
			    <ul class="pagination">
		            <li class="paginate_button previous">
		                <a href="/board/list?pageNum=${pageMaker.startPage-1}">이전</a>
		            </li>
			        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			            <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
			                <a href="/board/list?pageNum=${num}">${num}</a>
			            </li>
			        </c:forEach>
		            <li class="paginate_button next">
		                <a href="/board/list?pageNum=${pageMaker.endPage+1}">다음</a>
		            </li>
			    </ul>
			</div>

		</div>
	</div>
    

</body>
</html>