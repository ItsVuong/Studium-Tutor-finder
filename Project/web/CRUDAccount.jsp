<%-- 
    Document   : SignUpAccount
    Created on : Jan 14, 2024, 11:31:33 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <div class="col-lg-5">
                    <form action="crudacc" method="GET" class="mb-1">
                        <small for="profile-picture" class="form-label">UserType</small>
                        <select name="role" class="col-md-2 text-center" style="border-radius: 15px; height:  35px; width: 100px">
                            <option value="5" ${role == '5' ? 'selected' : ''}>All</option>
                            <option value="1" ${role == '1' ? 'selected' : ''}>Admin</option>
                            <option value="2" ${role == '2' ? 'selected' : ''}>Tutor</option>   
                            <option value="3" ${role == '3' ? 'selected' : ''}>Parent</option>  
                            <option value="4" ${role == '4' ? 'selected' : ''}>Blocked</option>               
                        </select>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="submit" class="btn btn-second">Result: ${pagingsize}</button>
                        <div id="selectedIdsDiv" style="display: none;"></div>
                    </form>
                </div>

                <div class="col-lg-6">
                    <form action="crudacc" method="GET"class="mb-1">
                        <div class="input-group">
                            <input type="hidden" name="role" value="${role}">
                            <input type="hidden" name="isBlocked" value="${isBlocked}">
                            <input type="text" class="form-control" name="txtS" value="${txtS}" placeholder="Search...">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-1">
                    <div id="popup" class="popup" style="display: none;">
                        <div class="popup-content">
                            <button id="confirmButton">  <a href="#" class="table-link" id="selectAllAccounts">
                                    <span class="fa-stack">
                                        <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a></button>
                            <button id="cancelButton" style="background-color: red"><a href="#" class="table-link" id="deselectAllAccounts">
                                    <span class="fa-stack">
                                        <i class="fa fa-times fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a></button>
                        </div>

                    </div>

                    <div class="ellipsis-icon" id="ellipsisIcon" >
                        <span class="lines line-1"></span>
                        <span class="lines line-2"></span>
                        <span class="lines line-3"></span>
                    </div>
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
                                        <th><span>Last Login</span></th>
                                        <th><span>Phone</span></th>
                                        <th><span>Email</span></th>
                                        <th><span>Feature</span></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${listP}" var="p">
                                    <tbody>

                                        <tr>
                                            <td>
                                                <img src="img/${p.profilePic}" alt="">
                                                <a href="" class="highlight-text highlight-search" data-text="${p.fullName}">
                                                    ${p.fullName}  
                                                </a>
                                                <c:if test="${p.role == 1}">
                                                    <span class="user-subhead">Admin</span>
                                                </c:if>
                                                <c:if test="${p.role == 2}">
                                                    <span class="user-subhead">Tutor</span>
                                                </c:if>
                                                <c:if test="${p.role == 3}">
                                                    <span class="user-subhead">Parent</span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="" class="highlight-text highlight-search" data-text="${p.userName}">
                                                    ${p.userName}  
                                                </a>
                                                <span class="user-subhead">${p.dateCreated}</span>
                                            </td>

                                            <td class="text-center">
                                                <span class="">${p.lastLogin}</span>
                                            </td>
                                            <td class="text-center">
                                                <span class="label label-default highlight-search" data-text="${p.phone}">
                                                    ${p.phone}
                                                </span>
                                            </td>

                                            <td class="text-center">
                                                <a href="#" class="highlight-text highlight-search" data-text="${p.email}">
                                                    ${p.email}
                                                </a>
                                            </td>

                                            <td style="text-align: center">
                                                <c:choose>
                                                    <c:when test="${userObj.userName == p.userName}">
                                                        <a href="account">
                                                            <input type="submit" class="w-100 btn btn-primary border-0 py-3"style="background-color: #0080ff; color: white" value="Xem thông tin" />
                                                        </a>
                                                    </c:when>                                                                                        

                                                    <c:otherwise>
                                                        <a href="viewacc?id=${p.id}&role=${p.role}" class="table-link" title="Xem thông tin cá nhân">
                                                            <span class="fa-stack">
                                                                <i class="fa fa-square fa-stack-2x"></i>
                                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                            </span>
                                                        </a>    

                                                        <span class="delete-icon" style="display: none;">                                                               
                                                        </span>
                                                        <input type="checkbox" class="accidCheckbox" name="accid" value="${p.id}">
                                                        <style>
                                                            input[type="checkbox"]:checked + .delete-icon {
                                                                display: inline-block;
                                                            }

                                                            .delete-icon {
                                                                display: none;
                                                                color: red; /* Màu của biểu tượng thùng rác */
                                                            }
                                                        </style>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                                <c:if test="${empty listP}">
                                    <th colspan="5" style="text-align: center;">
                                        <div style="display: flex; justify-content: center;">
                                            <h2 style="margin: 0;">Troll troll VN</h2>
                                        </div>
                                    </th>
                                </c:if>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <c:if test="${num > 1}">
                                    <div>
                                        <div class="hint-text">Showing <b>${page}</b> out of <b>${num}</b> entries</div>
                                        <ul style="list-style-type: none">
                                            <c:choose>
                                                <c:when test="${empty txtS}">
                                                    <div style="display: flex">
                                                        <li><a style="text-decoration: none;margin-right: 10px" href="crudacc?page=${page-1==0?(1):(page-1)}&role=${role}&isBlocked=${isBlocked}" class="page-link">Previous</a></li>
                                                            <c:forEach begin="${1}" end="${num}" var="i">
                                                            <li class="page-item"><a style="text-decoration: none;margin-right: 10px" href="crudacc?page=${i}&role=${role}&isBlocked=${isBlocked}" class="page-link">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item"><a style="text-decoration: none;margin-left: 10px" href="crudacc?page=${page+1>num?(num):(page+1)}&role=${role}&isBlocked=${isBlocked}" class="page-link">Next</a></li>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="display: flex">
                                                        <li><a style="text-decoration: none;margin-right: 10px" href="crudacc?page=${page-1==0?(1):(page-1)}&role=${role}&isBlocked=${isBlocked}&txtS=${txtS}" class="page-link">Previous</a></li>
                                                            <c:forEach begin="${1}" end="${num}" var="i">
                                                            <li class="page-item"><a style="text-decoration: none;margin-right: 10px" href="crudacc?page=${i}&role=${role}&isBlocked=${isBlocked}&txtS=${txtS}" class="page-link">${i}</a></li>
                                                            </c:forEach>
                                                        <li class="page-item"><a style="text-decoration: none;margin-left: 10px" href="crudacc?page=${page+1>num?(num):(page+1)}&role=${role}&isBlocked=${isBlocked}&txtS=${txtS}" class="page-link">Next</a></li>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </ul>

                                    </div>
                                </c:if>
                            </div>

                            <div class="col-6">
                                <div class="control-panel" id="controlPanel" style="display: none; border-radius: 20px"">
                                    <table class="table user-list" >
                                        <h3 style="text-align: center">Control Panel</h3>
                                        <thead>
                                            <tr style="text-align: center">
                                                <c:if test="${!isBlocked}">
                                                    <th><span>Block</span></th>        
                                                    </c:if>
                                                    <c:if test="${isBlocked}">
                                                    <th><span>UnBlock</span></th>        
                                                    </c:if>
