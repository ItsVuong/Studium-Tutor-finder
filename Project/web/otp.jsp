<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác nhận OTP</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <div>
            <form action="otpvalidation" method="post">
                <h1> Nhập mã OTP của bạn: </h1>
                <fieldset>
                    <label for="otp" required>Hãy kiểm tra email để lấy OTP:</label>
                    <input type="text" id="otp" name="otp">
                    <button class="button" type="submit">Xác nhận</button>
                </fieldset>
                <div>
                    <a <a class="left" href="/SWP391/login">Đăng nhập</a>
                    <a <a class="right"href="/SWP391/signup">Tạo tài khoản</a>
                </div>
            </form>
        </div>
        <script>
            function alertMsg(msg) {
                alert(msg);
            }
            <c:if test = "${errorMsg != null}">
            alertMsg("${errorMsg}");
            </c:if>
        </script>
    </body>
</html>
