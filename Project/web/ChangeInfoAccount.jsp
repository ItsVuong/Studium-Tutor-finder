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

    <body onload="reloadImg('img/${sessionScope.userObj.profilePic}');">
        <jsp:include page="Menu.jsp"></jsp:include> 
        <% 
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <script type="text/javascript">
            window.onload = function () {
                setTimeout(function () {
                    alert('<%= successMessage %>');
                }, 500); // trì hoãn 0.5 giây
            };
        </script>
        <%
            }
        %>
        <!-- Modal Search End -->

        <!-- Contact Us Start -->

        <div class="container" style="margin-top: 40px">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <form action="updateavatar" id="avatarForm" enctype="multipart/form-data">
                                        <div class="user-avatar">
                                            <div>
                                                <img id="previewImage" src="img/${userObj.profilePic}"  alt="${userObj.userName}'s IMG"> 
                                                <img id="loadingIcon" src="img/loading.gif" style="display: none;" alt="Loading...">
                                            </div>
                                            <c:if test="${sessionScope.tutor.isValidated or sessionScope.userObj.role != 2}">
                                            <div class="mt-2">
                                                    <label for="img" class="form-label fw-bold mb-1">Thay ảnh đại diện:</label>
                                                    <input type="file" class="form-control form-control-sm" name="img" id="img"  onchange="previewSelectedImage(event)">

                                                </div>
                                                <button type="submit" id="avatarButton" class="btn btn-secondary btn-sm mt-2">Lưu thay đổi</button>
                                            </c:if>
                                        </div>
                                    </form>
                                    <script>
                                        function previewSelectedImage(event) {
                                            var input = event.target;
                                            var preview = document.getElementById('previewImage');
                                            if (input.files && input.files[0]) {
                                                var reader = new FileReader();
                                                reader.onload = function (e) {
                                                    preview.src = e.target.result;
                                                };
                                                reader.readAsDataURL(input.files[0]);
                                            } else {
                                                input.style.display = 'none';
                                            }
                                        }
                                    </script>

                                    <h5 class="user-name">${userObj.userName}</h5>
                                    <h6 class="user-email">${userObj.email}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <form action="changeinfoacc?username=${userObj.getUserName()}" method="POST">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" class="form-control"name="fullname" value="${userObj.getFullName()}">
                                            <c:if test="${fullnameError != null}">
                                                <div class='error'style="color:red">${fullnameError}</div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>UserName</label>
                                            <input type="text" class="form-control" name="username"  readonly value="${userObj.userName}">
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
                                            <input type="text" class="form-control" name="phone" value="${userObj.phone}">
                                            <c:if test = "${phoneError != null}">
                                                <div class='error' style="color:red">${phoneError}</div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row gutters" style="margin-top: 20px">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
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

        <!-- Contact Us End -->

        <!-- Footer Start -->

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>

                                        $(document).ready(function () {
                                            $('#loadingIcon').hide();

                                            $('#avatarForm').submit(function (event) {
                                                event.preventDefault();

                                                $('#loadingIcon').show();
                                                $('#previewImage').hide();

                                                $.ajax({
                                                    url: 'updateavatar',
                                                    method: 'POST',
                                                    data: new FormData(this),
                                                    processData: false,
                                                    contentType: false,
                                                    success: function (data) {
                                                        reloadImg('img/${sessionScope.userObj.profilePic}');
                                                        $('#loadingIcon').hide();
                                                        $('#previewImage').show();
                                                        console.log("abc");
                                                        alert("Cập nhật ảnh thành công");
//                                                        window.location.reload();
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        console.error(errorThrown);
                                                        $('#loadingIcon').hide();
                                                        var errorMessage = jqXHR.responseText;
                                                        alert(errorMessage);
                                                        window.location.reload();
                                                    }
                                                });
                                            });
                                        });


                                        document.getElementById("personalMenu").classList.add('active');

                                        async function reloadImg(url) {
                                            await fetch(url, {cache: 'reload', mode: 'no-cors'}
                                            );
                                            document.body.querySelectorAll(`img[src='${url}']`).forEach(img => img.src = url);
                                            console.log('reloadImg: ' + url);
                                        }

        </script>
    </body>

</html>
