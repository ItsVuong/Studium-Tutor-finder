<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Models.Tutor" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/search.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <title>Tutor</title>
        <style>
            .tutor-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-top: 20px;
            }
            .tutor-info {
                display: flex;
                align-items: center;
                width: 45%;
                padding: 10px;
                margin: 10px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
            }
            .tutor-info img {
                max-width: 100%;
                margin-right: 10px;
            }
            .tutor-info p {
                margin: 0; /* Remove default margin for paragraphs */
            }
            .pagination {
                margin-top: 20px;
            }

            .page-link {
                cursor: pointer;
            }
            .choice{
                display: block;
                width: fit-content;
                margin: 0 auto;
                text-align: center;
                padding: 5px 10px;
                background-color: #0080ff;
                color: white;


            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container" style="padding-top: 15px;">
                <div style=" border-radius:  10px;
                     padding: 10px;
                     margin-bottom: 10px;">
                    <div style="display:  flex;
                         justify-content:  space-between;">
                        <div  style="width: 30%; text-align: center">
                            <img style="width: 100%" src="img/${p.profilePic}" alt="alt"/>
                        <button class="choice" onclick="selectTeacher('${p.tutorID}')">Chọn</button>
                        <a href="login?from=TutorDetail?tid=4" class="btn btn-primary text-white">Chọn gia sư</a>
                    </div>
                    <div  style="width: 68%"> 
                        <h2 style="text-align: center;
                            border-bottom: 1px solid #ddd;">${p.name} </h2>
                        <p>Học trường: ${p.school}</p>
                        <p>Chuyên ngành: ${p.major}</p>
                        <p>Năm tốt nghiệp: ${p.graduationYear}</p>
                        <p>Giới thiệu: ${p.introduction}</p>
                        <p>Giới tính: ${p.gender?"Nam":"Nữ"}</p>
                        <c:if test="${p.educationLevel == 1}">
                            <p>Trình độ: Sinh viên</p>
                        </c:if>
                        <c:if test="${p.educationLevel == 2}">
                            <p>Trình độ: Đã tốt nghiệp</p>
                        </c:if>
                        <p>Địa điểm:
                            <c:forEach var="location" items="${p.locations}" varStatus="loop">
                                ${location}<c:if test="${not loop.last}">, </c:if>
                            </c:forEach>
                        </p>
                        <p>Môn học:
                            <c:forEach var="subject" items="${p.subjects}" varStatus="loop">
                                ${subject}<c:if test="${not loop.last}">, </c:if>
                            </c:forEach></p>
                            <c:if test="${not empty p.achievements}">
                            <p>Thành tựu: 
                                <c:forEach var="achievement" items="${p.achievements}" varStatus="loop">
                                    ${achievement}<c:if test="${not loop.last}">, </c:if>
                                </c:forEach>
                            </p>
                        </c:if>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>
        <script>
                            function selectTeacher(tutorID) {
                                var isLoggedIn = /* code kiểm tra đăng nhập */;
                                if (!isLoggedIn) {
                                    alert("Vui lòng đăng nhập để chọn giáo viên.");
                                    // Redirect hoặc hiển thị form đăng nhập ở đây
                                    // Ví dụ:
                                     window.location.href = "login.jsp";
                                } else {
                                    // Thực hiện hành động chọn giáo viên
                                    window.location.href = "TutorDetail?tid=" + tutorID;
                                }
                            }
        </script>
    </body>
</html>
