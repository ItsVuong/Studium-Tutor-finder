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
            <div class="container"style="margin-top: 30px" >
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
                        </div>
                    </div>
                </div>

                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <table class="table user-list">
                        <thead>
                            <tr >
                                <th><span>Loại Yêu cầu</span></th>                                       
                                <th><span>UserName</span></th>
                                <th><span>Tên đầy đủ</span></th>
                                <th><span>ID lớp</span></th>
                                <th><span>Ngày tạo</span></th>
                                <th style="text-align: center" ><span>Phản hồi</span></th>
                                <th style="text-align: center" ><span>Tình trạng</span></th>
                            </tr>
                        </thead>

                        <c:if test="${RequestList != null}">
                            <c:forEach items="${RequestList}" var="rl">
                                <tr>
                                    <c:if test="${rl.requestType == 0}"><td>Gia sư nhận lớp</td></c:if>
                                    <c:if test="${rl.requestType == 1}"><td>Phụ huynh thuê gia sư</td></c:if>
                                    <c:forEach items="${Account}" var="a">
                                        <c:if test="${a.id == rl.tutorID}"><td><a href="viewacc?username=${a.userName}&role=${a.role}">${a.userName}</a></td></c:if>
                                        </c:forEach>
                                        <c:forEach items="${Account}" var="a">
                                            <c:if test="${a.id == rl.tutorID}"><td>${a.fullName}</td></c:if>
                                    </c:forEach>                                 
                                    <td><a class="btn"style="background-color: #92a2b6; color: white" href="ClassList?detail=1&xd=0&id=${rl.classID}">${rl.classID}</a></td>
                                    <td>${rl.dateCreate}</td>
                                    <c:if test="${rl.requestStatus == 1}">
                                        <td style="text-align: center" >
                                            <a class="btn btn-success">Chấp thuận</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${rl.requestStatus == 2}">
                                        <td style="text-align: center" >
                                            <a class="btn btn-danger">Từ chối</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${rl.requestStatus == 0}">
                                        <td style="text-align: center" ><a href="HandleRequest?id=${rl.requestID}" class="table-link" title="xử lý">
                                                <span style="width: 100%" class="fa-stack btn btn-light">
                                                    <i class="fas fa-reply"></i>    
                                                </span>
                                            </a></td>
                                        </c:if>                                  
                                </tr>
                            </c:forEach>
                        </c:if>

                    </table>
                    <c:if test="${RequestList == null}">
                        <div style="text-align: center">Hiện chưa có yêu cầu nào !</div>
                    </c:if>
                    <!-- Modal -->   
                    <div style="text-align: center; width: 100%">
                        <c:if test="${RequestList != null}">
                            <c:set var="page" value="${requestScope.page}" />
                            <div>
                                <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                                <ul style="list-style-type: none ">
                                    <div style="display: flex;justify-content: center">
                                        <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="RequestOfTutor?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="RequestOfTutor?page=${i}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="RequestOfTutor?xd=0&page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>
                                    </div>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div >
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src=js/Hung.js"></script>
</html>
