<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- loginregister -->
<style>
    #wrap { padding: 0px 20%; }
    form { padding: 0 35%; margin-top: 15%; }
    table {
        border: 1px solid black;
        border-radius: 10px;
        padding: 15px 30px;
    }
    input { padding: 3px 0; }
    .check { margin-top: 15px; }
    .check:focus { outline: none; }
    .check, #idcheck { margin-bottom: 15px; }
    #submit { background: none; border: none; }
    .register { border: none; background: none; }
</style>
<script type="text/javascript">
    $(document).ready(function() {
        console.log("Document is ready"); // 확인용 로그
        
        $("#id").on("focusout", function() {
            console.log("ID field focus out event"); // 확인용 로그

            var id = $("#id").val();

            if (id.trim() === '') {
                $("#idCheck").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
                return false;
            }

            $.ajax({
                url: './ConfirmId',
                data: { id: id },
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    if (result) {
                        $("#idCheck").css("color", "black").text("사용 가능한 ID 입니다.");
                    } else {
                        $("#idCheck").css("color", "red").text("사용 불가능한 ID 입니다.");
                        $("#id").val('');
                    }
                }
            });
        });
        
        $("#submit").click(function(event) {
            console.log("Register button clicked"); // 확인용 로그
            
            // 모든 필드가 채워져 있는지 확인
            var empty = false;
            $("input").each(function() {
                if ($(this).val() === '') {
                    empty = true;
                    return false;
                }
            });

            if (empty) {
                alert("안 적은 부분이 있습니다."); // 수정된 부분
                event.preventDefault(); // 기본 이벤트 제거
                return;
            }
            
            // 여기에 회원가입 정보를 서버에 전송하는 코드 추가
        });
    });
</script>

</head>
<body>
    <form action="loginregister" method="post">
        <h1>회원가입 페이지</h1>
        <table>
            <tr>
                <td><label for="id">아이디</label></td>
                <td>
                    <input class="id" id="id" type="text" name="id" placeholder="아이디" autofocus>
                    <br>
                    <span id="idCheck"></span> <!-- 오류 메시지가 표시될 위치 -->
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input class="check" type="password" name="password" id="password" placeholder="비밀번호"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input class="check" type="text" name="name" id="name" placeholder="이름"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input class="check" type="text" name="birth" id="birth" placeholder="생년월일"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input class="check" type="text" name="address" id="address" placeholder="주소"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input class="check" type="text" name="email" id="email" placeholder="이메일"></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input class="check" type="text" name="gender" id="gender" placeholder="성별"></td>
            </tr>
            <tr>
                <td>핸드폰 번호</td>
                <td><input class="check" type="text" name="phone" id="phone" placeholder="핸드폰 번호"></td>
            </tr>
            <tr>
                <td><button id="submit" type="submit">등록</button></td>
                <td><button type="reset" class="register" onClick="location.href='http://localhost:8080/cafe/join'">취소</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
