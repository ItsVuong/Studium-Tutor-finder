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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
        <!-- Modal Search End -->

        <!-- Contact Us Start -->
       <div class="container-fluid py-5 bg-light rounded">
    <div class="p-5">
        <div class="row g-4">
                        <div class="col-lg-3" style="background-color: black; border-radius: 15px;">
                            <div class="row g-4">
                                <h1 class="text-center" style="background-color:#C0C0C0;border-radius: 15px;">Manage</h1>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit">Thông tin cá nhân</button>
                                </div>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit">Đăng kí làm Tutor</button>
                                </div>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit">Lớp học hiện tại</button>
                                </div>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit">Lịch sử lớp học</button>
                                </div>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit">Đổi mật khẩu</button>
                                </div>
                                <div class="col-12 mb-2">
                                    <button class="w-100 btn btn-primary form-control py-3" type="submit" style="color: red">Log Out</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <form action="" class="mb-4">
                                <div class="row g-4">                                

                                    <h1 class="col-md-10 offset-md-1 text-center" style="background-color: #C0C0C0;border-radius: 15px; color:#1b7dff;   justify-content: center;">Information</h1>

                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Your Class</label>
                                        <input type="text" class="w-100 form-control border-0 py-3" name="name" placeholder="Your UserName"required >
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Date Start</label>
                                        <input type="text" class="w-100 form-control border-0 py-3" name="phone" placeholder="Enter Your Phone (10 numbers)" required>
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Date End</label>
                                        <input type="date" class="w-100 form-control border-0 py-3" name="dob" placeholder="Date Of Birth" required>
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Your Subject</label>
                                        <input type="email" class="w-100 form-control border-0 py-3" name="email" placeholder="Enter Your Email" required>
                                    </div>
                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Tutor</label>
                                        <input type="text" class="w-100 form-control border-0 py-3" name="name" placeholder="Gender"required >
                                    </div>

                                    <div class="col-lg-2">
                                        <label for="profile-picture" class="form-label">Status</label>
                                        <input type="text" class="w-100 form-control border-0 py-3" name="name" placeholder="Gender"required >
                                    </div>


                                    <div class="col-6">
                                        <button class="w-100 btn btn-primary form-control py-3" type="submit">Export data to Excel</button>
                                    </div>

                                    <div class="col-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>                                         
                                        </div>
                                          <label for="profile-picture" class="form-label">You can search information</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="d-flex p-4 rounded bg-white">
                                    <i class="fas fa-home fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Home</h4>
                                        <p class="mb-0">Back to home</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="d-flex p-4 rounded bg-white">
                                    <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Mail Us</h4>
                                        <p class="mb-0">info@example.com</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="d-flex p-4 rounded bg-white">
                                    <i class="fa fa-star fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Admin Chat</h4>
                                        <p class="mb-0">Feedback and vote</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="d-flex p-4 rounded bg-white">
                                    <i class="fa fa-share-alt fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Share</h4>
                                        <div class="d-flex">
                                            <a class="me-3" href=""><i class="fab fa-twitter text-dark link-hover"></i></a>
                                            <a class="me-3" href=""><i class="fab fa-facebook-f text-dark link-hover"></i></a>
                                            <a class="me-3" href=""><i class="fab fa-youtube text-dark link-hover"></i></a>
                                            <a class="" href=""><i class="fab fa-linkedin-in text-dark link-hover"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Us End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark footer py-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(255, 255, 255, 0.2);">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#" class="d-flex flex-column flex-wrap">
                                <p class="text-white mb-0 display-6">Studium</p>
                                <small class="text-light" style="letter-spacing: 11px; line-height: 0;">Encourge</small>
                            </a>
                        </div>
                        <div class="col-lg-9">
                            <div class="d-flex position-relative rounded-pill overflow-hidden">
                                <input class="form-control border-0 w-100 py-3 rounded-pill" type="email" placeholder="example@gmail.com">
                                <button type="submit" class="btn btn-primary border-0 py-3 px-5 rounded-pill text-white position-absolute" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-6 col-xl-3">
                        <div class="footer-item-1">
                            <h4 class="mb-4 text-white">Get In Touch</h4>
                            <p class="text-secondary line-h">Address: <span class="text-white">123 Streat, New York</span></p>
                            <p class="text-secondary line-h">Email: <span class="text-white">Example@gmail.com</span></p>
                            <p class="text-secondary line-h">Phone: <span class="text-white">+0123 4567 8910</span></p>
                            <div class="d-flex line-h">
                                <a class="btn btn-light me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter text-dark"></i></a>
                                <a class="btn btn-light me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f text-dark"></i></a>
                                <a class="btn btn-light me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube text-dark"></i></a>
                                <a class="btn btn-light btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in text-dark"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-3">
                        <div class="footer-item-2">
                            <div class="d-flex flex-column mb-4">
                                <h4 class="mb-4 text-white">Recent Posts</h4>
                                <a href="#">
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle border border-2 border-primary overflow-hidden">
                                            <img src="img/footer-1.jpg" class="img-zoomin img-fluid rounded-circle w-100" alt="">
                                        </div>
                                        <div class="d-flex flex-column ps-4">
                                            <p class="text-uppercase text-white mb-3">Life Style</p>
                                            <a href="#" class="h6 text-white">
                                                Get the best speak market, news.
                                            </a>
                                            <small class="text-white d-block"><i class="fas fa-calendar-alt me-1"></i> Dec 9, 2024</small>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="d-flex flex-column">
                                <a href="#">
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle border border-2 border-primary overflow-hidden">
                                            <img src="img/footer-2.jpg" class="img-zoomin img-fluid rounded-circle w-100" alt="">
                                        </div>
                                        <div class="d-flex flex-column ps-4">
                                            <p class="text-uppercase text-white mb-3">Sports</p>
                                            <a href="#" class="h6 text-white">
                                                Get the best speak market, news.
                                            </a>
                                            <small class="text-white d-block"><i class="fas fa-calendar-alt me-1"></i> Dec 9, 2024</small>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-3">
                        <div class="d-flex flex-column text-start footer-item-3">
                            <h4 class="mb-4 text-white">Categories</h4>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Sports</a>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Magazine</a>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Lifestyle</a>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Politician</a>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Technology</a>
                            <a class="btn-link text-white" href=""><i class="fas fa-angle-right text-white me-2"></i> Intertainment</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-3">
                        <div class="footer-item-4">
                            <h4 class="mb-4 text-white">Our Gallary</h4>
                            <div class="row g-2">
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-1.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-2.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-3.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-4.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-5.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="rounded overflow-hidden">
                                        <img src="img/footer-6.jpg" class="img-zoomin img-fluid rounded w-100" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-2 border-white rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   
        <script src="js/main.js"></script>
    </body>

</html>
