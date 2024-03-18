
$(document).ready(function () {
    // AJAX request to get amount Hùng
    $.ajax({
        url: "/SWP391/GetAmountRequestClass",
        type: "post",
        data: {},
        success: function (responseData) {
            document.getElementById("amountRequestClass").innerHTML = responseData;
        }
    });
});

$(document).ready(function () {
    // AJAX request to get amount Hùng
    $.ajax({
        url: "/SWP391/GetAmountRequestClass",
        type: "GET",
        data: {variableName: "tutor"},
        success: function (responseData) {
            document.getElementById("amountRequestTutor").innerHTML = responseData;
        }
    });
});

$(document).ready(function () {
    // AJAX request to get amount Hùng
    $.ajax({
        url: "/SWP391/GetAmountRequestClass",
        type: "GET",
        data: {variableName: "parent"},
        success: function (responseData) {
            document.getElementById("amountRequestParent").innerHTML = responseData;
        }
    });
});

$(document).ready(function () {
    // AJAX amountpending của Tùngg Tùngg
    $.ajax({
        url: "/SWP391/amountpending",
        type: "post",
        data: {},
        success: function (responseData) {
            document.getElementById("amountPending").innerHTML = responseData;
        }
    });
});
$(document).ready(function () {
    // AJAX request to get amount Hùng
    $.ajax({
        url: "/SWP391/GetAmountRequestClass",
        type: "GET",
        data: {variableName: "all"},
        success: function (responseData) {
            document.getElementById("amountRequestAll").innerHTML = responseData;
        }
    });
});

// Lấy URL hiện tại
var currentUrl = window.location.href;
// Kiểm tra và thêm class "active" cho liên kết tương ứng

if (currentUrl.indexOf("Home.jsp") !== -1) {

    document.getElementById("homeLink").classList.add("active");

} else if (currentUrl.indexOf("introduce.jsp") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("introduceLink").classList.add("active");

} else if (currentUrl.indexOf("ClassList") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("classLink").classList.add("active");

} else if (currentUrl.indexOf("listTutor") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("tutorLink").classList.add("active");

} else if (currentUrl.indexOf("addClass") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("createClassLink").classList.add("active");

} else if (currentUrl.indexOf("ManageClass") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("manageLink").classList.add("active");

} else if (currentUrl.indexOf("crudacc") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("manageAccountLink").classList.add("active");

} else if (currentUrl.indexOf("crudtutor") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("acceptTutorLink").classList.add("active");

} else if (currentUrl.indexOf("login") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("loginLink").classList.add("active");

} else if (currentUrl.indexOf("signup") !== -1) {
    document.getElementById("homeLink").classList.remove("active");
    document.getElementById("signupLink").classList.add("active");
}
// Thêm các trường hợp khác nếu cần thiết
// Lấy tham chiếu đến các phần tử
var manageLink = document.getElementById('manageLink');
var manageButtons = document.querySelector('.manage-buttons');

// Bắt sự kiện khi nhấp vào liên kết
manageLink.addEventListener('click', function () {
    // Hiển thị hoặc ẩn nút chọn
    if (manageButtons.style.display === 'none') {
        manageButtons.style.display = 'block';
    } else {
        manageButtons.style.display = 'none';
    }
});


