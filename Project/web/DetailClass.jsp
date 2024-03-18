<%-- 
    Document   : Class
    Created on : Jan 18, 2024, 3:17:45 PM
    Author     : mim
--%>

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
        <link rel="stylesheet" href="css/ClassDetail.css">
        <link rel="stylesheet" href="css/manageclass.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container" ">
                <div class="row" style="padding-left: 60px;padding-right: 60px" >
                    <div class="col-md-7">                        
                        <div>
                            <div><p><a href="Home.jsp"><i class="fas fa-house-user m-1"></i></a> / <a href="ClassList" class="m-1"> Lớp học </a> / Mã lớp ${ClassList.classID}</p></div>
                        <h2>Chi tiết lớp có mã lớp ${ClassList.classID}</h2><br>
                        <c:if test="${userObj.role == 1&&xd==0}"><a href="EditClass?classid=${ClassList.classID}"><button type="button" class="btn btn-warning " >
                                    Chỉnh sửa
                                </button></a>
                            <br>
                        </c:if>
                        <c:if test="${userObj.role == 1&&xd==1}">
                            <button type="button" class="btn btn-success" style="border: 1px solid" onclick="confirmApproval(${ClassList.classID})">
                                Đồng ý xét duyệt
                            </button>
                            <button type="button" class="btn btn-danger" style="border: 1px solid" onclick="confirmDeApproval(${ClassList.classID})">
                                Từ chối xét duyệt
                            </button>
                            <br>
                        </c:if>
                        <script>
                            function confirmApproval(classID, publicAddress) {
                                var encodedApproved = encodeURIComponent('oke');
                                var confirmation = confirm("Bạn có chắc chắn muốn xét duyệt yêu cầu này không?");
                                if (confirmation) {
                                    window.location.href = 'EditClass?approved=1&classid=${ClassList.classID}';
                                }
                            }
                             function confirmDeApproval(classID, publicAddress) {
                                var encodedApproved = encodeURIComponent('oke');
                                var confirmation = confirm("Bạn có chắc chắn muốn từ chối xét duyệt không?");
                                if (confirmation) {
                                    window.location.href = 'EditClass?approved=2&classid=${ClassList.classID}';
                                }
                            }
                        </script>
                        <c:if test="${userObj.role == 1}">
                            <br>
                        </c:if> 
                        <c:if test="${ userObj.role == 1 }">
                            <p style="color: #198754 " > <b>Ngày tạo lớp: ${ClassList.openDate} </b>  <p>
                            </c:if>
                        <p>Tình trạng: 
                            <c:choose>
                                <c:when test="${ClassList.classStatus eq 1&&!ClassList.isApproved}">
                                    <span style="color: #dc3545;"> Lớp đang chờ duyệt <i class="fas fa-pen-square"></i></span>
                                    </c:when>
                                    <c:when test="${ClassList.classStatus eq 0}">
                                    <span style="color: #dc3545;">  Lớp bị hủy<i class="fas fa-xmark"></i></span>
                                    </c:when>
                                    <c:when test="${ClassList.classStatus eq 1 && ClassList.isApproved}">
                                    <span style="color: #198754"> Lớp đang chờ gia sư nhận <i class="fas fa-check"></i></span>
                                    </c:when>
                                    <c:otherwise>
                                    (Không xác định)
                                </c:otherwise>
                            </c:choose></p>
                        <br>
                        <div >
                            <ul class="den" style="list-style-type: none; margin-left: -30px;margin-bottom: 2px;" >
                                <li><p class="mb-2 "><i class="fas fa-book mb-2 icon"></i><b> Môn học: ${ClassList.subject}</b></p></li>
                                <c:if test = "${ClassList.parentID == userObj.id || userObj.role==1}">
                                <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ: ${ClassList.actualAddress}</p></li>
                                </c:if>
                                <c:if test = "${ClassList.parentID != userObj.id}">
                                <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ: ${ClassList.publicAddress}</p></li>
                                </c:if>
                                <li><p class="mb-2 "><i class="fas fa-dollar-sign mb-2 icon "></i> Lương: ${payPerSes} ₫/buổi, ${ClassList.sesPerWeek} buổi/tuần, ${ClassList.timeS} phút/buổi</p></li>
                                <li><p class="mb-2 "><i class="fas fa-bookmark mb-2 icon"></i> Yêu cầu:                      
                                        <c:choose>
                                            <c:when test="${ClassList.tutorEdlevel eq 1}">
                                                Sinh Viên
                                            </c:when>
                                            <c:when test="${ClassList.tutorEdlevel eq 2}">
                                                Giáo Viên
                                            </c:when>
                                            <c:otherwise>
                                                (Không xác định)
                                            </c:otherwise>
                                        </c:choose>
                                        <b>
                                            <c:choose>
                                                <c:when test="${ClassList.tutorGender eq 1}">
                                                    ( Nam )
                                                </c:when>
                                                <c:when test="${ClassList.tutorGender eq 0}">
                                                    ( Nữ )
                                                </c:when>

                                                <c:otherwise>
                                                    ( Nam/Nữ )
                                                </c:otherwise>
                                            </c:choose>
                                        </b>
                                    </p></li>
