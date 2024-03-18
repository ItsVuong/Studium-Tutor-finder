<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo tài khoản gia sư</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <section class="vh-100 gradient-custom">
                <div class="container py-3 h-100">
                    <div class="row justify-content-center align-items-center h-100">
                        <div class="col-12 col-lg-9 col-xl-7">
                            <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                                <div class="card-body p-4 p-md-5">
                                    <h2 class="mb-3 pb-2 pb-md-0 mb-md-4">Tạo tài khoản</h2>

                                    <form action="signup" method="post" id="signupForm">
                                        <legend><span class="number">1</span>Thông tin tài khoản</legend>
                                        <div class="row">
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline form-group">
                                                    <label class="form-label" for="username">Tên tài khoản: </label>
                                                    <input type="text" id="username" name="username" class="form-control form-control-lg" required/>
                                                    <small class="error" id="usrnameError">${usrnameError}</small>
                                            </div>

                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="fullName">Họ và tên: </label>
                                                <input type="text" id="fullName" name="fullName" class="form-control form-control-lg" required/>

                                                <small class="error" id="fullnameError"></small>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="password">Mật khẩu: </label>
                                                <input type="password" id="password" name="password" class="form-control form-control-lg" required/>

                                                <small class="error" id="pwdError_1"></small>

                                            </div>

                                        </div>

                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <label class="form-label" for="password_2">Nhập lại mật khẩu: </label>
                                                <input type="password" id="password_2" name="password_2" class="form-control form-control-lg" required/>

                                                <small class="error" id="pwdError_2"></small>

                                            </div>

                                        </div>
                                    </div>

                                    <legend><span class="number">2</span>Thông tin liên lạc</legend>


                                    <div class="row">
                                        <div class="col-md-6 mb-1 pb-2">

                                            <div class="form-outline">
                                                <label class="form-label" for="email">Email: </label>
                                                <input type="email" id="email" name="email" class="form-control form-control-lg" required/>

                                                <small class="error" id="emailError"></small>


                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-1 pb-2">

                                            <div class="form-outline">
                                                <label class="form-label" for="phone">Số điện thoại: </label>
                                                <input type="tel" id="phone" name="phone" class="form-control form-control-lg" required/>

                                                <small class="error" id="phoneError"></small>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <label class="form-label" for="role">Choose option</label>
                                            <select class="form-select form-select-lg" id="role" name="role" required>
                                                <option selected value="" disabled>Bạn là: </option>
                                                <option value="parent">Phụ huynh</option>
                                                <option value="tutor">Gia sư</option>
                                            </select>


                                        </div>
                                    </div> 

                                    <div class="mt-1 pt-2">
                                        <input class="btn btn-primary btn-lg" style="color: white;" type="submit" value="Đăng ký" />
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#signupForm').submit(function (event) {
                    event.preventDefault();
                    emptyError();
                    let myForm = $('#signupForm');
                    console.log(myForm.serialize());
                    $.ajax({
                        url: 'signup',
                        method: 'POST',
                        data: myForm.serialize(),
                        success: function (data) {
                            alert('Tạo tài khoản thành công!');
                            const jsonData = JSON.parse(data);
                            window.location = jsonData.url;
                        },
                        error: function (error) {
                            var err = JSON.parse(error.responseText);
                            console.log(err.usrnameError);
                            if (err.hasOwnProperty("usrnameError")) {
                                document.getElementById('usrnameError').innerHTML = err.usrnameError;
                            } else {
                                document.getElementById('usrnameError').innerHTML = "";
                            }
                            if (err.hasOwnProperty("fullnameError")) {
                                document.getElementById('fullnameError').innerHTML = err.fullnameError;
                            } else {
                                document.getElementById('fullnameError').innerHTML = "";
                            }
                            if (err.hasOwnProperty("pwdError_1")) {
                                document.getElementById('pwdError_1').innerHTML = err.pwdError_1;
                            } else {
                                document.getElementById('pwdError_1').innerHTML = "";
                            }
                            if (err.hasOwnProperty("pwdError_2")) {
                                document.getElementById('pwdError_2').innerHTML = err.pwdError_2;
                            } else {
                                document.getElementById('pwdError_2').innerHTML = "";
                            }
                            if (err.hasOwnProperty("emailError")) {
                                document.getElementById('emailError').innerHTML = err.emailError;
                            } else {
                                document.getElementById('emailError').innerHTML = "";
                            }
                            if (err.hasOwnProperty("phoneError")) {
                                document.getElementById('phoneError').innerHTML = err.phoneError;
                            } else {
                                document.getElementById('phoneError').innerHTML = "";
                            }
                        }
                    });
                });
            });

            function emptyError() {






            }
        </script>
    </body>
</html>
