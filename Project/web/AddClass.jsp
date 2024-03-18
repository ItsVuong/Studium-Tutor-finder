<%-- 
    Document   : AddClass
    Created on : 16 Feb 2024, 22:01:42
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Class</title>
        <link rel="stylesheet" href="css/manageclass.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="C:\FPTU\Studium\SWP391\Project\web\css\Description.css">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container d-flex justify-content-center align-items-center" style="margin-top: 50px ; padding-bottom: 50px">
                <div style="padding: 0 300px">
                    <div class="d-flex justify-content-center align-items-center">
                        <h1>Đơn đăng kí lớp</h1>
                    </div>
                    <div class="container d-flex justify-content-center align-items-center" style="background-color: whitesmoke">
                        <form action="addClass" method="post" class="row g-3">
                            <div class="col-md-8">
                                <label for="inputEmail4" class="form-label">Học Phí</label>
                                <input type="number" placeholder="Bao nhiêu VNĐ cho 1 buổi, VD:(450000VNĐ)" class="form-control" id="inputEmail4" name="payPerSes" required="">
                            </div>
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Buổi/Tuần</label>
                                <input type="number" placeholder="VD(3 buổi)" class="form-control" id="inputEmail4" name="sessPerWeek" required="">
                            </div>
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label"> Thời gian mỗi buổi học (phút)</label>
                                <input type="number" placeholder="Bao nhiêu phút 1 buổi, VD:(120p/1 buổi)" class="form-control" id="inputEmail4" name="timeS" required="">
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Số Lượng Học Sinh</label>
                                <input type="number" placeholder="VD: 3 học sinh/1 lớp" class="form-control" id="inputEmail4" name="studentNum" required="">
                            </div>
<!--                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Ngày mở lớp</label>
                                <input type="date" class="form-control" id="inputPassword4" name="openDate" required="">
                            </div>-->
                            <div class="col-12">
                                <label for="inputAddress" class="form-label">Địa chỉ</label>
                                <input type="text" placeholder="VD: số nhà 24 Phạm Văn Đồng ngõ 2/84 Hoàng Văn Thụ, Phường Tân Sơn, Thành Phố Hà Nội " class="form-control" id="inputAddress" name="actualAddress" required>
                            </div>
                            <br>
                            <div class="col-md-12">
                                <label for="inputCity" class="form-label">Mô tả lớp và gia sư cần tìm</label>
                                <textarea placeholder="Bạn yêu cầu gia sư như nào và tính cách cũng như việc bạn cần cải thiện người học ra sao?" class="form-control" id="description" name="classDescription" style="width: 800px; height: 200px; white-space: pre-wrap;" required></textarea>
                            </div>

                            <div class="col-md-12">
                                <label for="inputCity" class="form-label">Yêu cầu trình độ gia sư</label>
                                <select name="tutorEdlevel" id="inputState" title="Chọn trình độ gia sư" class="form-select" required="">
                                    <option>--Chọn trình độ gia sư bạn muốn--</option>
                                    <option value ="1">Sinh viên</option>
                                    <option value="2"> Giáo viên</option>
                                    <option value="3">Không quan trọng yêu cầu</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="inputState" class="form-label">Yêu cầu Giới tính Gia sư</label>
                                <select name="tutorGender" placeholder="Giới Tính" id="inputState" class="form-select" required="">
                                    <option style="align-content: center">--Chọn giới tính gia sư bạn muốn--</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                    <option value ="3">Không quan trọng giới tính</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="inputState" class="form-label">Môn Học</label>
                                <select name="subjectID" placeholder="Giới Tính" id="inputState" class="form-select" required="">
                                    <option>--Chọn môn học bạn cần--</option>
                                <c:forEach items="${requestScope.list}" var="item">

                                    <option value="${item.subjectID}">${item.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div><b>Thời gian có thể học: </b></div>
                        <div>
                            <table>                                       
                                <tbody>
                                    <tr>
                                        <c:forEach items="${day}" var="day">
                                            <td style="width: 80px">
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
                        </div>
                        <!--truyền vào thời gian để thêm vào DB-->

                        <p style="display: none">Thời gian đã chọn: <span id="selectedFreeSchecduleDisplay" name="time" ></span></p>
                        <p style="display: none">Thời gian đã xóa: <span id="selectedFreeSchecduleDisplayd" name="timedelete" ></span></p>
                        <input id="time"  type="text" value="" name="timemain" style="display: none">
                        <input id="timedelete" type="text"  value="" name="timedeletemain"style="display: none">


                        <script src="js/Hung.js"></script>
                        <p><b>* Thời gian được hiển thị từ 0h đến 23h</b></p>
                        
                        <div class="container d-flex justify-content-center align-items-center">
                            <button type="submit" class="btn btn-primary" style=" background-color: #0dcaf0; color: #ffffff" >Tạo Lớp</button>                           
                        </div>

                    </form>
                    <!-- Script for validation -->
                    <script>
                                                            function validateForm() {
                                                                // Get form values
                                                                var username = document.getElementById('username').value;

                                                                // Validate username (add your own validation logic)
                                                                if (username.trim() === '') {
                                                                    document.getElementById('usernameError').innerText = 'Username is required!';
                                                                    return false; // Prevent form submission
                                                                } else {

                                                                    document.getElementById('usernameError').innerText = ''; // Clear any previous error
                                                                    return true; // Allow form submission
                                                                }
                                                            }
                    </script>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
