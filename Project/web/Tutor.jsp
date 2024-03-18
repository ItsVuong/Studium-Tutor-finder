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
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">
                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                    <div class="col-md-12"> 
                        <form action="listTutor" method="get">
                            <div style="padding: 20px; background: #f8f9fa; margin: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="subjectInput">Môn học</label>
                                        <input id="subjectInput" value="${param["inforSearch"]}" name="inforSearch" class="form-control" type="text" placeholder="Nhập môn học">
                                </div>
                                <div class="col-md-3">
                                    <label for="genderSelect">Giới tính</label>
                                    <select id="genderSelect" name="genderSelect" class="form-control">
                                        <option value="" ${param["genderSelect"]==""?"selected":""} >Chọn giới tính</option>
                                        <option value="0" ${param["genderSelect"]=="0"?"selected":""}>Nữ </option>
                                        <option value="1" ${param["genderSelect"]=="1"?"selected":""}>Nam</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="locationSelect">Khu vực</label>
                                    <div class="input-group">
                                        <select id="locationSelect" name="location" class="form-control">
                                            <option value="" ${param["location"]==""?"selected":""}>Chọn khu vực</option>
                                            <c:forEach items="${LocationList}" var="ll">
                                                <option value="${ll.locationName}" ${param["location"]==ll.locationName?"selected":""} >${ll.locationName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2" style="padding-top: 20px">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-search text-white"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div  id="tutorContainer" style="display: flex;justify-content: space-around; flex-wrap: wrap; ">
                <c:forEach var="p" items="${listTutor}" varStatus="status">
                    <div style="border:  1px solid lightgray; border-radius:  10px; padding: 10px; margin: 5px; width: 48%;">
                        <div style="display:  flex; justify-content:  space-between;">
                            <div  style="width: 40%">
                                <img style="width: 150px" src="img/${p.profilePic}" alt="alt"/>
                            </div>
                            <div  style="width: 60%"> 
                                <p>Tên: ${p.name}</p>
                                <p>Học trường: ${p.school}</p>
                                <p>Giới tính: ${p.gender?"Nam":"Nữ"}</p>
                                <p>Địa điểm:
                                    <c:forEach var="location" items="${p.locations}" varStatus="loop">
                                        ${location}<c:if test="${not loop.last}">, </c:if>
                                    </c:forEach>
                                </p>
                                <p>Môn học:
                                    <c:forEach var="subject" items="${p.subjects}" varStatus="loop">
                                        ${subject}<c:if test="${not loop.last}">, </c:if>
                                    </c:forEach></p>
                            </div>
                        </div>
                        <a class="btn btn-info" href="TutorDetail?tid=${p.tutorID}">Xem chi tiết</a>
                    </div>
                </c:forEach>
            </div>


            <div class="pagination">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" onclick="showPage(1)">1</a>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
            <script src="js/main.js"></script>
            <script>
                            const tutorsPerPage = 6;
                            const tutorContainer = document.getElementById('tutorContainer');
                            const totalPages = Math.ceil(${listTutor.size()} / tutorsPerPage);

                            function showPage(page) {
                                const startIdx = (page - 1) * tutorsPerPage;
                                const endIdx = startIdx + tutorsPerPage;

                                for (let i = 0; i < tutorContainer.children.length; i++) {
                                    if (i >= startIdx && i < endIdx) {
                                        tutorContainer.children[i].style.display = 'block';
                                    } else {
                                        tutorContainer.children[i].style.display = 'none';
                                    }
                                }
                            }

                            function populatePagination() {
                                const paginationList = document.querySelector('.pagination');
                                paginationList.innerHTML = '';

                                for (let i = 1; i <= totalPages; i++) {
                                    const listItem = document.createElement('li');
                                    listItem.classList.add('page-item');
                                    const link = document.createElement('a');
                                    link.classList.add('page-link');
                                    link.href = '#';
                                    link.textContent = i;
                                    link.onclick = () => showPage(i);
                                    listItem.appendChild(link);
                                    paginationList.appendChild(listItem);
                                }
                            }


                            showPage(1);
                            populatePagination();
        </script>
    </body>
</html>