<!--                                <li><p>${cl.checkDate}<p></li> -->                             
                            </ul >
                            <br>
                            <h6 class="den">Đặc điểm học sinh: </h6>
                            <br>
                            <ul class="den" style="list-style-type: none; margin-left: -30px;margin-bottom: 2px;">
                                <li><p class="mb-2 "><i class="fas fa-users"></i> Số lượng học sinh: <b>${ClassList.studentNum}</b></p></li>
                                <li><p class="mb-2 "><i class="fas fa-user icon"></i> Chi tiết: ${ClassList.classDescription} </p></li>
                            </ul>
                            <br>
                            <p class="den"><i class="fas fa-clock icon"></i> Thời gian có thể học: </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-5" style="padding-top: 20px;margin-top: 50px" >
                    ${ClassList.map}
                    Lưu ý: bản đồ thể hiện địa chỉ lớp học một cách tương đối.
                </div>
                <div class="col-md-12"> 
                    <table>                                       
                        <tbody>
                            <tr>
                                <c:forEach items="${day}" var="day">
                                    <td class = "den" style="width:90px">
                                        <c:choose>
                                            <c:when test="${day.equals('Thứ 2')}">Thứ 2: </c:when>
                                            <c:when test="${day.equals('Thứ 3')}">Thứ 3: </c:when>
                                            <c:when test="${day.equals('Thứ 4')}">Thứ 4: </c:when>
                                            <c:when test="${day.equals('Thứ 5')}">Thứ 5: </c:when>
                                            <c:when test="${day.equals('Thứ 6')}">Thứ 6: </c:when>
                                            <c:when test="${day.equals('Thứ 7')}">Thứ 7: </c:when>
                                            <c:when test="${day.equals('Chủ nhật')}">Chủ Nhật: </c:when>
                                        </c:choose>
                                    </td>
                                    <c:forEach items="${Schedule}" var="s">
                                        <c:if test="${s.day.equals(day)}">
                                            <c:if test="${FreeScheduleClass.contains(s.id)}">
                                                <th class="selected-time" style="border: 1px solid black; width: 30px; height: 30px; text-align: center" onclick="totalBill(this)">
                                                    ${s.time}                 
                                                </th>
                                            </c:if >
                                            <c:if test="${!FreeScheduleClass.contains(s.id)}">
                                                <th class="hour" style="border: 1px solid black; width: 30px; height: 30px; text-align: center" onclick="totalBill(this)">
                                                    ${s.time}
                                                </th>
                                            </c:if>
                                        </c:if>         
                                    </c:forEach>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <p><b>* Thời gian được hiển thị từ 0h đến 23h</b></p>                       
                <hr>
                <c:if test="${userObj.role != 1}">
                    <p class="den">Mức thu nhập: <b>${outcome} ₫/Tháng</b></p>

                    <div class="row mt-3" style="width: 75%">
<<<<<<< HEAD
                        <c:if test="${userObj.role != 3}">
                        <a href="login?fromclass=ClassList?detail=1&id=${ClassList.classID}" class="btn" <c:if test="${userObj.role == 2}"> data-toggle="modal" data-target="#largeModal" </c:if>
                           style="color: white;background-color: #f36c29;line-height: 40px;text-align: center;width: 230px" rel="nofollow">
                                Đăng kí nhận lớp ngay
                            </a>
                           </c:if>
                        </div> 
                        <br>
                        <p style="margin-top: 20px" class="den">Phí nhận lớp: <b>40%</b> | Chỉ nộp phí 1 lần, những tháng tiếp theo sẽ không mất phí</p>
=======
                        <a href="#" class="btn"style="color: white;background-color: #f36c29;line-height: 40px;text-align: center;width: 230px" rel="nofollow">Đăng kí nhận lớp ngay</a>
                    </div> 
                    <br>
                    <p style="margin-top: 20px" class="den">Phí nhận lớp: <b>20%</b> | Chỉ nộp phí 1 lần, những tháng tiếp theo sẽ không mất phí</p>
