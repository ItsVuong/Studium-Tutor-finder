<%-- 
    Document   : SignUpAccount
    Created on : Jan 14, 2024, 11:31:33 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Studium</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@100;600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/info.css" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
            <!-- Modal Search End -->

            <!-- Contact Us Start -->
            <div class="container" style="margin-top: 40px">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                        <img src="img/${userObj.profilePic}" alt="${userObj.getProfilePic()}'s IMG">
                                        <input type="hidden" name="img" value="${userObj.profilePic}">
                                    </div>
                                        <h5 class="user-name">${userObj.userName}</h5>
                                    <h6 class="user-email">${userObj.email}</h6>
                                </div>
                                <div class="about">
                                    <h5>About</h5>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                              <form action="changepass"method="POST">
                            <div class="row gutters">
                                 <input type="hidden" name="user" value="${userObj.userName}">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h2 class="mb-2 text-primary text-center">Change Password</h2>
                                </div>
                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 text-center" style="margin-left: 25%">
                                    <div class="form-group ">
                                        <label>Nhập mật khẩu cũ</label>
                                        <input type="text" class="form-control"  name="old_pw" placeholder="Your Password"required >

                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 text-center" style="margin-left: 25%">
                                    <div class="form-group text-center">
                                        <label>Nhập mật khẩu mới </label>
                                        <input type="text" class="form-control" name="pw1" placeholder="Your New Password"required >
                                    </div>
                                </div>
                                
                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 text-center" style="margin-left: 25%">
                                    <div class="form-group">
                                        <label>Xac nhận lại mật khẩu mới</label>
                                        <input type="text" class="form-control" name="pw2" placeholder="Enter Again Your New Password"required >
                                        <label for="profile-picture" class="form-label" style="text-align: center"><a href="/SWP391/forgotpassword">Forgot Password???</a></label>

                                    </div>
                                </div>

                                <div class="row gutters" style="margin-top: 20px">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <label style="color:red;">${mess}</label>
                                        <div class="text-right">
                                            <a href="account">
                                                <button type="button" class="btn btn-secondary">Don't Save</button>
                                            </a>
                                            
                                            <button type="submit"  class="btn btn-primary">Save</button>

                                        </div>
                                    </div>
                                </div>

                            </div>
                              </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer End -->

        <!-- Copyright Start -->

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
