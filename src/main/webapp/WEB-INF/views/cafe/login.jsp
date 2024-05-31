<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-form {
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px; /* 로그인 폼을 화면 맨 위로 올리기 위해 추가 */
    }
    h1 {
        text-align: center;
    }
    table {
        margin: auto;
    }
    td {
        padding: 10px;
        text-align: right;
    }
    input {
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 200px;
    }
    button {
        padding: 8px 16px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        background-color: #007bff;
        color: #fff;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
<script type="text/javascript">
    // null 또는 undefined인지 확인하는 함수
    const isEmptyOrNull = (value) => {
        return value === null || value === undefined;
    }

    $(document).ready(function(){
        $("#login").click(function(e){
            console.log("로그인 버튼이 눌렸어요");
            e.preventDefault();
            
            var userId = $("#id").val();
            var userPassword = $("#password").val();
            if (isEmptyOrNull(userId) || isEmptyOrNull(userPassword)) {
                return;
            }

            console.log(userId, userPassword);
            var data = {id: userId, password: userPassword};

            $.ajax({
                type: 'post',
                url: '/cafe/login',
                data: JSON.stringify(data),
                contentType: "application/json ;charset=utf-8",
                success: function(result, status, xhr){
                    console.log(result);
                    if (result !== "fail") {
                        alert("로그인 하셨습니다.");
                        window.location.href = "http://localhost:8080/cafe/mypage?id=" + result;
                    } else {
                        alert("로그인에 실패했습니다.");
                    }
                }
            });
        });
    });
</script>
</head>
<body>
    <div class="login-form">
        <h1>로그인 페이지</h1>
        <form action="register" method="post">
            <table>
                <tr>
                    <td><label>아이디</label></td>
                    <td><input type="text" name="id" id="id" placeholder="아이디"/></td>
                </tr>
                <tr>
                    <td><label>비밀번호</label></td>
                    <td><input type="password" name="password" id="password" placeholder="비밀번호"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button class="login" id="login" type="submit">로그인</button>
                        <button type="button" class="register" onClick="location.href='http://localhost:8080/cafe/loginregister'">회원가입</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
