<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
</head>
<body>
    <h2>${user.name}님의 회원 정보</h2>
    <p>아이디: ${user.id}</p>
    <p>이름: ${user.name}</p>
    <p>생년월일: ${user.birth}</p>
    <p>주소: ${user.address}</p>
    <p>이메일: ${user.email}</p>
    <p>성별: ${user.gender}</p>
    <p>전화번호: ${user.phone}</p>

    <form action="/cafe/logout" method="get">
        <button type="submit">로그아웃</button>
    </form>

    <form action="/update" method="get">
        <button type="button" onclick="" %>>회원정보 수정</button>
    </form>

    <form action="/delete" method="post">
        <button type="submit">회원탈퇴</button>
    </form>
</body>
</html>
