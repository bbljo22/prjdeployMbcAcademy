<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script type="text/javascript"></script>
  </head>
  <body>
    <form action="/login" method="post">
      <h2>로그인</h2>
      <div>
        <input type="text" name="id" placeholder="Id" />
      </div>
      <div>
        <input type="password" name="password" placeholder="Password" />
      </div>
      <button type="submit">로그인</button>
      <button type="button" onclick="location.href='signup">회원가입</button>
    </form>
  </body>
</html>
