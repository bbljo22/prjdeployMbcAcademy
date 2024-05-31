<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>마이페이지</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 추가적인 CSS -->
    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            max-width: 600px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>${user.name}님의 회원 정보</h2>
            </div>
            <div class="card-body">
                <p><strong>ID:</strong> ${user.id}</p>
                <p><strong>Password:</strong> ${user.password}</p>
                <p><strong>Name:</strong> ${user.name}</p>
                <p><strong>Birth:</strong> ${user.birth}</p>
                <p><strong>Address:</strong> ${user.address}</p>
                <p><strong>Email:</strong> ${user.email}</p>
                <p><strong>Gender:</strong> ${user.gender}</p>
                <p><strong>Phone:</strong> ${user.phone}</p>

                <button type="button" class="btn btn-primary" onclick="location.href='/cafe/update'">수정하기</button>
                <form action="/cafe/logout" method="get" class="d-inline">
                    <button type="submit" class="btn btn-secondary">로그아웃</button>
                </form>
                <form action="/cafe/delete" method="post" class="d-inline">
                    <button type="submit" class="btn btn-danger">탈퇴하기</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS 및 jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
               
