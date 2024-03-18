$(document).ready(function () {
    // AJAX amountpending của Tùngg Tùngg
    $.ajax({
        url: "/SWP391/rating",
        type: "post",
        data: {},
        success: function (responseData) {
            document.getElementById("ratingForm").innerHTML = responseData;
        }
    });
});