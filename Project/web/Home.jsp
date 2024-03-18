
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="img/Studium-icon.PNG">
        <link rel="stylesheet" href="css/homepage.css">
    </head>   
    <body>
        <script src="js/Menu.js"></script>
        ${id}
        <jsp:include page="Menu.jsp"></jsp:include>
            <section style="background-image: url('img/banner.jpg');background-size: cover">

                <div class="container" style="padding-bottom: 20px;padding-top: 20px" >
                    <div class="col-md-8 col-sm-10 col-xl-5"style="background-color: white;padding:30px;box-shadow: 0 0 10px 2px black;">
                        <ul class="nav nav-pills mb-3 shadow-sm" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="forParent-tab" data-toggle="pill" href="#forParent" role="tab" aria-controls="pills-home" aria-selected="true">Dành cho phụ huynh</a>
                            </li>
                        <c:if test="${sessionScope.userObj == null}">
                            <li class="nav-item">
                                <a class="nav-link" id="forTutor-tab" data-toggle="pill" href="#forTutor" role="tab" aria-controls="pills-profile" aria-selected="false">Dành cho gia sư</a>
                            </li>
                        </c:if>  
                    </ul>

                    <div class="tab-content" id="pills-tabContent p-3">
                        <div class="tab-pane fade show active" id="forParent" role="tabpanel" aria-labelledby="forParent-tab">
                            <h3>Trung tâm gia sư Studium</h3>
                            <h3 style="font-weight: bold;color: #0080ff">Mang thành công đến với con bạn</h3>
                            <h5 style="font-weight: bold;color: #4a4949">Nhận tư vấn khi đăng lớp!</h5>
                            <p>Bạn muốn con chăm ngoan, học giỏi? Đăng ký ngay! Đội ngũ gia sư giỏi của Studium sẽ giúp con bạn tiến bộ nhanh chóng.</p>
                            <button style="background-color: orange;padding: 10px;border-radius: 10px; ">
                                <a style="text-decoration: none; color: black;"
                                   <c:if test = "${sessionScope.userObj == null}"> href="login"</c:if>
                                   <c:if test = "${sessionScope.userObj.role == 3}"> href="addClass"</c:if>>
                                       Đăng lớp tìm gia sư
                                   </a>
                                </button>
                                <span>Hoặc</span>
                                <button style="background-color: orange;padding: 10px;border-radius: 10px; ">
                                    <a style="text-decoration: none; color: black;" href="listTutor">
                                        Xem danh sách gia sư
                                    </a>
                                </button>
                            </div>

                            <div class="tab-pane fade" id="forTutor" role="tabpanel" aria-labelledby="forTutor-tab">
                                <h3>Trung tâm gia sư Studium</h3>
                                <h2 style="font-weight: bold;color: #0080ff">Gia nhập đội ngũ gia sư của Studium</h2>
                                <p>Phần giới thiệu cho gia sư</p>
                                <button style="background-color: orange;padding: 10px;border-radius: 10px; ">
                                    <a style="text-decoration: none; color: black;" 
                                       href="tutorhome">
                                        Trang dành cho gia sư.
                                    </a>
                                </button>
                            </div>
                        </div>                  
                    </div>
                </div>

            </section>

            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <img src="img/iconhome1.jpg" class="img-fluid ad-icon" alt="Icon 1">
                            <span style="font-size: 18px;color: black;font-weight: bold">Đội ngũ gia sư được</span>
                            <span style="font-size: 18px;color: #0080ff;font-weight: bold"> chọn lọc kĩ càng</span>

                        </div>
                        <div class="col-md-4">
                            <img src="img/iconhome2.jpg" class="img-fluid ad-icon" alt="Icon 2">
                            <span style="margin-left: 15px;font-size: 18px;color: black;font-weight: bold">Tìm gia sư </span>
                            <span style="font-size: 18px;color: #0080ff;font-weight: bold">khu vực Hà Nội</span>
                        </div>
                        <div class="col-md-3">
                            <img src="img/iconhome3.jpg" class="img-fluid ad-icon" alt="Icon 3">
                            <span style="margin-left: 10px;font-size: 18px;color: black;font-weight: bold">Hỗ trợ </span>
                            <span style="font-size: 18px;color: #0080ff;font-weight: bold">nhiệt tình</span>
                        </div>
                    </div>
                </div>
            </section>

            <section class="bg-light py-3">
                <div class="container px-5">
                    <div class="row gx-5 justify-content-center align-items-center">
                        <div class="col-xxl-8 col-md-8 ">
                            <div class="text-start my-5">
                                <h2 class="display-5 fw-bolder"><span class="d-inline">Bạn cần thuê gia sư?</span></h2>
                                <p class="lead fw-bolder mb-3">
                                    Trải nghiệm nền tảng tìm kiếm gia sư chuyên nghiệp và nhanh chóng!<br/>
                                </p>
                                <p class="text-muted">
                                    Các môn học phổ biến:
                                </p>
                                <div class="mb-4 subject-list">
                                <c:forEach items="${requestScope.subjectList}" var="item">
                                    <c:if test="${item.popular}">
                                        <a class="btn btn-outline-info" href="listTutor?inforSearch=${item.subjectName.replace(' ', '+')}" role="button">${item.subjectName}</a>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <img src="img/teacher.png" class="img-fluid count-icon" alt="Icon 1">
                                    <span class="display-5 fw-bolder align-bottom" style=";color: #0080ff;font-weight: bold">500</span>
                                    <span class="align-bottom" style="font-size: 18px;color: #0080ff;font-weight: bold">Gia sư</span>
                                </div>
                                <div class="col-md-6">
                                    <img src="img/home.png" class="img-fluid count-icon" alt="Icon 2">
                                    <span class="display-5 fw-bolder align-bottom" style=";color: #0080ff;font-weight: bold">700</span>
                                    <span class="align-bottom" style="font-size: 18px;color: #0080ff; font-weight: bold">Lớp đã được nhận</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xxl-4 col-md-4">
                        <img src="img/7226840.jpg" class="img-fluid" alt="parent image" id="parent-img">
                    </div>
                </div>
            </div>
        </section>

        <section class=" py-4">
            <div class="container px-5">
                <h2 class="display-7 mb-4 fw-bolder text-center"><span class="d-inline">Dịch vụ của chúng tôi</span></h2>
                <div class="row gx-5">

                    <div class="col-xxl-4 col-md-4 ">
                        <h4 class="fw-bolder mb-4"><span class="d-inline">Tuyển chọn gia sư chặt chẽ</span></h4>
                        <p class="text-muted">
                            Chúng tôi luôn làm việc trách nhiệm, tất cả gia sư đều phải trải qua bài kiểm tra và 
                            phỏng vấn để có thể nhận lớp tại Studium.
                        </p>
                    </div>

                    <div class="col-xxl-4 col-md-4">
                        <h4 class="fw-bolder mb-4"><span class="d-inline">Hồ sơ gia sư đầy đủ</span></h4>
                        <p class="text-muted">
                            Studium lưu trữ đầy đủ các thông tin của gia sư. 
                            Bạn sẽ được gửi CV để xem chi tiết về thông tin gia sư khi có gia nhận dạy lớp của bạn.
                        </p>
                    </div>

                    <div class="col-xxl-4 col-md-4">
                        <h4 class="fw-bolder mb-4"><span class="d-inline">Học thử 2 buổi</span></h4>
                        <p class="text-muted">
                            Sau 2 buổi học đầu tiên, nếu không đồng ý nhận gia sư, bạn không phải thanh toán học phí và được đổi gia sư khác.
                        </p>
                    </div>

                    <div class="text-center my-4">
                        <a class="btn btn-primary p-2 border-1 border-dark text-white" href="#" role="button">Phụ huynh cần biết</a>
                    </div>
                </div>
        </section>

        <section class="bg-light py-4">
            <div class="container px-5">
                <h2 class="display-7 mb-4 fw-bolder text-center"><span class="d-inline">Liên hệ với chúng tôi</span></h2>
                <div class="row gx-5">
                    <!--card 1-->
                    <div class="col">
                        <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                            <div class="card-body p-0">
                                <div class="d-flex align-items-center justify-content-center">
                                    <img src="img/phone-call.png" class="img-fluid contact-icon" alt="Icon 1">
                                    <div class="p-5">
                                        <h3 class="fw-bolder">Điện thoại: </h3>
                                        <h2>1234567890</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--card 2-->
                    <div class="col">
                        <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                            <div class="card-body p-0">
                                <div class="d-flex align-items-center justify-content-center">
                                    <img src="img/envelope.png" class="img-fluid contact-icon" alt="Icon 1">
                                    <div class="p-5">
                                        <h3 class="fw-bolder">Email: </h3>
                                        <h2>Studium@gmail.com</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--card 3-->
                    <div class="col">
                        <div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                            <div class="card-body p-0">
                                <div class="d-flex align-items-center justify-content-center">
                                    <img src="img/facebook.png" class="img-fluid contact-icon" alt="Icon 1">
                                    <div class="p-5">
                                        <h3 class="fw-bolder">Facebook: </h3>
                                        <h2><a href="#">Studium official</a></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>


        <jsp:include page="Footer.jsp"></jsp:include>       

    </body>
</html>
