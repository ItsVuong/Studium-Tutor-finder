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
    </head>
    <body>
        <!-- search-bar start--> 
        <jsp:include page="Menu.jsp"></jsp:include>
            <div style="padding-top: 20px; padding-left: 400px; padding-right:  100px; width:100%" >
                <h1 style="text-align: center">Quản lý lớp học của tài khoản: ${userObj.userName} </h1>
            <h1 style="text-align: center">${msg} </h1>
            <form action="SearchParentClass?id=${userObj.id}" method="post">
                <div style="padding: 10px; background: #eee; margin-left: 20px; margin-top: 20px;display: flex;justify-content: space-between;height: 50px">
                    <select style="width: 35%" name="subject" placeholder="Môn học">
                        <option value="">Môn học</option>
                        <c:forEach items="${Subject}" var="sj">
                            <option value="${sj.subjectID}">${sj.subjectName}</option>
                        </c:forEach>
                    </select>
                    <select style="width: 35%" name="classStatus" placeholder="Tình trạng lớp">
                        <option value="">Tình trạng lớp ${test}</option>
                        <option value="1">Đã được duyệt</option>
                        <option value="0">Chưa duyệt</option>
                    </select>
                    <button style="width: 20%" type="submit" class="">
                        <i class="fas fa-search text-primar"></i>
                        <b style="color:#0080ff">Tìm</b>
                    </button>
                </div>
            </form>
        </div>
        <!-- search-bar enđ-->
        <!-- show account -->

        <!-- show account -->
        <!-- show class start -->
        <div class="container">
            <div style="padding-top: 20px; padding-left: 400px; padding-right: 0px; width:100%">
                <div class="col-sm-12" style="justify-content: space-between">
                    <div class="row">
                        <c:forEach items="${ClassListP}" var="cl">
                            <div class="col-12 col-md-6 col-lg-4" >
                                <div style=" border: 2px solid; margin-bottom: 20px ">
                                    <!-- change color base on approved -->
                                    <div style="text-align: center;
                                         background-color: ${cl.isIsApproved() ? '#00FF00' : 'red'}">
                                        <a class="btn" href="#" style="color: white" rel="nofollow">
                                            Mã lớp: ${cl.classID}
                                        </a>
                                    </div>


                                    <div class="card">  
                                        <div class="card-body">

                                            <p class="mb-2 card-text show_txt">
                                                <i class="fa fa-bell" aria-hidden="true"></i>Trạng thái: 
                                                <c:choose>
                                                    <c:when test="${cl.isIsApproved()}">
                                                        <!-- Display the tutor's name in green if isApproved is true -->
                                                        <span style="color: #00FF00">Đã được duyệt ${test}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- Display "Chưa có người nhận" in red if isApproved is false -->
                                                        <span style="color: red">Chưa duyệt</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                            <p class="mb-2 card-text ">
                                                <i class="fa fa-user" aria-hidden="true"></i>Gia sư:
                                                <c:if test="${cl.tutorID != 0}">
                                                    <!-- Display the tutor's name if tutorID is not 0 -->
                                                    <span style="color: #0e0e0e"> ${cl.tutorName}</span>
                                                </c:if>
                                                <c:if test="${cl.tutorID == 0}">
                                                    <span style="color: red">Chưa có người nhận </span>
                                                </c:if>
                                            </p>
                                            <p class="mb-2 card-text show_txt"><i class="fa fa-calendar" aria-hidden="true"></i> Ngày đăng: ${cl.openDate} </p>
                                            <hr>
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-book"></i><b> ${cl.subject}</b></p>
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-map-marker-alt"></i> ${cl.actualAddress}</p>
                                            <p class="mb-2 card-text show_txt w-100"><i class="fas fa-dollar-sign"></i> ${cl.payPerSession} ₫/buổi, ${cl.sesPerWeek} buổi/tuần</p>
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-bookmark"></i> Yêu cầu: 
                                                <c:choose>
                                                    <c:when test="${cl.tutorEdlevel eq 1}">
                                                        Sinh Viên
                                                    </c:when>
                                                    <c:when test="${cl.tutorEdlevel eq 2}">
                                                        Giáo Viên
                                                    </c:when>
                                                    <c:otherwise>
                                                        (Không xác định)
                                                    </c:otherwise>
                                                </c:choose>

                                            </p>
                                            <!-- Hiển thị nút xoá chỉ khi lớp chưa được duyệt và chưa được ai nhận -->
                                            <div class="row text-right mt-3" style="width: 75%;margin-left: auto;">
                                                <c:if test="${!cl.isIsApproved() && cl.tutorID == 0}">
                                            <a href="UnactiveClass?idClass=${cl.classID}" class="btn btn-success" style="color: white;" rel="nofollow">Xóa</a>
                                            </c:if>
                                            </div>
                                            <div class="row text-right mt-3" style="width: 75%;margin-left: auto;">                               
                                                <a href="ClassList?detail=1&id=${cl.classID}" class="btn btn-success"style="color: white" rel="nofollow">Xem chi tiết</a>
                                            </div>                     
                                            <div class="row text-left mt-3" style="width: 75%; margin-left: auto;">
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <!-- show class end -->

        <!-- edit size of 1 class and amount of class in 1 page -->
        <div style="text-align: center; width: 100%">
            <c:if test="${pagez != null}">
                <c:if test="${classoke != null}">
                    <c:set var="page" value="${requestScope.page}" />
                    <div>
                        <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                        <ul style="list-style-type: none ">
                            <div style="display: flex;justify-content: center">
                                <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ManageClass_Parent?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ManageClass_Parent?page=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="ManageClass_Parent?page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>
                            </div>
                        </ul>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${pagez != null}">
                <c:if test="${classS != null}">
                    <c:set var="page" value="${requestScope.page}" />
                    <div>
                        <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                        <ul style="list-style-type: none ">
                            <div style="display: flex;justify-content: center">
                                <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="SearchClassList?page=${page-1==0?(1):(page-1)}&location=${location}&inforsearch=${inforsearch}" class="page-link">Previous</a></li>
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="SearchClassList?page=${i}&location=${location}&inforsearch=${inforsearch}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="SearchClassList?page=${page+1>num?(num):(page+1)}&location=${location}&inforsearch=${inforsearch}" class="page-link">Next</a></li>
                            </div>
                        </ul>
                    </div>
                </c:if>
            </c:if>
        </div>
        <!-- amount of class in 1 page -->
        <a href="#">Trở lại đầu trang</a>
        <script src="js/main.js"></script>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
