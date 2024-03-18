<%-- 
    Document   : ManageClass
    Created on : Jan 29, 2024, 3:25:45 PM
    Author     : mim
--%>
<%@page import="DAL.*"%>
<%@page import="Models.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
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
            <div class="Container">
                <br>
                <h2 style="text-align: center;color:  #0080ff ">Xử lý yêu cầu của ${Tutor.fullName} ( <c:if test="${Tutor.role == 2}">Gia sư</c:if> )</h2>
                <br>
                <div class="row justify-content-center">       
                    <div class="col-md-5">
                        <div style="text-align: center;">
                            <h4 style="color: white;
                                background-color: #0080ff;
                                padding: 10px;
                                border-radius: 10px;
                                margin: 10px;
                                border: 1px solid; ">Bên Gia sư</h4></div>
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="account-settings">
                                            <div class="user-profile">
                                                <div class="user-avatar">
                                                    <img src="img/${Tutor.profilePic}" alt="${Tutor.getProfilePic()}'s IMG">
                                                <input type="hidden" name="img" value="${Tutor.profilePic}">
                                            </div>

                                            <a target="_blank" href="viewacc?username=${Tutor.userName}&role=${Tutor.role}" class="btn" style="background-color: #92a2b6; color:white">Thông tin gia sư</a>
                                        </div>
                                    </div>    
                                </div>     
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card h-100"">
                                <div class="card-body">
                                    <div class="row gutters">                                     
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Full Name</label>
                                                <input type="text" class="form-control" name="fullname" readonly value="${Tutor.getFullName()}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>UserName</label>
                                                <input type="text" class="form-control" name="username" readonly value="${Tutor.userName}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" name="email" readonly value="${Tutor.email}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" name="phone" readonly value="${Tutor.phone}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div style="text-align: center;"><h4 style="color: white;
                                                         background-color: #ff9600;
                                                         padding: 10px;
                                                         border-radius: 10px;
                                                         margin: 10px;
                                                         border: 1px solid; ">Bên Phụ huynh</h4></div>
                    <div class="row justify-content-center">
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="account-settings">
                                        <div class="user-profile">
                                            <div class="user-avatar">
                                                <img src="img/${Parent.profilePic}" alt="${Parent.getProfilePic()}'s IMG">
                                                <input type="hidden" name="img" value="${Parent.profilePic}">
                                            </div>
                                            <a target="_blank" href="ClassList?detail=1&xd=0&id=${ClassId}" class="btn" style="background-color: #92a2b6; color:white">Thông tin lớp (ID:${ClassId})</a>
                                        </div>
                                    </div>    
                                </div>     
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card h-100"">
                                <div class="card-body">
                                    <div class="row gutters">                                     
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Full Name</label>
                                                <input type="text" class="form-control" name="fullname" readonly value="${Parent.getFullName()}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>UserName</label>
                                                <input type="text" class="form-control" name="username" readonly value="${Parent.userName}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" name="email" readonly value="${Parent.email}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" name="phone" readonly value="${Parent.phone}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>
        <div style="text-align: center; ">
            <br>
            <c:if test="${id == 0}"><h3 style="color: red">QUY TRÌNH XỬ LÝ YÊU CẦU CỦA GIA SƯ</h3></c:if>
            <c:if test="${id == 1}"><h3 style="color: red">QUY TRÌNH XỬ LÝ YÊU CẦU CỦA PHỤ HUYNH</h3></c:if>
                <br>
            </div>
            <div class="Container">
                <div clas="row justify-content-center" style="padding-left: 190px;padding-right: 190px">
                    <ul style="list-style-type: none" class="den">
                        <li><p><b>Bước 1:</b> Kiểm tra lại thông tin của gia sư, phụ huynh và lớp học xem có mục nào chưa hợp lý hay không.</p></li>
                    <c:if test="${requestId == 0}"><li><p><b>Bước 2:</b> Liên hệ với phụ huynh thông qua <b>số điện thoại</b> để thông báo có gia sư muốn nhận lớp, đưa thông tin gia sư cho họ ( bảo họ vào trang gia sư hoặc bạn đọc cho họ ) ( yêu cầu phụ huynh trả lời <span style="color: #198754">chấp nhận</span> hoặc <span style="color: red">từ chối</span> ).</p></li></c:if>
                    <c:if test="${requestId == 1}"><li><p><b>Bước 2:</b> Liên hệ với gia sư thông qua <b>số điện thoại</b> để thông báo có phụ huynh muốn thuê bạn dạy, đưa thông tin lớp cho họ ( bảo họ vào trang gia sư hoặc bạn đọc cho họ ) ( yêu cầu gia sư trả lời <span style="color: #198754">chấp nhận</span> hoặc <span style="color: red">từ chối</span> ).</p></li></c:if>
                    <c:if test="${requestId == 0}"><li><p><b>Bước 3:</b> Chọn một trong những lựa chọn sau ( Dựa theo câu trả lời của phụ huynh) : </c:if>
                    <c:if test="${requestId == 1}"><li><p><b>Bước 3:</b> Chọn một trong những lựa chọn sau ( Dựa theo câu trả lời của gia sư) : </c:if>
                            <form method="post" action="HandleRequest">
                                <input type="text" value="1" name="disagree" style="display: none">
                                <input type="text" value="${ClassId}" name="classid" style="display: none">
                            <input type="text" value="${Tutor.id}" name="tutorid" style="display: none">
                            <input type="text" value="${id}" name="id" style="display: none">
                            <a style="width:120px" onclick="toggleDisplay()" class="btn btn-success"> Chấp nhận </a> 
                            <button type="submit" style="width:120px" class="btn btn-danger"> Từ chối</button>
                        </form> </p></li>
                    <c:if test="${requestId == 1}"><li><p><b>Bước 4:</b> Liên hệ với phụ huynh để thông báo gia sư chấp nhận hay từ chối.</b></p></li></c:if>
                    <c:if test="${requestId == 0}"><li><p><b>Bước 4:</b> Liên hệ với gia sư để thông báo phụ huynh chấp nhận hay từ chối.</b></p></li></c:if>    
                    </ul> 
                    <ul id="myElement" style="display:none ;list-style-type: none" class="den">
                        <li><p><b>Bước 5:</b> Liên hệ với gia sư để tạo hợp đồng online ( bạn điền thông tin vào hợp đồng mẫu bên dưới ) hoặc offline ( Địa chỉ: đại học <b> FPT hòa lạc, Al-203R</b> )</p></li>
                        <li><b>Mẫu hợp đồng</b> ( vui lòng tạo bản copy để sửa thông tin, khi xong thì tải về dưới dạng PDF gửi cho gia sư qua <b>email</b> ) : <a target="_blank"a href="https://docs.google.com/document/d/11irNCCSVWCgGQUEQaQ_kq61HBVncmG6SeupdoKaZvwA/edit">Hợp đồng mẫu</a></li>
                        <li><p><b>Bước 6:</b> Yêu cầu gia sư thanh toán tiền cọc như trong hợp đồng ( <b>20% thu nhập tháng đầu tiên</b> ) : <b>${Fee}₫</b> ( Tổng thu nhập: <b>${Outcome}₫</b>  ) (ID lớp: <b>${ ClassId}</b> )</p>
                    <li><b><span style="color: red">Lưu ý: Gia sư có thời hạn 2 ngày để thanh toán tiền cọc.</span></b></li>
                    <li><p><b>Bước 7:</b> Điền biểu mẫu bên dưới
                        <form action="HandleRequest" method="post" style="width: 80%">
                            <input type="text" value="1" name="agree" style="display: none">
                            <input type="text" value="${id}" name="id" style="display: none">
                            <div class="form-group den" ><label><h6>Thời gian dạy thử:</h6></label> <input type="date" name="dateEndTrial" value="3/11/2024" required=""></div>
                            <div class="form-group den" style="padding-top: 10px"><label><h6> Link file hợp đồng:</h6></label>  <input type="text" name="contractLink" value="" required=""></div>
                            Cách điền link file hợp đồng: khi bạn đã viết xong hợp đồng chuyển nó về file PDF và upload lên drive của web ( <a target="_blank" href="https://drive.google.com/drive/folders/1bKpb1GoEPSJVw2vkxAbzoXqcgWgvg5tX?usp=drive_link">Drive</a> ) sau đó copy link chia sẻ để là chỉ được xem.                                
                            <br>
                            <button type="submit" style="margin-top: 10px" class="btn btn-success">Xác nhận</button>
                        </form>
                    </li>
                </ul>

            </div>
        </div>
        <script>
            function toggleDisplay() {
                var element = document.getElementById("myElement");

                // Kiểm tra trạng thái hiện tại của display và đảo ngược nó
                if (element.style.display === "none") {
                    element.style.display = "block";
                } else {
                    element.style.display = "none";
                }
            }
        </script>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src=js/Hung.js"></script>
</html>
