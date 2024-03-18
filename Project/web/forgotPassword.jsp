<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên mật khẩu</title>
        
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>

        <div>
            <form action="forgotpassword" method="post">
                <h1> Khôi phục mật khẩu </h1>
                <fieldset>
                    <label for="email" required>Nhập email của bạn:</label>
                    <input type="email" id="email" name="email">
                    <c:if test = "${forgotPasswordMsg != null}">
                        <div class='error'>${forgotPasswordMsg}</div>
                    </c:if>
                </fieldset>
                <button class="button" type="submit">Khôi phục</button>
                <div>
                    <a  class="left" href="/SWP391/login">Đăng nhập</a>
                    <a  class="right"href="/SWP391/signup">Tạo tài khoản</a>
                </div>
            </form>
        </div>


    </body>
</html>
