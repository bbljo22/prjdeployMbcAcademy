<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <p>아이디: <input type="text" name="id" /></p>
        <p>비밀번호: <input type="password" name="password" /></p>
        <p>이름: <input type="text" name="name" /></p>
        <p>이메일: <input type="email" name="email" /></p>
        <p>생년월일: <input type="text" name="birth" /></p>
        <p>주소: <input type="text" name="address" /></p>
        <p>성별: <input type="text" name="gender" /></p>
        <p>전화번호: <input type="text" name="phone" /></p>
        <button type="submit">회원가입</button>
    </form>
</body>
</html>
