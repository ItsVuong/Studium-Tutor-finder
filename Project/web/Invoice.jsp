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
                            <ul style="list-style-type: none;">
                                <li><a href="account?username=${userObj.userName}" class="btn" style="background-color: #92a2b6; color:white; width: 200px">Thông tin cá nhân</a></li>
                                <li><a href="ManageClass?xd=0"  class="btn" style="background-color: #92a2b6; color:white; width: 200px">Lớp đang quản lý</a></li>
                                <li><a href="ManageClass?xd=1"  class="btn" style="background-color: #92a2b6; color:white; width: 200px">Lớp chờ xét duyệt</a></li>
                                <li><a href="RequestOfTutor" class="btn" style="background-color: #92a2b6; color:white; width: 200px">Yêu cầu của người dạy</a></li>
                                <li><a href="RequestOfParent"  class="btn" style="text-align: left;background-color: #92a2b6; color:white; width: 200px">Yêu cầu của người thuê</a></li>
                                <li><a href="Invoice"class="btn" style="background-color: #92a2b6; color:white; width: 200px">Hóa đơn</a></li>
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
                            </tr>
                        </thead>
                       
                            <tr >
                                   
                            </tr>
                       

                        
                    </table>
                    <!-- Modal -->                 
                </div>
            </div>
        </div >
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src=js/Hung.js"></script>
</html>
