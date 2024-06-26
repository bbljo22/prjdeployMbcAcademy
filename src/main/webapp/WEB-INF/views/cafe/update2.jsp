<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>

<h1 align="center">회원정보수정</h1>
	<div class="">
		<form action="/user/modify" method="post">
			<table>
				<tr>
					<td>* 아이디</td>
					<td><input type="text" id="id" name="id" value="${member.memberId }" readonly>
					</td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="password" value=""></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="name" value="${member.memberName }" readonly></td>
				</tr>

				<tr>
					<td>* 생년월일</td>
					<td><input type="text" name="birth" value="${member.memberEmail }"></td>
				</tr>
				<tr>
					<td>* 주소</td>
					<td><input type="text" name="address" value="${member.memberPhone }"></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="text" name="email" value="${post }" ></td>
					<!-- 배열로 값을 받았다면 ${addreess[0]}으로 표기하여 출력할수 있다-->
				</tr>
				<tr>
					<td>* 성별</td>
					<td><input type="text" name="gender" value="${gender }"></td>
				</tr>
				<tr>
					<td>* 핸드폰 번호</td>
					<td><input type="text" name="phone" value="${address }"></td>
				</tr>
				<tr>
				<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<button type="button" onclick="removeMember();"> 탈퇴하기 </button>
			<!-- //type을 button으로 꼭 적어줘야! submit이 되지 않는다!! 꼭 기억하기!
				 -->
				</td>
				</tr>
			</table>
			
		</form>
	</div>

<script>
function removeMember() {
	if(window.confirm("탈퇴하시겠습니까?")){
	location.href="/member/remove.kh";
	}
	
}
</script>
</body>
</html>