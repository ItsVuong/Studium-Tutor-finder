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
            <div style="padding-top: 20px; padding-left: 200px; padding-right:  200px; width:100%" >
                <form action="SearchClassList" method="post">
                    <div style="padding: 10px; background: #eee; margin-left: 20px; margin-top: 20px;display: flex;justify-content: space-between;height: 50px">
                        <select style="width: 50%" name="subject" placeholder="Môn học">
                            <option value="">Khu vực</option>
                        <c:forEach items="${Subject}" var="sj">
                            <c:choose>
                                <c:when test="${sj.subjectID eq subject}">
                                    <option value="${sj.subjectID}" selected>${sj.subjectName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${sj.subjectID}">${sj.subjectName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <select style="width: 28%" name="location" placeholder="Khu vực">
                        <option value="">Khu vực</option>
                        <c:forEach items="${LocationList}" var="ll">
                            <c:choose>
                                <c:when test="${ll.locationName eq location}">
                                    <option value="${ll.locationName}" selected="">${ll.locationName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${ll.locationName}">${ll.locationName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    
                    <button style="width: 18%" type="submit" class="">
                        <i class="fas fa-search text-primar"></i>
                        <b style="color:#0080ff">Tìm</b>
                    </button>
                </div>
            </form>
        </div>
        <div class="container">
            <div style="padding-top: 20px; padding-left: 150px; padding-right: 150px; width:100%">
                <div class="col-sm-12" style="justify-content: space-between">
                    <div class="row">
                        <c:forEach items="${ClassList}" var="cl">
                            <div class="col-12 col-md-6 col-lg-3" >
                                <div style=" border: 2px solid; margin-bottom: 20px ">
                                    <div style="background-color:#0080ff;text-align: center">
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
        <div style="text-align: center; width: 100%">
            <c:if test="${pagez != null}">
                <c:if test="${classoke != null}">
                    <c:set var="page" value="${requestScope.page}" />
                    <div>
                        <div>Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                        <ul style="list-style-type: none ">
                            <div style="display: flex;justify-content: center">
                                <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ClassList?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <li class="page-item"><a style="text-decoration: none; margin-right: 10px;margin: auto;" href="ClassList?page=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                <li class="page-item"><a style="text-decoration: none; margin-left: 10px;margin: auto;" href="ClassList?page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>
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
        <a href="#">Trở lại đầu trang</a>
        <script src="js/main.js"></script>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
