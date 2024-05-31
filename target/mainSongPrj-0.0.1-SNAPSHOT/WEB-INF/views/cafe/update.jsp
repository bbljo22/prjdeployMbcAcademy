<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 추가적인 CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">회원정보 수정</h2>
        <form action="${pageContext.request.contextPath}/update" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" value="${user.password}" />
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" />
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" />
            </div>
            <div class="form-group">
                <label for="birth">생년월일</label>
                <input type="text" class="form-control" id="birth" name="birth" value="${user.birth}" />
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" name="address" value="${user.address}" />
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <input type="text" class="form-control" id="gender" name="gender" value="${user.gender}" />
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" />
            </div>
            <button type="submit" id="su" class="btn btn-primary">수정</button>
        </form>
    </div>
	<script type="text/javascript">
	$(document).ready(function(){
	    $("#su").click(function(e){
	        e.preventDefault(); // 기본 동작 중지

	        // 사용자가 입력한 정보 가져오기
	        var userData = {
	            id: $("#id").val(),
	            password: $("#password").val(),
	            name: $("#name").val(),
	            email: $("#email").val(),
	            birth: $("#birth").val(),
	            address: $("#address").val(),
	            gender: $("#gender").val(),
	            phone: $("#phone").val()
	        };

	        // 서버로 데이터 전송
	        $.ajax({
	            type: "POST",
	            url: "/mypage",
	            data: userData,
	            success: function(response){
	                // 성공적으로 업데이트되었을 때 수행할 작업
	                alert("회원정보가 성공적으로 업데이트되었습니다.");
	            },
	            error: function(xhr, status, error){
	                // 오류 발생 시 수행할 작업
	                console.error(xhr.responseText);
	                alert("회원정보 업데이트 중 오류가 발생했습니다.");
	            }
	        });
	    });
	});

	</script>
    <!-- Bootstrap JS 및 jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