>>>>>>> hung
                </c:if>
                <c:if test="${OwnerClass != null && userObj.role == 1 }">
                    <h6>Thông tin người tạo lớp: </h6>
                    <table class="table user-list">
                        <thead>
                            <tr style="text-align: center">
                                <th><span>Avatar</span></th>
                                <th><span>UserName</span></th>
                                <th><span>Full Name</span></th>
                                <th><span>Last Login</span></th>
                                <th><span>Phone</span></th>
                                <th><span>Email</span></th>
                                <th><span>Xem Thêm</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <img style="width: 75px" src="img/${OwnerClass.profilePic}" alt="">

                                    <c:if test="${OwnerClass.role == 1}">
                                        <span class="user-subhead">Admin</span>
                                    </c:if>
                                    <c:if test="${OwnerClass.role == 2}">
                                        <span class="user-subhead">Tutor</span>
                                    </c:if>
                                    <c:if test="${OwnerClass.role == 3}">
                                        <span class="user-subhead">Parent</span>
                                    </c:if>
                                </td>
                                <td><a  style="margin-left: 50px"href="#" class="highlight-text highlight-search" data-text="${OwnerClass.userName}">
                                        ${OwnerClass.userName}  
                                    </a></td>
                                <td ><a style="margin-right: -40px" href="#" class="highlight-text highlight-search" data-text="${OwnerClass.userName}">
                                        ${OwnerClass.fullName}  
                                    </a></td>
                                <td class="text-center">
                                    <span class="">${OwnerClass.lastLogin}</span>
                                </td>
                                <td class="text-center">
                                    <span class="label label-default highlight-search" data-text="${OwnerClass.phone}">
                                        ${OwnerClass.phone}
                                    </span>
                                </td>

                                <td class="text-center">
                                    <a href="#" class="highlight-text highlight-search" data-text="${OwnerClass.email}">
                                        ${OwnerClass.email}
                                    </a>
                                </td>

                                <td style="width: 20%; text-align: center">

                                    <a href="viewacc?username=${OwnerClass.userName}&role=${OwnerClass.role}" class="table-link" title="Xem thông tin cá nhân">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
        <script src="js/main.js"></script>
        <jsp:include page="Footer.jsp"></jsp:include>

            <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" style="color: #729CFF; " id="myModalLabel">Yêu cầu nhận lớp</h4>
                        </div>
                        <div class="modal-body px-4">
                            <!--                            <h3>Modal Body</h3>-->
                            <ul class="den" style="list-style-type: none; margin-left: -30px;margin-bottom: 2px;" >
                                <li><p class="mb-2 "><i class="fas fa-book mb-2 icon"></i><b> Môn học: ${ClassList.subject}</b></p></li>
                            <c:if test="${ClassList.parentID != userObj.id}">
                            <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ: ${ClassList.publicAddress}</p></li>
                            </c:if>
                            <c:if test="${ClassList.parentID == userObj.id}">
                            <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ: ${ClassList.actualAddress}</p></li>
                            </c:if>
                        </ul>
                        <c:if test="${!tutor.isValidated}">
                            <div class="text-danger">Vui lòng hoàn thiện hồ sơ của bạn để nhận lớp. <a href="#" class="text-decoration-underline">Hoàn thiện hồ sơ!</a></div>
                        </c:if>
                        <c:if test="${tutor.isValidated}">
                            <div><span class="text-black fw-bold">Chú ý: </span>Sau khi nhận lớp, bạn sẽ được phía trung tâm liên hệ và trao đổi sớm nhất có thể. Để biết thêm thông tin chi tiết xin vui lòng đọc 
                                <a href="#" class="text-decoration-underline">Cách thức nhận lớp</a>
                            </div>
                            <div class="pt-4 ">Khi tạo yêu cầu đồng nghĩa bạn đã đồng ý với điều khoản (<a href="#" class="text-decoration-underline">xem hợp đồng mẫu</a>) của chúng tôi: </div>
                            <div class="form-check">
                                <label>
                                    <input id="termCheckbox" type="checkbox" class="form-check-input" name="agree" value="agree" onchange="activeForm()"/> <span class="text-decoration-underline">Tôi đã đọc và đồng ý với điều khoản.</span>
                                </label>
                            </div>
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary background" data-dismiss="modal">Hủy</button>
                        <button id="acceptButton" type="button" class="btn btn-primary text-white" disabled>Tạo yêu cầu</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function activeForm() {
                var checkbox = ${"termCheckbox"};
                if (checkbox.checked) {
            ${"acceptButton"}.removeAttribute('disabled');
                } else {
            ${"acceptButton"}.setAttribute('disabled', 'true');
                }
            }
        </script>
    </body>
</html>
