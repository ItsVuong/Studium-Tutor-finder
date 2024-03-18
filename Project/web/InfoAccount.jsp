<%-- 
    Document   : SignUpAccount
    Created on : Jan 14, 2024, 11:31:33 AM
    Author     : Acer
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Studium</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/class.css">
        <link rel="stylesheet" href="css/manageclass.css">
        <link rel="stylesheet" href="css/ClassDetail.css">
        <link href="css/info.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
        <% 
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <script type="text/javascript">
            window.onload = function () {
                setTimeout(function () {
                    alert('<%= successMessage %>');
                }, 500); // Trì hoãn 0.5 giây trước khi hiển thị thông báo
            };
        </script>
        <% } %>
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
                                <c:if test="${userObj.role == 2}">
                                    <jsp:include page="TutorMenu.jsp"></jsp:include>  
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row gutters">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <h6 class="mb-2 text-primary">Personal Details</h6>                                 
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">

                                    
                                    
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control" name="fullname" readonly value="${userObj.fullName}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>UserName</label>
                                        <input type="text" class="form-control" name="username" readonly value="${userObj.userName}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email" readonly value="${userObj.email}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone" readonly value="${userObj.phone}">
                                    </div>
                                </div>
                            </div>

                            <div class="row gutters" style="margin-top: 20px">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="text-right">
                                        <a href="changepass">
                                            <button type="button" id="submit" name="submit" class="btn btn-secondary">ChangePassword</button>
                                        </a>
                                        <a href="changeinfoacc?username=${userObj.userName}">
                                            <button type="button" id="submit" name="submit" class="btn btn-primary">Update</button>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Us End -->

        <!-- Footer Start -->

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
            document.getElementById("personalMenu").classList.add('active');
        </script>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src=js/Hung.js"></script>
</html>
