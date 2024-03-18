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
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <h3 style="text-align: center;">Lớp của: ${acc.userName}</h3>
                <div style="padding-top: 20px; padding-left: 150px; padding-right: 150px; width:100%">
                    <div class="col-sm-12" style="justify-content: space-between">
                        <div class="row">
                        <c:forEach items="${getClassById}" var="cls">
                            <div class="col-12 col-md-6 col-lg-3" >
                                <div style=" border: 2px solid; margin-bottom: 20px ">
                                    <c:if test="${cls.isApproved}">
                                    <div style="background-color:#0080ff;text-align: center">
                                        <a class="btn"href="#" style="color: white" rel="nofollow">Mã lớp: ${cls.classID}</a>
                                    </div>
                                    </c:if>
                                    <c:if test="${!cls.isApproved}">
                                    <div style="background-color:red;text-align: center">
                                        <a class="btn"href="#" style="color: white" rel="nofollow">Mã lớp: ${cls.classID}</a>
                                    </div>
                                    </c:if>
                                    <div class="card">  
                                        <div class="card-body">
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-book"></i><b> ${cls.subject}</b></p>
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-map-marker-alt"></i> ${cls.publicAddress}</p>
                                            <p class="mb-2 card-text show_txt w-100"><i class="fas fa-dollar-sign"></i> ${cls.payPerSession} ₫/buổi, ${cls.sesPerWeek} buổi/tuần</p>
                                            <p class="mb-2 card-text show_txt"><i class="fas fa-bookmark"></i> Yêu cầu: 
                                                <c:choose>
                                                    <c:when test="${cls.tutorEdlevel==1}">
                                                        Sinh Viên
                                                    </c:when>
                                                    <c:when test="${cls.tutorEdlevel==2}">
                                                        Giáo Viên
                                                    </c:when>
                                                    <c:otherwise>
                                                        (Không xác định)
                                                    </c:otherwise>
                                                </c:choose>

                                            </p>      
                                            <div class="row text-right mt-3" style="width: 75%;margin-left: auto;">
                                                <a href="ClassList?detail=1&id=${cl.classID}" class="btn btn-success"style="color: white" rel="nofollow">Xem chi tiết</a>
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

        <button type="button" id="backButton" class="btn btn-secondary">Back</button>
        <script src="js/main.js"></script>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script>
                    document.getElementById("backButton").addEventListener("click", function () {
                        window.history.back();
                    });
        </script>
    </body>
</html>
