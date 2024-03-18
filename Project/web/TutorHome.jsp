
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="img/Studium-icon.PNG">
        <link rel="stylesheet" href="css/homepage.css">
    </head>   
    <body>
        <script src="js/Menu.js"></script>
        ${id}
        <jsp:include page="Menu.jsp"></jsp:include>

            <section clas="py-4" style="background-color: #ebf9fc">
                <div class="container px-4">
                    <div class="row gx-5 align-items-center">
                        <div class="col-md-4">
                            <img src="img/TutorHomeImg.png" class="img-fluid" alt="image">
                        </div>
                        <div class="col-md-7">
                            <div class="text-center px-2">
                                <h3 class="fw-bolder"><span class="d-inline">Gia tăng thu nhập bằng kiến thức và kỹ năng giảng dạy của bạn</span></h3>
                                <p>Trải nghiệm nền tảng kết nối gia sư - phụ huynh chuyên nghiệp và nhanh chóng!</p>
                            <c:if test="${sessionScope.userObj.role != 2}">
                                <a class="btn btn-outline-primary rounded-0">Đăng ký tài khoản!</a>
                            </c:if>
                            <a class="btn btn-outline-primary rounded-0">Xem danh sách lớp</a>
                            <c:if test="${sessionScope.userObj.role == 2}">
                                <a class="btn btn-outline-primary rounded-0">Quản lý yêu cầu</a>
                                <a class="btn btn-outline-primary rounded-0">Lớp của tôi</a>
                                <a class="btn btn-outline-primary rounded-0">Gia sư cần biết</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container timeline">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="text-center px-2">
                            <h3 class="fw-bolder mt-2 mb-4"><span class="d-inline">Để nhận lớp</span></h3>
                        </div>
                        <div class="step-group">
                            <div class="step-item pb-2">
                                <span class="icon-number">1</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Tìm lớp phù hợp</h3>
                                    <p>Studium liên tục cập nhật lớp mới với đa dạng các môn học. Hãy sử dụng công cụ tìm kiế hoặc bộ lọc để dễ dàng lựa chọn lớp phù hợp</p>
                                </div>
                            </div>

                            <div class="step-item pb-2">
                                <span class="icon-number">2</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Tạo yêu cầu nhận lớp</h3>
                                    <p>Sau khi đã xem chi tiết lớp, hãy ấn vào nút [Đăng ký nhận lớp]. Bạn sẽ được trung tâm liên hệ khi yêu cầu nhận lớp được xét duyệt</p>
                                </div>
                            </div>

                            <div class="step-item pb-2">
                                <span class="icon-number">3</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Đợi phản hồi từ trung tâm.</h3>
                                    <p>Sau khi các thủ tục hoàn thành bạn sẽ có thể xem địa chỉ của lớp và thông tin liên lạc của phụ huynh.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-1"></div>

                    <div class="col-lg-5">
                        <div class="text-center px-2">
                            <h3 class="fw-bolder mt-2 mb-4"><span class="d-inline">Để được thuê dạy</span></h3>
                        </div>
                        <div class="step-group">
                            <div class="step-item pb-2">
                                <span class="icon-number">1</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Hoàn thiện hô sơ gia sư</h3>
                                    <p>Hãy chuẩn bị một hồ sơ thật đầy đủ bằng cách đăng ảnh đại diện rõ ràng, giới thiệu về kỹ năng cũng như những thành tích mà bạn đạt được để nâng cao khả năng được thuê dạy.</p>
                                </div>
                            </div>

                            <div class="step-item pb-2">
                                <span class="icon-number">2</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Xem yêu cầu thuê gia sư</h3>
                                    <p>Hãy để ý thông báo ở mục yêu cầu thuê gia sư. Nếu có yêu cầu thuê, bạn có thể xem nội dung lớp và quyết định hoặc hủy yêu cầu</p>
                                </div>
                            </div>

                            <div class="step-item pb-2">
                                <span class="icon-number">3</span>
                                <div class="step-ct">
                                    <h3 class="h5 mb-3">Đợi phản hồi từ trung tâm.</h3>
                                    <p>Sau khi bạn chấp nhận yêu cầu, trung tâm sẽ liên lạc với bạn sớm nhất có thể để trao đổi về những thủ tục cần thiết.</p>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>


        <section class="bg-light py-3">
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
            </div>
        </section>

        <section class="bg py-4 mt-2">
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

        <script>
            $(document).ready(function showTutorDoc() {
                document.getElementById("tutorDocument").classList.remove('d-none');
            });
        </script>

    </body>
</html>
