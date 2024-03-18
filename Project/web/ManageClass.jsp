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

            <div class="container" style="margin-top: 30px">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card ">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="img/${userObj.profilePic}" alt="${userObj.getProfilePic()}'s IMG">
                                        <input type="hidden" name="img" value="${userObj.profilePic}">
                                    </div>
                                    <h5 class="user-name">${userObj.userName}</h5>
                                    <h6 class="user-email">${userObj.email}</h6>
                                </div>
                                <c:if test="${userObj.role == 2}">
                                    <jsp:include page="TutorMenu.jsp"></jsp:include>  
                                </c:if>
                            </div>
                            <ul style="list-style-type: none;" >
                                <li><a href="account?username=${userObj.userName}" class="btn" style="background-color: #92a2b6; color:white; width: 90% ">Thông tin cá nhân</a></li>
                                <li><a href="ManageClass?xd=0"  class="btn" style="background-color: #92a2b6; color:white; width: 90%">Lớp đang quản lý</a></li>
                                <li><a href="ManageClass?xd=1"  class="btn" style="background-color: #92a2b6; color:white; width: 90%">Lớp chờ xét duyệt
                                        <b style="position: absolute;top:56.7%;right: 11%"><span id="amountRequestClass" class="amount"></span></b></a></li>
                                <li><a href="RequestOfTutor" class="btn" style="background-color: #92a2b6; color:white; width: 90%">Yêu cầu của gia sư 
                                        <b style="position: absolute;top:66%;right: 11% "><span  id="amountRequestTutor" class="amount"></span></b></a></li>
                                <li><a href="RequestOfParent"class="btn" style="text-align: center;background-color: #92a2b6; color:white; width: 90%">Yêu cầu của phụ huynh 
                                        <b style="position: absolute;top:75.5%;right: 11%"><span id="amountRequestParent" class="amount"></span></b></a></li>
                                <li><a href="Invoice"class="btn" style="background-color: #92a2b6; color:white; width: 90% ">Hóa đơn</a></li>
                            </ul>
                            <script src=js/Menu.js"></script>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <b>Chú thích trạng thái:</b> <c:if test="${xd == 1}"><a href="#" class="btn btn-warning" style="width:180px;color:white">Lớp học chưa duyệt</a></c:if>
                    <c:if test="${xd ==0}">
                        <a href="SearchClassAdminControll?xd=0&status=1.1"  class="btn btn-primary" style="color: white;width:180px">Chưa có gia sư nhận</a>
                        <a href="SearchClassAdminControll?xd=0&status=1.2" class="btn"style="color: white; background-color: grey ;width:180px">Lớp đã được nhận</a>
                        <a href="SearchClassAdminControll?xd=0&status=0" class="btn btn-danger" style="width:180px">Lớp bị hủy</a>
                        <a href="SearchClassAdminControll?xd=0&status=3" class="btn btn-success" style="width:180px">Lớp học hoàn thành</a>
                    </c:if>
                    <form action="SearchClassAdminControll" method="post" >
                        <input name="xd" type="hidden" value="${xd}">
                        <c:if test="${xd==1}">
                            <div style=" width: 70%;padding: 10px; background: #eee; margin-top: 20px;display: flex;justify-content: space-between;height: 50px">
                                <select style="width: 45%" name="accountid" placeholder="User name account">
                                    <option value="">UserName</option>
                                    <c:forEach items="${AccountNotAdmin}" var="ac">
                                        <c:choose>
                                            <c:when test="${ac.id == accountid}">
                                                <option value="${ac.id}" selected>${ac.userName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${ac.id}">${ac.userName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                                <input style="width: 30%"class="den" max="2000000" min="1" type="number" value="${classidsearch}" name="classidsearch"  placeholder="Mã lớp học">
                            </c:if>
                            <c:if test="${xd==0}">
                                <div style="padding: 10px; background: #eee; margin-top: 20px;display: flex;justify-content: space-between;height: 50px">
                                    <select style="width: 25%" name="accountid" placeholder="User name account">
                                        <option value="">UserName</option>
                                        <c:forEach items="${AccountNotAdmin}" var="ac">
                                            <c:choose>
                                                <c:when test="${ac.id == accountid}">
                                                    <option value="${ac.id}" selected>${ac.userName}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${ac.id}">${ac.userName}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <input style="width: 25%"class="den" max="2000000" min="1" type="number" value="${classidsearch}" name="classidsearch"  placeholder="Mã lớp học">
                                    <select style="width: 28%" name="status" placeholder="Trạng thái">
                                        <option value="">Trạng thái</option>
                                        <c:choose>
                                            <c:when test="${status eq '1.1'}">
                                                <option value="1.1"selected>Chưa có gia sư nhận</option>
                                                <option value="1.2">Lớp đã được nhận</option>
                                                <option value="0">Lớp bị hủy</option>
                                                <option value="3">Lớp học hoàn thành</option>
                                            </c:when>
                                            <c:when test="${status eq '1.2'}">
                                                <option value="1.1">Chưa có gia sư nhận</option>
                                                <option value="1.2" selected>Lớp đã được nhận</option>
                                                <option value="0">Lớp bị hủy</option>
                                                <option value="3">Lớp học hoàn thành</option>
                                            </c:when>
                                            <c:when test="${status eq '0'}">
                                                <option value="1.1">Chưa có gia sư nhận</option>
                                                <option value="1.2">Lớp đã được nhận</option>
                                                <option value="0" selected>Lớp bị hủy</option>
                                                <option value="3">Lớp học hoàn thành</option>
                                            </c:when>
                                            <c:when test="${status eq '3'}">
                                                <option value="1.1">Chưa có gia sư nhận</option>
                                                <option value="1.2">Lớp đã được nhận</option>
                                                <option value="0">Lớp bị hủy</option>
                                                <option value="3"selected>Lớp học hoàn thành</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1.1">Chưa có gia sư nhận</option>
                                                <option value="1.2">Lớp đã được nhận</option>
                                                <option value="0">Lớp bị hủy</option>
                                                <option value="3">Lớp học hoàn thành</option>
                                            </c:otherwise>
                                        </c:choose>                           
                                    </select>
                                </c:if>
                                <button style="width: 18%" type="submit" class="">
                                    <i class="fas fa-search text-primar"></i>
                                    <b style="color:#0080ff">Tìm</b>
                                </button>
                            </div>
                    </form>
                    <br>

                    <c:if test="${mess != null}">
                        <h3 style="color: red; text-align: center">${mess}</h3>
                    </c:if>
                    <div style="padding-top: 20px; width:100%">
                        <div class="col-sm-12" style="justify-content: space-between">
                            <div class="row">
                                <c:if test="${xd == 0}">
                                    <c:forEach items="${ClassList}" var="cl">                              
                                        <div class="col-12 col-md-6 col-lg-4" >
                                            <div style=" border: 2px solid; margin-bottom: 20px ">
                                                <c:if test="${cl.classStatus != 0 && cl.tutorID == 0}">
                                                    <div style="background-color:#0080ff;text-align: center">
                                                        <a class="btn" style="color: white" rel="nofollow">Mã lớp: ${cl.classID}</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${cl.tutorID != 0 && cl.classStatus != 3}">
                                                    <div style="background-color: grey ;text-align: center">
                                                        <a class="btn" style="color: white" rel="nofollow">Mã lớp: ${cl.classID}</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${cl.classStatus == 3}">
                                                    <div style="background-color: #198754; text-align: center">
                                                        <a class="btn" style="color: white" rel="nofollow">Mã lớp: ${cl.classID}</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${cl.classStatus == 0 }">
                                                    <div style="background-color: #dc3545; text-align: center">
                                                        <a class="btn " rel="nofollow" style="color:white">Mã lớp: ${cl.classID}</a>
                                                    </div>
                                                </c:if>
                                                <div class="card">  
                                                    <div class="card-body">
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
                                                        <div class="row text-right mt-3" style="width: 75%;margin-left: auto;">
                                                            <form action="ClassList" method="post">
                                                                <button class="btn btn-success">
                                                                    <input name="detail" value="1" style="display: none">
                                                                    <input name="id" value="${cl.classID}" style="display: none">
                                                                    <input name="xd" value="0" style="display: none">
                                                                    Xem chi tiết
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                     
                                    </c:forEach>
                                </c:if>
                                <c:if test="${xd == 1}">
                                    <c:forEach items="${ClassList}" var="cl">                              
                                        <div class="col-12 col-md-6 col-lg-4" >
                                            <div style=" border: 2px solid; margin-bottom: 20px ">
                                                <div style="background-color: #ffca2c;text-align: center" >
                                                    <a class="btn"href="#" style="color: white" rel="nofollow">Mã lớp: ${cl.classID}</a>
                                                </div>
                                                <div class="card">  
                                                    <div class="card-body">
                                                        <p class="mb-2 card-text show_txt"><i class="fas fa-book"></i><b> ${cl.subject}</b></p>
                                                        <p class="mb-2 card-text show_txt"><i class="fas fa-map-marker-alt"></i> ${cl.publicAddress}</p>
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
                                                        <div class="row text-right mt-3" style="width: 75%;margin-left: auto;">
                                                            <form action="ClassList" method="post">
                                                                <button class="btn btn-success">
                                                                    <input name="detail" value="1" style="display: none">
                                                                    <input name="id" value="${cl.classID}" style="display: none">
                                                                    <input name="xd" value="1" style="display: none">
                                                                    Xem chi tiết
                                                                </button>
                                                            </form>
        <!--                                                    <a href="ClassList?detail=1&id=${cl.classID}" class="btn btn-success"style="color: white" rel="nofollow">Xem chi tiết</a>-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                     
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: center; width: 100%">
                        <c:if test="${pagez != null}">
                            <c:if test="${manageClass != null}">
                                <c:set var="page" value="${requestScope.page}" />
                                <div>
                                    <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                                    <ul style="list-style-type: none ">
                                        <div style="display: flex;justify-content: center">
                                            <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ManageClass?xd=0&page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ManageClass?xd=0&page=${i}" class="page-link">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="ManageClass?xd=0&page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>
                                        </div>
                                    </ul>
                                </div>
                            </c:if>
                        </c:if>   
                        <c:if test="${pagez != null}">
                            <c:if test="${manageClassS != null}">
                                <c:set var="page" value="${requestScope.page}" />
                                <div>
                                    <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                                    <ul style="list-style-type: none ">
                                        <div style="display: flex;justify-content: center">
                                            <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="SearchClassAdminControll?xd=0&page=${page-1==0?(1):(page-1)}&accountid=${accountid}&classidsearch=${classidsearch}&status=${status}" class="page-link">Previous</a></li>
                                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="SearchClassAdminControll?xd=0&page=${i}&accountid=${accountid}&classidsearch=${classidsearch}&status=${status}" class="page-link">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="SearchClassAdminControll?xd=0&page=${page+1>num?(num):(page+1)}&accountid=${accountid}&classidsearch=${classidsearch}&status=${status}" class="page-link">Next</a></li>
                                        </div>
                                    </ul>
                                </div>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div >
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src=js/Hung.js"></script>
     <jsp:include page="Footer.jsp"></jsp:include>
</html>
