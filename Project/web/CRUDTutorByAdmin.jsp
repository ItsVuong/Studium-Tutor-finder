<%-- 
    Document   : SignUpAccount
    Created on : Jan 14, 2024, 11:31:33 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Studium</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@100;600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/listaccount.css" rel="stylesheet">
    </head>

    <body>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <jsp:include page="Menu.jsp"></jsp:include> 
        <% 
String successMessage = (String) request.getAttribute("successMessage");
if (successMessage != null) {
        %>
        <script type="text/javascript">
            window.onload = function () {
                setTimeout(function () {
                    alert('<%= successMessage %>');
                }, 500); // trì hoãn 0.5 giây
            };
        </script>
        <%
            }
        %>
        <!-- Modal Search End -->

        <!-- Contact Us Start -->
        <div class="container">
            <div class="row">                                
                <div class="col-lg-6">
                    <form action="crudtutor" method="GET" class="mb-1">
                        <small for="profile-picture" class="form-label">Authentication Status</small>
                        <select name="validated" class="col-md-2 text-center" style="border-radius: 15px; height:  35px; width: 100px">
                            <option value="0" ${validated == '0' ? 'selected' : ''}>Pending</option> 
                            <option value="1" ${validated == '1' ? 'selected' : ''}>Approved</option>                                
                        </select>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="submit" class="btn btn-second">Result: ${pagingsize}</button>
                    </form>
                </div>

                <div class="col-lg-6">
                    <form action="crudtutor" method="GET"class="mb-1">
                        <div class="input-group">
                            <input type="hidden" name="validated" value="${validated}">
                            <input type="text" class="form-control" name="txtS" value="${txtS}" placeholder="Search...">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box clearfix">
                        <div class="table-responsive">
                            <table class="table user-list">
                                <thead>
                                    <tr style="text-align: center">            
                                        <th><span>FullName</span></th>
                                        <th><span>UserName</span></th>
                                        <th><span>Email</span></th>
                                        <th><span>Status</span></th>
                                        <th><span>Validate</span></th>
                                        <th><span>Feature</span></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${listT}" var="t">
                                    <tbody>                             
                                        <tr>
                                            <td>
                                                <img src="img/${t.profilePic}" alt="">
                                                <a href="#" class="highlight-text highlight-search" data-text="${t.fullName}">
                                                    ${t.fullName}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <a href="#" class="highlight-text highlight-search" data-text="${t.userName}">
                                                    ${t.userName}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <a href="#" class="highlight-text highlight-search" data-text="${t.email}">
                                                    ${t.email}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <c:if test="${t.active}">
                                                    <span class="label label-default">IsActive</span>
                                                </c:if>
                                                <c:if test="${!t.active}">
                                                    <span class="label label-default">None-Active</span>
                                                </c:if>
                                            </td>

                                            <td class="text-center">
                                                <c:if test="${t.validate==1}">
                                                    <span class="label label-default" style="color: #00FF00">Approved</span>
                                                </c:if>
                                                <c:if test="${t.validate!=1}">
                                                    <span class="label label-default" style="color: red">Pending</span>
                                                </c:if>
                                            </td>

                                            <td style="width: 20%; text-align: center">
                                                <c:if test="${t.validate==0}">                                                 
                                                    <a href="crudtutor?username=${t.userName}&type=1" class="table-link" title="Xác nhận yêu cầu">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                </c:if>

                                                                                               
                                                    <a href="crudtutor?username=${t.userName}&type=2" class="table-link" title="Từ chối hồ sơ">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-spinner fa-spin fa-stack-2x"></i>
                                                            <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                                                        </span>

                                                    </a>
                                                

                                                <a href="viewacc?id=${t.tutorID}&role=${t.role}" class="table-link" title="Xem thông tin cá nhân">
                                                    <span class="fa-stack">
                                                        <i class="fa fa-square fa-stack-2x"></i>
                                                        <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>

                                                <form action="crudtutor" method="POST" style="display: inline-block">
                                                    <input type="hidden" name="username" value="${t.userName}">
                                                    <button type="submit">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </button>
                                                </form>

                                            </td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                                <c:if test="${empty listT}">
                                    <th colspan="5" style="text-align: center;">
                                        <div style="display: flex; justify-content: center;">
                                            <h2 style="margin: 0;">Troll troll VN</h2>
                                        </div>
                                    </th>
                                </c:if>
                            </table>
                        </div>
                        <c:if test="${num > 1}">
                            <div>
                                <div class="hint-text">Showing <b>${page}</b> out of <b>${num}</b> entries</div>
                                <ul style="list-style-type: none">
                                    <c:choose>
                                        <c:when test="${empty txtS}">
                                            <div style="display: flex">
                                                <li><a style="text-decoration: none;margin-right: 10px" href="crudtutor?page=${page-1==0?(1):(page-1)}&validated=${validated}" class="page-link">Previous</a></li>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a style="text-decoration: none;margin-right: 10px" href="crudtutor?page=${i}&validated=${validated}" class="page-link">${i}</a></li>
                                                    </c:forEach>
                                                <li class="page-item"><a style="text-decoration: none;margin-left: 10px" href="crudtutor?page=${page+1>num?(num):(page+1)}&validated=${validated}" class="page-link">Next</a></li>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="display: flex">
                                                <li><a style="text-decoration: none;margin-right: 10px" href="crudtutor?page=${page-1==0?(1):(page-1)}&validated=${validated}&txtS=${txtS}" class="page-link">Previous</a></li>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a style="text-decoration: none;margin-right: 10px" href="crudtutor?page=${i}&validated=${validated}&txtS=${txtS}" class="page-link">${i}</a></li>
                                                    </c:forEach>
                                                <li class="page-item"><a style="text-decoration: none;margin-left: 10px" href="crudtutor?page=${page+1>num?(num):(page+1)}&validated=${validated}&txtS=${txtS}" class="page-link">Next</a></li>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Us End -->

        <!-- Footer Start -->

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var txtS = "${txtS}"; // Lấy giá trị của txtS từ hidden input
                var hightlight = document.querySelectorAll(".highlight-search");

                hightlight.forEach(function (element) {
                    var text = element.textContent;
                    var regex = new RegExp(txtS, 'gi');
                    // //g: flag: cờ hiệu- có tác dụng tìm tất cả các trường hợp của chuỗi này trong một chuỗi lớn
                    // 'i' để không phân biệt chữ hoa và chữ thường
                    if (regex.test(text)) {
                        element.innerHTML = text.replace(regex, function (match) {
                            return '<span style="background-color: yellow;">' + match + '</span>';
                        });
                    }
                });
            });
        </script>

    </body>

</html>
