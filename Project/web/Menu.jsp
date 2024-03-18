<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/menu.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <nav style="position: relative;">  


            <!--            <div style="background-color: #f8f9fa; box-shadow: rgba(0, 0, 0, 0.25) 0px 4px 15px; position: relative; z-index: 1">
                            <img class="logo" style="width:250px" src="img/logo.jpg">
                        </div>-->


            <div class="navbar navbar-light bg-body-tertiary px-5 shadow-sm">
                <div class="container-fluid py-1">
                    <a href="home" id="homeLink2"><img class="logo" style="width:250px" src="img/logo.jpg"></a>
                    <div>
                        <c:if test="${sessionScope.userObj==null}">
                            <a href="login" class="btn btn-outline-primary" id="loginLink" role="button">ĐĂNG NHẬP</a> 
                            <a href="signup" class="btn btn-outline-primary" id="signupLink" role="button">ĐĂNG KÝ</a> 
                        </c:if>      

                        <c:if test="${sessionScope.userObj!=null}">
                            <a href="account?username=${userObj.userName}" class="border-1 border-dark btn btn-warning" role="button">Thông tin cá nhân</a> 
                            <a  href="Logout" class="btn btn-outline-primary amenu" role="button">ĐĂNG XUẤT</a> 
                        </c:if>        
                    </div>

                </div>
            </div>

            <div class="menu">

                <div style="margin-top: 0px; padding-bottom: 10px; padding-top:10px;">
                    <c:if test="${userObj.role != 2 and userObj.role != 1}">
                        <a class="oke active amenu" href="home" id="homeLink">Trang chủ</a>
                    </c:if>
                    <c:if test="${userObj.role != 3 and userObj.role != 1}">
                        <a class="oke active amenu" href="tutorhome" id="tutorHomeTab">Dành cho gia sư</a>
                    </c:if>
                    <c:if test="${userObj.role != 1}">
                        <a class="amenu" href="introduce.jsp" id="introduceLink">Giới thiệu</a>
                    </c:if>
                    <c:if test="${userObj.role != 1}">
                        <a class="amenu" href="ClassList" id="classLink">Lớp học</a>
                    </c:if>

                    <c:if test="${userObj.role != 1}">
                        <a class="amenu" href="listTutor" id="tutorLink">Gia sư</a>
                    </c:if>

                    <c:if test="${sessionScope.userObj!=null && userObj.role == 3}">
                        <a class="amenu" href="addClass" id="createClassLink">Tạo lớp</a> 
                        <a class="amenu" href="ManageClass_Parent" id="createManageClass_ParentLink">Quản lý lớp của tôi</a>
                    </c:if>
                    <c:if test="${sessionScope.userObj!=null && userObj.role == 1}">
                        <a class="amenu manageClass" href="ManageClass?xd=0" type="button"  >
                            Quản lý của admin
                            <b><span id="amountRequestAll" class="amount"></span></b>
                        </a>           
                    </c:if>
                    <c:if test="${sessionScope.userObj!=null && userObj.role == 1}">
                        <!--                        <a class="amenu manageClass dropdown-toggle " type="button" id="manageLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                    Quản lý của admin
                                                    <b><span id="amountRequestAll" class="amount" ></span></b>
                                                </a>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a style="width: 90%" class="dropdown-item" href="ManageClass?xd=0">Quản lý lớp học của bạn</a>
                                                    <a style="width: 90%" class="dropdown-item" href="ManageClass?xd=1">Lớp học đang chờ xét duyệt
                                                        <b><span id="amountRequestClass" class="amount"></span></b></a>                              
                                                    <a style="width: 90%" class="dropdown-item" href="RequestOfTutor">Yêu cầu của gia sư
                                                        <b><span id="amountRequestTutor" class="amount"></span></b></a>
                                                    <a style="width: 90%" class="dropdown-item" href="RequestOfParent">Yêu cầu của phụ huynh
                                                        <b><span id="amountRequestParent" class="amount"></span></b></a>
                                                    <a style="width: 90%" class="dropdown-item" href="ManageClass?xd=2">Xem lớp học của admin khác
                                                    </a>
                                                </div>-->
                    </c:if>

                    <c:if test="${sessionScope.userObj!=null && userObj.role == 1}">
                        <a class="amenu" href="crudacc" id="manageAccountLink">Quản lý tài khoản</a>

                    </c:if>

                    <a class="amenu manageClass dropdown-toggle d-none" id="tutorDocument" type="button" id="manageLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                        Tài liệu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a style="width: 90%" class="dropdown-item" href="#">Cách thức nhận lớp</a>
                        <a style="width: 90%" class="dropdown-item" href="">Hợp đồng mẫu</a>
                    </div>

                    <c:if test="${sessionScope.userObj != null && sessionScope.userObj.role == 1}">
                        <a class="amenu" href="crudtutor" id="acceptTutorLink">
                            Xác thực Tutor 
                            <b><span id="amountPending" style="
                                     background-color: red;
                                     color: white;
                                     border: 2px solid black;
                                     border-radius: 50%;
                                     width: 23px;
                                     height: 23px;
                                     display: inline-block;
                                     text-align: center;
                                     line-height: 20px;
                                     vertical-align: middle; /* Thêm dòng này để căn giữa theo chiều dọc */
                                     margin-top: -1px; /* Điều chỉnh margin-top nếu cần thiết */
                                     "></span></b>
                        </a>
                    </c:if>

                    <script src="js/Menu.js"></script>
                    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                </div>
            </div>
        </nav>
        <c:if test = "${sessionScope.userObj.role == 2 and sessionScope.tutor == null}">
            <div class="alert" id="TutorProfileAlert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <b>Hồ sơ chưa hoàn thiện:</b> Tài khoản không thể nhận lớp và không xuất hiện trong danh sách gia sư. <a class = "fw-bold text-decoration-underline" href="#">Hoàn thiện ngay!</a>
            </div>
        </c:if>


        <script>
//            $(document).ready(function hideHomeTab(){document.getElementById("home").classList.add("d-none");});

        </script>
    </body>

</html>




