                 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyFvF1C5g5y1lCfDQGciPTrFbCuR2Zfa" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/class.css">
        <link rel="stylesheet" href="css/manageclass.css">
        <link rel="stylesheet" href="css/ClassDetail.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <h1 style="text-align: center">Quản lý lớp học của tài khoản: ${userObj.userName} </h1>
        <div class="container">           
            <div class="row" style="padding:10px;padding-left: 60px;padding-right: 60px;border: 1px solid;margin-bottom: 10px;">
                <div class="col-md-12">         
                    <form action="EditClassByAdmin" method="post" id="editForm">

                        <div>
                            <br>                          
                            <h2>Mã lớp: ${cl.classID}</h2><br>
                            <p style="color: #198754 " > <b>Ngày tạo lớp: ${cl.openDate} </b>  <p>
                            <p>Tình trạng: 
                                <c:choose>
                                    <c:when test="${cl.isApproved}">
                                        <span style="color: #198754"> Đã xét duyệt <i class="fas fa-check"></i></span>
                                        </c:when>
                                        <c:when test="${!cl.isApproved}">
                                        <span style="color: #dc3545;"> Đang chờ xét duyệt <i class="fas fa-pen-square"></i></span>
                                        </c:when>
                                        <c:otherwise>
                                        (Không xác định)
                                    </c:otherwise>
                                </c:choose></p>
                            <br>
                            <div>            
                                <ul class="den" style="list-style-type: none; margin-left: -30px;margin-bottom: 2px;" >
                                    <li><p class="mb-2 "><i class="fas fa-book mb-2 icon"></i><b> Môn học: 
                                                <select name="subject" style="height: 29.2px">
                                                    <c:forEach items="${Subject}" var="sj">
                                                        <c:choose>
                                                            <c:when test="${cl.subjectID == sj.subjectID}">
                                                                <option value="${sj.subjectID}" selected>${sj.subjectName}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${sj.subjectID}">${sj.subjectName}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select ></b></p></li>
                                    <input style="display: none" value="${cl.classID}" name="classid" >
                                    <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ: <input required="" id="myInput" style="width: 100%" type="text" name="address" value="${cl.actualAddress}" maxlength="255"></p> 
                                        <!--                                        <i class="fas fa-map-marker-alt mb-2 icon"></i> Tỉnh thành (Quận/ Huyện quanh Hà Nội): 
                                                                                <select name="location" id="locationSelect" >
                                                                                    <option value="">Khu vực</option>
                                        <c:forEach items="${Location}" var="ll">
                                            <option value="${ll.locationName}">${ll.locationName}</option>
                                        </c:forEach>
                                    </select>-->
                                    </li>
                                    <script>
                                        document.getElementById('locationSelect').onchange = function () {
                                            var selectedValue = this.value;
                                            if (selectedValue === '' || selectedValue === 'Khu vực') {
                                                alert('Vui lòng chọn một quận hoặc huyện.');
                                                // Hoặc bạn có thể thực hiện các hành động khác ở đây.
                                            }
                                        };
                                    </script>
                                    <li><p class="mb-2 "><i class="fas fa-map-marker-alt mb-2 icon"></i> Địa chỉ hiển thị: <input required="" id="myInput" style="width: 100%" type="text" name="addresspublic" value="${cl.publicAddress}" maxlength="255" required=""></p></li>
                                    <li><p class="mb-2">Link bản đồ: <input id="myInput" style="width: 100%; margin-bottom: 10px" type="text" name="linkmap" value="" required="">${cl.map}</p></li>
                                    <li><p class="mb-2 "><i class="fas fa-dollar-sign mb-2 icon "></i> Lương: <input type="number" min="0" max="2000000000" pattern="[1-9]\d*" step="10000" style="width: 20%" name="payperses" value="${cl.payPerSession}"  required=""> ₫/buổi, 
                                            <input style="width: 10%" type="number" max="21" min="1" step="1" pattern="[1-9]\d*" required="" name="sesperweek" value="${cl.sesPerWeek}"> buổi/tuần, 

                                            <input style="width: 10%" type="number" name="timeperses" value="${cl.timeS}" pattern="[1-9]\d*" max="60" min="10" step="1" required=""> phút/buổi</p></li>
                                    <li><p class="mb-2 "><i class="fas fa-bookmark mb-2 icon"></i> Yêu cầu: 
                                            <select name="tutoredlevel" style="height: 29.2px">
                                                <c:choose>
                                                    <c:when test="${cl.tutorEdlevel eq 1}">
                                                        <option value="1" selected>Sinh Viên</option>
                                                        <option value="2">Giáo viên</option>
                                                        <option value="3" >Đã tốt nghiệp</option>
                                                        <option value="4">Bất kì</option>
                                                    </c:when>
                                                    <c:when test="${cl.tutorEdlevel eq 2}">
                                                        <option value="1" >Sinh Viên</option>
                                                        <option value="2" selected>Giáo viên</option>
                                                        <option value="3" >Đã tốt nghiệp</option>
                                                        <option value="4" >Bất kì</option>

                                                    </c:when>
                                                    <c:when test="${cl.tutorEdlevel eq 3}">
                                                        <option value="1" >Sinh Viên</option>
                                                        <option value="2" >Giáo viên</option>
                                                        <option value="3" selected>Đã tốt nghiệp</option>
                                                        <option value="4" >Bất kì</option>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1" >Sinh Viên</option>
                                                        <option value="2" >Giáo viên</option>
                                                        <option value="3" >Đã tốt nghiệp</option>
                                                        <option value="4" selected>Bất kì</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select >
                                            Giới tính gia sư:  
                                            <select name="tutorgender" style="height: 29.2px">
                                                <c:choose>
                                                    <c:when test="${cl.tutorGender eq 1}">
                                                        <option value="1" selected>Nam</option>
                                                        <option value="2" >Nữ</option>
                                                        <option value="3" >Nam/Nữ</option>
                                                    </c:when>
                                                    <c:when test="${cl.tutorGender eq 0}">
                                                        <option value="1" >Nam</option>
                                                        <option value="2" selected>Nữ</option>
                                                        <option value="3" >Nam/Nữ</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1" >Nam</option>
                                                        <option value="2" >Nữ</option>
                                                        <option value="3" selected>Nam/Nữ</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </p></li>
                                </ul >
                                <p class="mb-2 den"><i class="fas fa-clock icon"></i> Thời gian có thể học:</p>
                                <table>                                       
                                    <tbody>
                                        <tr>
                                            <c:forEach items="${day}" var="day">
                                                <td >
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
                                                            <th class="selected-time" style="border: 1px solid black; width: 30px; height: 30px; text-align: center" onclick="addFreeScheduleList(this)">
                                                                ${s.time}
                                                                <input type="hidden" value="${s.id}" class="timeID"> 
                                                                <input type="hidden" value="${cl.classID}" class="classID"> 
                                                            </th>
                                                        </c:if >
                                                        <c:if test="${!FreeScheduleClass.contains(s.id)}">
                                                            <th class="hour" style="border: 1px solid black; width: 30px; height: 30px; text-align: center" onclick="addFreeScheduleList(this)">
                                                                ${s.time}
                                                                <input type="hidden" value="${s.id}" class="timeID"> 
                                                                <input type="hidden" value="${cl.classID}" class="classID"> 
                                                            </th>
                                                        </c:if>
                                                    </c:if>         
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <script src="js/Hung.js"></script>

                                <p style="display:none ">Thời gian đã chọn: <span id="selectedFreeSchecduleDisplay" name="time" ></span></p>
                                <p style="display: none">Thời gian đã xóa: <span id="selectedFreeSchecduleDisplayd" name="timedelete" ></span></p>     
                                <br>
                                <h6 class="den">Đặc điểm học sinh: </h6>
                                <a href="EditClass.jsp"></a>
                                <br>
                                <ul class="den" style="list-style-type: none; margin-left: -30px;margin-bottom: 2px;">
                                    <li><p class="mb-2 "><i class="fas fa-users"></i> Số lượng học sinh: <b><input type="number" style="width: 20%" min="1" max="1000" step="1" name="studentnum" required="" value="${cl.studentNum}" pattern="[1-9]\d*"></b></p></li>
                                    <li><p class="mb-2 "><i class="fas fa-user icon"></i> Mô tả rõ hơn về lớp hoặc yêu cầu về gia sư cần tìm: <textarea style="width: 100%;height: 150px" name="classdescription" maxlength="2000" required="">${cl.classDescription}</textarea></p></li>
                                </ul>                                   
                            </div>
                        </div>

                        <input id="time"  type="hidden" value="" name="timemain">
                        <input id="timedelete" type="hidden"  value="" name="timedeletemain">
                        <input type="hidden" value="${cl.classID}" name="classID">
                        <c:if test="${ approved != null}">
                            <input type="hidden" value="oke" name="approved" id ="approved">
                            <button type="submit" class="btn btn-success" ><i class="fas fa-pen"></i> Đồng ý xét duyệt</button>
                            <a type="button" href="ClassList?cancel=1&detail=1&xd=1&id=${cl.classID}" class="btn btn-danger" ><i class="fas fa-pen"></i> Hủy</a>
                        </c:if>
                        <c:if test="${cl.isApproved && approved == null}">
                            <button type=submit" class="btn btn-success"  ><i class="fas fa-pen"></i> Đồng ý chỉnh sửa </button>
                        </c:if>
                    </form>
<!--                    <script>
                        function confirmAndSubmit() {
                            if (confirm("Bạn có chắc chắn muốn tiếp tục không?")) {
                                if (checkFreeSBeforeSubmit()) {
                                    document.getElementById("editForm").submit();
                                }
                            }
                        }
                    </script>-->

                </div>
                <input id="taikhoan" type="hidden" value="${Account.id}">           
            </div>
        </div>
        <br>     
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>
