<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-9 col-lg-6 col-xl-5">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                                 class="img-fluid" alt="Sample image">
                        </div>
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <form action="login" method="post">

                                <div class="divider d-flex align-items-center my-4">
                                    <h3 class="text-center fw-bolder mx-3 mb-0">Đăng nhập</h3>
                                </div>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="username">Tên tài khoản: </label>
                                    <input type="text" id="username" name="username" class="form-control form-control-lg"/>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-3">
                                    <label class="form-label" for="password">Mật khẩu</label>
                                    <input type="password" id="password" name="password" class="form-control form-control-lg"/>
                                </div>

                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Checkbox -->
                                    <div class="mb-0" >
                                    <c:if test = "${errorMsg != null}">
                                        <div class='error'>${errorMsg}</div>
                                    </c:if>
                                </div>
                                <a href="#!" class="text-body">Quên mật khẩu?</a>
                            </div>

                            <div class="text-center text-lg-start mt-1 pt-2">
                                <button class="btn btn-primary btn-lg text-white" type="submit"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>


                                <p class="small fw-bold mt-2 pt-1 mb-0">Chưa có tài khoản? <a href="http://localhost:9999/SWP391/signup"
                                                                                              class="link-danger">Đăng ký</a></p>
                            </div>
                            <c:if test = "${param.from != null}">
                                <input type="hidden" name="from" value="${param.from}">
                            </c:if>
                            <c:if test = "${param.fromclass != null}">
                                <input type="hidden" name="fromclass" value="${param.fromclass}">
                                <input type="hidden" name="cid" value="${param.id}">
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>

        </section>
    </body>

</html>
