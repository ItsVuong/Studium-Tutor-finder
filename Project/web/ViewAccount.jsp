<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <link href="css/info.css" rel="stylesheet">

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
                }, 2000); // Trì hoãn 0.5 giây trước khi hiển thị thông báo
            };
        </script>
        <% } %>
        <!-- Modal Search End -->

        <!-- Contact Us Start -->
        <div class="container" style="margin-top: 40px">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <div class="user-avatar">
                                        <img src="img/${acc.profilePic}" alt="${acc.getProfilePic()}'s IMG">
                                        <input type="hidden" name="img" value="${acc.profilePic}">
                                    </div>
                                    <h5 class="user-name">${acc.userName}</h5>
                                    <h6 class="user-email">${acc.email}</h6>
                                </div>
                                <div class="about">
                                    <h5>About</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row gutters">                 
                                <c:choose>
                                    <c:when test="${acc.role==2}">
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <h6 class="mb-2 text-primary">Personal Details</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <h6 class="mb-2 text-primary">
                                                <c:if test = "${acc.isBlocked}">
                                                    Trạng thái: <span style="color: red;">Đang bị Block</span>
                                                </c:if>
                                                <c:if test = "${!acc.isBlocked}">
                                                    <c:if test = "${acc.validate==1}">                                                
                                                        Trạng thái: <span style="color: green;">Đã được duyệt</span>                                           
                                                    </c:if>
                                                    <c:if test = "${acc.validate==0}">
                                                        Trạng thái: <span style="color: red;">Hồ sơ đang đợi xét duyệt</span>
                                                    </c:if>    
                                                </c:if>
                                            </h6>
                                        </div>
                                    </c:when>

                                    <c:otherwise>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2 text-primary">Personal Details</h6>
                                        </div>
                                    </c:otherwise>

                                </c:choose>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control" name="fullname" readonly value="${acc.getFullName()}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>UserName</label>
                                        <input type="text" class="form-control" name="username" readonly value="${acc.userName}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email" readonly value="${acc.email}">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone" readonly value="${acc.phone}">
                                    </div>
                                </div>
                            </div>

                            <c:if test="${acc.role == 2}">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mt-3 mb-2 text-primary">Achievement</h6>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>School</label>
                                            <input type="text" class="form-control" name="school"  readonly value="${acc.school}">
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Major</label>
                                            <input type="text" class="form-control" name="major"  readonly value="${acc.major}">
                                        </div>
                                    </div>                            

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>GraduationYear</label>
                                            <input type="text" class="form-control" name="gy" readonly value="${acc.graduationYear}">
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>EducationLevel</label>
                                            <c:if test="${acc.educationLevel==1}">
                                                <input type="text" class="form-control" name="el" readonly value="Sinh viên">                                               
                                            </c:if>
                                            <c:if test="${acc.educationLevel==2}">
                                                <input type="text" class="form-control" name="el" readonly value="Đã tốt nghiệp">                                              
                                            </c:if>
                                            <c:if test="${acc.educationLevel==3}">
                                                <input type="text" class="form-control" name="el" readonly value="Giao vien">                                               
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <c:if test="${acc.gender}">
                                                <input type="text" class="form-control" readonly value="Nam" />
                                            </c:if>
                                            <c:if test="${!acc.gender}">
                                                <input type="text" class="form-control" readonly value="Nữ" />
                                            </c:if>                                        
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6">
                                        <div class="form-group">
                                            <label for="dob">DateOfBirth: </label>
                                            <input type="date" class="form-control" name="dob" id="dob" value="${acc.dob}" readonly />
                                        </div>
                                    </div>                           
                                </div>

                                <div class="row mt-2">
                                    <div class="form-group">
                                        <label for="intro">Introduction: </label>
                                        <textarea class="form-control" name="intro" id="intro" readonly style="height: 200px;">${acc.introduction}</textarea>
                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Ảnh chụp căn cước công dân mặt trước:</label><br>
                                            <img id="img1" class="idCard" src="img/${acc.idCard1}" alt="${acc.getProfilePic()}'s IMG">
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Ảnh thẻ sinh viên hoặc bằng cấp:</label><br>
                                            <img id="img2" class="idCard" src="img/${acc.idCard2}" alt="${acc.getProfilePic()}'s IMG">
                                        </div>
                                    </div>
                                </div>                                            

                                <div class="row">
                                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h3 class="fw-bolder">Vị trí gia sư</h3>
                                                <hr class="mt-2 mb-2"/>
                                                <div class="row">
                                                    <div class="col-md-12 my-2">
                                                        <label>Subject</label>
                                                        <input type="text" class="form-control" name="subject" readonly value="${tutorSubjectsString}">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>Location</label>
                                                        <input type="text" class="form-control" name="location" readonly value="${selectedLocationsString}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h3 class="fw-bolder" style="text-align: center" >Evaluate</h3>
                                                <hr class="mt-2 mb-2"/>
                                                <div class="row"> 
                                                    <div class="box">
                                                        <a id="open-popup" style="color: blue">Score Ratings and Reviews ---></a>
                                                    </div>

                                                    <div>Average Rating: ${averageRate} in 5 star</div>
                                                    <div class="stars">
                                                        <c:forEach begin="1" end="5" varStatus="star">
                                                            <i class="fas fa-star ${(star.index <= averageRate) ? 'text-warning' : 'text-muted'} me-2" style="font-size: 16px;"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <span class="text-muted" style="font-size: smaller;">(${feedbackCount} feedback)</span>                                                                                                       

                                                    <c:forEach items="${valueAndCountStar}" var="s">
                                                        <div>${s.key}
                                                            <input type="range" min="0" max="${feedbackCount}" value="${s.value}" disabled>
                                                        </div>
                                                    </c:forEach>                                                  

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--pop up-->                   
                                <div id="popup-overlay">
                                    <div id="popup-box" class="modal" style="overflow: scroll">
                                        <span id="close-popup" class="box-close">&times;</span> 
                                        <div class="content">
                                            <c:if test="${empty listTT}">
                                                <div style="color: red">No Feedback here</div>
                                            </c:if>                                         

                                            <c:forEach items="${listTT}" var="t">
                                                <div class="row d-flex justify-content-center">
                                                    <div class="col-md-12 col-lg-12 col-xl-12">
                                                        <div class="card mb-3">
                                                            <c:if test="${t.status==1}">
                                                                <div class="card-body" style="background-color: grey">
                                                                </c:if>
                                                                <c:if test="${t.status==2}">
                                                                    <div class="card-body">
                                                                    </c:if>
                                                                    <div class="d-flex flex-start">
                                                                        <c:forEach items="${accountList}" var="al">
                                                                            <c:if test="${t.parentID == al.id}">
                                                                                <img class="rounded-circle shadow-1-strong me-3"
                                                                                     src="img/${al.profilePic}" alt="avatar" width="40"
                                                                                     height="40" />

                                                                                <div class="w-100">
                                                                                    <div class="d-flex flex-column mb-3">
                                                                                        <div>
                                                                                            <h6 class="text-primary fw-bold mb-0"> 
                                                                                                <a href="viewacc?id=${al.id}&role=${al.role}">${al.userName}</a>                                                                                          
                                                                                            </c:if>
                                                                                        </c:forEach>   
                                                                                        <span class="text-muted" style="font-size: smaller;">${t.timeCreated}</span></h6>
                                                                                </div>
                                                                                <div>
                                                                                    <span class="text-dark">${t.detail}</span>
                                                                                </div>
                                                                            </div>

                                                                            <div class="d-flex justify-content-between align-items-center">

                                                                                <p class="small mb-0" style="color: #aaa;">
                                                                                    <a href="#!" class="link-grey" style="color: red;margin-right: 10px">Remove</a> 
                                                                                    <c:if test="${t.status==2}">
                                                                                    <a href="#!" class="link-grey" style="color: black">Show</a>
                                                                                    </c:if>
                                                                                    <c:if test="${t.status==1}">
                                                                                    <a href="#!" class="link-grey" style="color: yellowgreen;">Hide</a>
                                                                                    </c:if>
                                                                                </p>
                                                                                <div class="d-flex flex-row">
                                                                                    <c:forEach begin="1" end="5" varStatus="star">
                                                                                        <i class="fas fa-star ${(star.index <= t.rating) ? 'text-warning' : 'text-muted'} me-2" style="font-size: 16px;"></i>
                                                                                    </c:forEach>

                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                                        <div class="rate">
                                            <input type="radio" id="star5" name="rate" value="5" onchange="updateSelectedIds()" />
                                            <label for="star5" title="text">5 stars</label>
                                            <input type="radio" id="star4" name="rate" value="4" onchange="updateSelectedIds()" />
                                            <label for="star4" title="text">4 stars</label>
                                            <input type="radio" id="star3" name="rate" value="3" onchange="updateSelectedIds()" />
                                            <label for="star3" title="text">3 stars</label>
                                            <input type="radio" id="star2" name="rate" value="2" onchange="updateSelectedIds()" />
                                            <label for="star2" title="text">2 stars</label>
                                            <input type="radio" id="star1" name="rate" value="1" onchange="updateSelectedIds()" />
                                            <label for="star1" title="text">1 star</label>
                                        </div>
                                    </div>
                                    <div id="ratingValue" style="display: none;"></div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Ảnh thẻ sinh viên hoặc bằng cấp:</label><br>
                                            <img id="img2" class="idCard" src="img/${acc.idCard2}" alt="${acc.getProfilePic()}'s IMG">
                                        </div>
                                    </div>
                                </div>                                            

                                <div class="row">
                                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h3 class="fw-bolder">Vị trí gia sư</h3>
                                                <hr class="mt-2 mb-2"/>
                                                <div class="row">
                                                    <div class="col-md-12 my-2">
                                                        <label>Subject</label>
                                                        <input type="text" class="form-control" name="subject" readonly value="${tutorSubjectsString}">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>Location</label>
                                                        <input type="text" class="form-control" name="location" readonly value="${selectedLocationsString}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h3 class="fw-bolder" style="text-align: center" >Evaluate</h3>
                                                <hr class="mt-2 mb-2"/>
                                                <div class="row"> 
                                                    <div class="box">
                                                        <a id="open-popup" style="color: blue">View Feedback</a>
                                                    </div>
                                                    <div>Average Rating: ${averageRate} in 5 star</div>
                                                    <div class="stars">
                                                        <c:forEach begin="1" end="5" varStatus="star">
                                                            <i class="fas fa-star ${(star.index <= averageRate) ? 'text-warning' : 'text-muted'} me-2" style="font-size: 16px;"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <span class="text-muted" style="font-size: smaller;">(${feedbackCount} feedback)</span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>                                    

                            <div class="row gutters" style="margin-top: 20px">
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8">
                                    <div class="row">
                                        <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2">
                                            <button type="button" id="backButton" class="btn btn-secondary">Back</button>
                                        </div>
                                        <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2">
                                            <form action="viewacc" method="POST">
                                                <input type="hidden" name="username" value="${acc.userName}">
                                                <input type="hidden" name="isBlocked" value="${acc.isBlocked}">
                                                <c:if test="${!acc.isBlocked}">
                                                    <button type="submit" class="btn btn-primary" style="color: red;">Block</button>
                                                </c:if>
                                                <c:if test="${acc.isBlocked}">
                                                    <button type="submit" class="btn btn-primary" style="color: red;">Unblock</button>
                                                </c:if>
                                            </form>
                                        </div>

                                        <c:if test="${acc.role == 2 && acc.validate == 0 && !acc.isBlocked}">
                                            <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2">
                                                <a href="crudtutor?username=${acc.userName}&type=1">
                                                    <button type="button" id="submit" name="submit" class="btn btn-primary">Approved</button>
                                                </a>
                                            </div>
                                        </c:if>

                                        <c:if test="${acc.role==3}">
                                            <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2">
                                                <a href="viewhistoryclass?id=${acc.id}">                 
                                                    <span class="fa-stack">
                                                        <i class="fa-solid fa-school" style="font-size: 40px"></i>
                                                    </span>
                                                </a>
                                            </div>
                                        </c:if>

                                    <c:if test="${acc.role==3}">
                                        <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2">
                                            <a href="viewhistoryclass?id=${acc.id}">                 
                                                <span class="fa-stack">
                                                    <i class="fa-solid fa-school" style="font-size: 40px"></i>
                                                </span>
                                            </a>
                                        </div>
                                    </c:if>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <!-- Contact Us End -->

        <!-- Template Javascript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <script>
                                                document.getElementById("backButton").addEventListener("click", function () {
                                                    var successMessage = "Trở về trang trước đó";
                                                    if (successMessage) {
                                                        alert(successMessage);
                                                    }
                                                    window.history.back();
                                                });

        </script>

        <script>
            function updateSelectedIds() {
                var rating = document.querySelector('input[name="rate"]:checked').value;

                document.getElementById('ratingValue').innerText = 'Result: ' + rating;
                document.getElementById('ratingValue').style.display = 'block';

                if (rating) {
                    setTimeout(function () {
                        var successMessage = "Bạn đã đánh giá " + rating + " sao!";
                        alert(successMessage);
                    }, 2000);
                }
            }
        </script>

        <script>
            // Get references to the open and close buttons
            const openButton = document.getElementById('open-popup');
            const closeButton = document.getElementById('close-popup');
            const popupOverlay = document.getElementById('popup-overlay');
            const popupBox = document.getElementById('popup-box');

            // Function to open the popup
            function openPopup() {
                popupOverlay.style.display = 'block'; // Show the overlay
                popupBox.style.display = 'block'; // Show the popup box
            }

            // Function to close the popup
            function closePopup() {
                popupOverlay.style.display = 'none'; // Hide the overlay
                popupBox.style.display = 'none'; // Hide the popup box
            }

            // Add event listener to open button
            openButton.addEventListener('click', openPopup);

            // Add event listener to close button
            closeButton.addEventListener('click', closePopup);

            // Close the popup when clicking outside the popup box
            popupOverlay.addEventListener('click', function (event) {
                if (event.target === popupOverlay) {
                    closePopup();
                }
            });

        </script>



    </body>

</html>
