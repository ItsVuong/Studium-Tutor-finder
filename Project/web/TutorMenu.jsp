<%-- 
    Document   : TutorMenu
    Created on : Feb 18, 2024, 7:43:20 PM
    Author     : Asus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="list-group list-group-light">
    <a href="account?username=${userObj.userName}" id="personalMenu" class="list-group-item list-group-item-action px-3 border">Thông tin tài khoản</a>
    <a href="tutorprofile" id="tutorMenu" class="list-group-item list-group-item-action px-3 border" aria-current="true">
        Hồ sơ gia sư  <c:if test = "${tutor == null || !tutor.isValidated}"><i class="bi bi-exclamation-triangle-fill text-danger"> </c:if> </i> </a>
    <a href="account?username=${userObj.userName}" id="personalMenu" class="list-group-item list-group-item-action px-3 border">Quản lý lớp dạy</a>
    <a href="account?username=${userObj.userName}" id="personalMenu" class="list-group-item list-group-item-action px-3 border">Quản lý yêu cầu</a>
</div>
