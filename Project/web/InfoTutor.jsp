<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Studium</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@100;600;800&display=swap" rel="stylesheet"> 

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/chosen.css">

        <link href="css/style.css" rel="stylesheet">
        <link href="css/info.css" rel="stylesheet">

    </head>

    <body onload="reloadImg('img/${tutor.idCard1}'); reloadImg('img/${tutor.idCard2}'); reloadImg('img/${tutor.profilePic}');" >
        <jsp:include page="Menu.jsp"></jsp:include> 

            <div class="container my-5">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="img/${userObj.profilePic}" alt="${userObj.getProfilePic()}'s IMG">
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
                            <h3 class="fw-bolder">Thông tin cơ bản</h3>
                            <hr class="mt-2 mb-3"/>
                            <form action="tutorprofile" method="post" enctype="multipart/form-data" id="tutorForm">

                                <div class="">
                                    <c:if test = "${tutor.isValidated}">
                                        <h6 class="mt-3 mb-2 text-primary">
                                            Trạng thái: <span style="color: green;">Đã được duyệt</span>
                                            <input type="hidden" name="tutorid" value="${tutor.tutorID}">
                                        </h6>
                                    </c:if>

                                    <c:if test = "${!tutor.isValidated and tutor!=null}">
                                        <c:if test = "${tutor.isRejected}">
                                            <h6 class="mt-3 mb-2 text-primary">
                                                Trạng thái: <span style="color: red;">Hồ sơ của bạn bị từ chối. Xin vui lòng kiểm tra lại thông tin.</span>
                                            </h6>
                                        </c:if> 
                                        <c:if test = "${!tutor.isRejected}">
                                            <h6 class="mt-3 mb-2 text-primary">
                                                Trạng thái: <span style="color: red;">Hồ sơ của bạn đang đợi xét duyệt</span>
                                            </h6>
                                        </c:if> 
                                    </c:if>    

                                    <c:if test = "${tutor==null}">
                                        <h6 class="mt-3 mb-2 text-primary">
                                            Trạng thái: <span class="text-danger">
                                                <i class="bi bi-exclamation-triangle-fill"></i>
                                                Hãy hoàn thiện hồ sơ gia sư để có thể nhận lớp
                                            </span>
                                        </h6>
                                    </c:if>

                                </div>
                                <c:if test="${tutor==null or tutor.isRejected}">
                                    <div class="row align-items-end mb-4">
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <img id="previewImage" class="TutorAvatar" src="img/${userObj.profilePic}"  alt="${userObj.userName}'s IMG"> 
                                            <img id="loadingIcon" class="TutorAvatar" src="img/loadinggif.gif" style="display: none;" alt="Loading...">
                                        </div>

                                        <div class="col-xl-5 col-lg-5 col-md-5 col-sm-5" style="display: none;" id="formAvatar">
                                            <label for="img" class="form-label fw-bold mb-1">Thay ảnh đại diện:</label><br>
                                            <input type="file"  class="form-control form-control-sm" name="avatar" id="avatarInput" onchange="previewSelectedImage(event, 'previewImage')">
                                            <small class="fw-bold mb-1 text-danger">Ảnh đại diện cần chụp rõ mặt.</small>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="row gutters">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="school">Trường học: </label>
                                            <input type="text" class="form-control" name="school" id="school"  readonly value="${tutor.school}" required>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="major">Chuyên ngành</label>
                                            <input type="text" class="form-control" name="major" id="major" readonly value="${tutor.major}" required>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="gradYear">Năm tốt nghiệp</label>
                                            <input type="text" class="form-control" name="gradYear" id="gradYear" readonly value="${tutor.graduationYear}" required>
                                            <small class="text-danger fw-bold d-none" id="gradYearError">
                                                Năm không hợp lệ!
                                            </small>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="level">Trình độ học vấn:</label>
                                            <select class="form-select" name="level" id="level" disabled required>
                                                <option value="" <c:if test = "${tutor == null}">selected</c:if> disabled>---</option>
                                                <option value="1" <c:if test = "${tutor.educationLevel == 1}">selected</c:if>>Sinh viên</option>
                                                <option value="2" <c:if test = "${tutor.educationLevel == 2}">selected</c:if>>Đã tốt nghiệp</option>
                                                <option value="3" <c:if test = "${tutor.educationLevel == 3}">selected</c:if>>Giáo viên</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-6 col-md-6">
                                            <div class="form-group">
                                                <label for="gender">Giới tính:</label>
                                                <select class="form-select" name="gender" id="gender" disabled required>
                                                    <option value="" <c:if test = "${tutor == null}">selected</c:if> disabled>---</option>
                                                <option value="0" <c:if test = "${!tutor.gender and tutor != null}">selected</c:if>>Nữ</option>
                                                <option value="1" <c:if test = "${tutor.gender}">selected</c:if>>Nam</option>
                                                </select>                                     
                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-6 col-md-6">
                                            <div class="form-group">
                                                <label for="dob">Ngày sinh: </label>
                                                <input type="date" class="form-control" name="dob" id="dob" value="${tutor.dob}" readonly required/>
                                            <small class="text-danger fw-bold d-none" id="dobError">
                                                Tuổi phải từ 18 trở lên!
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="form-group">
                                        <label for="intro">Giới thiệu bản thân: </label>
                                        <textarea class="form-control" name="intro" id="intro" readonly style="height: 200px;">${tutor.introduction}</textarea>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="idCard1" class="fw-bolder">Ảnh chụp căn cước công dân mặt trước: </label><br>

                                            <img id="img1" class="idCard" 
                                                 <c:if test = "${tutor != null}">src="img/${tutor.idCard1}"</c:if>
                                                 <c:if test = "${tutor == null}">src="img/placeholder-img"</c:if>      
                                                     alt="idCarPic1 IMG" />

                                                 <input type="file" style="display: none;" class="form-control form-control-sm" name="idCard1" id="idCard1"
                                                 <c:if test="${tutor==null or tutor.isRejected}">required</c:if>
                                                     onchange="previewSelectedImage(event, 'img1')">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="idCard2" class="fw-bolder">Ảnh thẻ sinh viên hoặc bằng cấp: </label><br>

                                                <img id="img2" class="idCard"
                                                <c:if test = "${tutor != null}">src="img/${tutor.idCard2}"</c:if>  
                                                <c:if test = "${tutor == null}">src="img/placeholder-img"</c:if> 
                                                    alt="idCarPic2 IMG"/>    

                                                <input type="file" style="display: none;" 
                                                       class="form-control form-control-sm" 
                                                       name="idCard2" id="idCard2" 
                                                <c:if test="${tutor==null or tutor.isRejected}">required</c:if>
                                                    onchange="previewSelectedImage(event, 'img2')"
                                                    >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row gutters" style="margin-top: 15px">
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                            <div class="text-right">
                                                <button type="button" onclick="enableForm()" id="editButton" class="btn btn-primary text-white">Chỉnh sửa</button>
                                                <button type="button" onclick="reloadPage()" style="display: none;" id="closeButton" class="btn btn-primary text-white">Hủy</button>
                                                <input class="btn btn-primary btn-md" style="color: white; display: none;" 
                                                       id="submitButton" type="submit" value="Lưu thay đổi" onclick="return validation()"/>
                                            </div>
                                        </div>
                                    <c:if test="${tutor==null or tutor.isRejected}">
                                        <small class="text-danger">Một số trường không thể thay đổi sau khi gửi, hãy kiểm tra kỹ thông tin!</small>
                                    </c:if>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row gutters mt-3">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">

                </div>
                <c:if test = "${tutor != null and !tutor.isRejected}">
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <h3 class="fw-bolder">Vị trí gia sư</h3>
                                <hr class="mt-2 mb-2"/>
                                <form action="tutorposition" method="post" id="secondForm">
                                    <div class="row">
                                        <div class="col-md-12 my-2">
                                            <label>Các môn học có thể dạy</label>
                                            <select data-placeholder="Chọn môn học" name="subject" id="subject" class="anyname form-select" multiple>
                                                <c:forEach items="${requestScope.subjectList}" var="item">
                                                    <option value="${item.subjectID}"
                                                            <c:if test = "${tutorSubjects.contains(item.subjectID)}">selected</c:if>>
                                                        ${item.subjectName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-12">
                                            <label>Địa điểm có thể dạy</label>
                                            <select data-placeholder="Chọn địa điểm" id="location" class="anyname form-select" multiple name='location'>
                                                <c:forEach items="${requestScope.locationList}" var="item">
                                                    <option value="${item.locationID}"
                                                            <c:if test = "${tutorLocations.contains(item.locationID)}">selected</c:if>>
                                                        ${item.locationName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class ="row my-2">
                                            <div class="col-md-6">
                                                <label class="fw-bold">
                                                    Trạng thái: 
                                                </label>
                                                <div class="form-check d-inline-block">
                                                    <input class="form-check-input" type="radio" name="tutorStatus" id="inactiveStatus" value="0" <c:if test = "${!tutor.active}">checked</c:if>>
                                                        <label class="form-check-label text-danger" for="inactiveStatus">
                                                            Không hoạt động
                                                        </label>
                                                    </div>
                                                    <div class="form-check d-inline-block">
                                                        <input class="form-check-input" type="radio" name="tutorStatus" id="activeStatus" value="1" <c:if test = "${tutor.active}">checked</c:if>>
                                                        <label class="form-check-label text-success" for="activeStatus">
                                                            Đang hoạt động
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <input class="btn btn-primary btn-md" style="color: white;" id="submitSecondForm" type="submit" value="Lưu thay đổi"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                </c:if>                                    
            </div>
        </div>
    </div>

    <jsp:include page="Footer.jsp"></jsp:include>    

        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/chosen.jquery.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script>

        </script>
        <script>
            function enableForm() {

                document.getElementById("gradYear").removeAttribute("readonly");
                document.getElementById("level").removeAttribute("disabled");
                document.getElementById("intro").removeAttribute("readonly");
                document.getElementById("closeButton").style.display = 'inline-block';

        <c:if test="${tutor==null or tutor.isRejected}">
                document.getElementById("gender").removeAttribute("disabled");
                document.getElementById("formAvatar").style.display = 'block';
                document.getElementById("dob").removeAttribute("readonly");
                document.getElementById("school").removeAttribute("readonly");
                document.getElementById("major").removeAttribute("readonly");
                document.getElementById("idCard1").style.display = 'block';
                document.getElementById("idCard2").style.display = 'block';
        </c:if>
                document.getElementById("submitButton").style.display = 'inline-block';
                document.getElementById("editButton").style.display = 'none';
            }

            function reloadPage() {
                location.reload();
            }
   
        $(".anyname").chosen();

        document.getElementById("tutorMenu").classList.add('active');

        function validation() {
            const d = new Date(document.getElementById("dob").value);
            let year = d.getFullYear();
            let currentYear = new Date().getFullYear();
            console.log(currentYear - year);
            var x = document.getElementById("gradYear").value;
            var error = false;

            console.log(!/^\d{4}$/.test(x) + x);
            if (!/^\d{4}$/.test(x)) {
                event.preventDefault();
                document.getElementById("gradYear").classList.add('border');
                document.getElementById("gradYear").classList.add('border-danger');
                document.getElementById("gradYearError").classList.remove('d-none');
            }
            if (currentYear - year <= 18) {
                event.preventDefault();
                document.getElementById("dob").classList.add('border');
                document.getElementById("dob").classList.add('border-danger');
                document.getElementById("dobError").classList.remove('d-none');
            }

        }

        $(document).ready(function () {
            $('#tutorForm').submit(function (event) {
                event.preventDefault();

                $.ajax({
                    url: 'tutorprofile',
                    method: 'POST',
                    data: new FormData(this),
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        window.location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error(errorThrown);
                        var errorMessage = jqXHR.responseText;
                        alert(errorMessage);
                    }
                });
            });
        });

        function previewSelectedImage(event, id) {
            var input = event.target;
            var preview = document.getElementById(id);
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

        async function reloadImg(url) {
            await fetch(url, {cache: 'reload', mode: 'no-cors'});
            document.body.querySelectorAll(`img[src='${url}']`).forEach(img => img.src = url);
            console.log(url);
        }
    </script>
</body>


</html>