<!--                                                <th><span>Download Data</span></th>     
                                                <th><span>Send Email</span></th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr style="text-align: center">

                                                <th>
                                                    <form id="accidForm" action="crudacc" method="POST">
                                                        <input type="hidden" id="selectedIdsInput" name="selectedIds">
                                                        <input type="hidden" name="isBlocked" value="${isBlocked}">
                                                        <input type="hidden" name="role" value="${role}">
                                                        <button type="submit">
                                                            <span class="fa-stack">
                                                                <i class="fa fa-square fa-stack-2x"></i>
                                                                <c:if test="${!isBlocked}">
                                                                    <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                                </c:if>
                                                                <c:if test="${isBlocked}">
                                                                    <i class="fas fa-history fa-stack-1x fa-inverse"></i>
                                                                </c:if>
                                                            </span>
                                                        </button>
                                                    </form>
                                                </th>

<!--                                                <th><a href="" class="table-link" title="Download Data">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-download fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                </th>      

                                                <th><a href="" class="table-link" title="Send Email">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                </th>   -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Us End -->

        <!-- Footer Start -->

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>    // dành cho phần search
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

        <script>  // Dành cho phần giao diện chỉnh sửa
            document.addEventListener('DOMContentLoaded', function () {
                const accidCheckboxes = document.querySelectorAll('.accidCheckbox');
                const selectedIdsDiv = document.getElementById('selectedIdsDiv');
                const controlPanel = document.getElementById('controlPanel');
                const popup = document.getElementById('popup');
                const selectAllButton = document.getElementById('selectAllAccounts');
                const deselectAllButton = document.getElementById('deselectAllAccounts');

                accidCheckboxes.forEach(function (checkbox) {
                    checkbox.addEventListener('change', handleCheckboxChange);
                });

                selectAllButton.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleCheckboxes(true);
                    handleCheckboxChange(); // Đảm bảo rằng Control Panel được cập nhật
                });

                deselectAllButton.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleCheckboxes(false);
                    handleCheckboxChange(); // Đảm bảo rằng Control Panel được cập nhật
                });

                document.getElementById('ellipsisIcon').addEventListener('click', function (event) {
                    popup.style.display = popup.style.display === 'block' ? 'none' : 'block';
                    event.stopPropagation();  //Bấm vào ... hiện pop up 
                });

                document.addEventListener('click', function () { // ẩn pop up khi bấm ra ngoài
                    if (popup.style.display === 'block') {
                        popup.style.display = 'none';
                    }
                });

                function handleCheckboxChange() { //chọn selectAll hoặc deSelect hiện/ẩn controlPanel
                    updateSelectedIds();
                    controlPanel.style.display = Array.from(accidCheckboxes).some(checkbox => checkbox.checked) ? 'block' : 'none';
                }//ktra xem có ít nhất có 1 checkbox dc chọn ko

                function toggleCheckboxes(checked) { //chọn hoặc bỏ chọn tất cả các checkbox.
                    accidCheckboxes.forEach(function (checkbox) {
                        checkbox.checked = checked;
                    });
                }

                function updateSelectedIds() {//Hiển thị các id
                    const selectedIds = Array.from(accidCheckboxes)
                            .filter(checkbox => checkbox.checked)
                            .map(checkbox => checkbox.value);

                    selectedIdsDiv.style.display = selectedIds.length > 0 ? 'block' : 'none';
                    selectedIdsDiv.textContent = selectedIds.length > 0 ? 'Selected p.id: ' + selectedIds.join(', ') : '';
                }

                const selectedIdsInput = document.getElementById('selectedIdsInput');
                const accidForm = document.getElementById('accidForm');

                // Sử dụng sự kiện submit của form để thêm các id đã chọn vào phần tử input ẩn trước khi gửi form
                accidForm.addEventListener('submit', function (event) {
                    // Ngăn chặn form gửi đi ngay lập tức
                    event.preventDefault();

                    // Tạo một mảng để chứa các id đã chọn
                    const selectedIds = [];

                    // Lặp qua danh sách các accidCheckbox và thêm id vào mảng selectedIds nếu checkbox tương ứng được chọn
                    accidCheckboxes.forEach(function (checkbox) {
                        if (checkbox.checked) {
                            selectedIds.push(checkbox.value);
                        }
                    });

                    // Cập nhật giá trị của phần tử input ẩn với các id đã chọn
                    selectedIdsInput.value = selectedIds.join(',');

                    // Gửi form
                    accidForm.submit();  //string "1,2,3"
                });
            });


        </script>


    </body>

</html>
