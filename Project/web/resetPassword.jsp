<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đổi mật khẩu</title>
        
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <div>
            <form action="resetpassword" method="post">
                <h1> Đổi mật khẩu </h1>
                <fieldset>
                    <label for="password">Mật khẩu: </label>
                    <input type="password" id="password" name="password" required>
                    <c:if test = "${pwdError_1 != null}">
                        <div class='error'>${pwdError_1}</div>
                    </c:if>
                    <label for="password-2">Nhập lại mật khẩu: </label>
                    <input type="password" id="password-2" name="password-2" required>
                    <c:if test = "${pwdError_2 != null}">
                        <div class='error'>${pwdError_2}</div>
                    </c:if>
                </fieldset>
                <button class="button" type="submit">Đăng nhập</button>
                <div>
                    <a <a class="left" href="/SWP391/login">Đăng nhập</a>
                    <a <a class="right"href="/SWP391/signup">Tạo tài khoản</a>
                </div>

            </form>
        </div>
    </body>
</html>
