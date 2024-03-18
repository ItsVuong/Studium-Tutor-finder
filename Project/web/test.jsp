<%-- 
    Document   : test
    Created on : Mar 12, 2024, 4:31:50 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/chosen.css">
        <title>JSP Page</title>
        <style>
            #location_chosen{
                width: 100px !important;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div class="w-50" style="width=600px" >
            <label>Địa điểm có thể dạy</label>
            <select data-placeholder="Chọn địa điểm" id="location" class="anyname form-select" style="width=600px"  multiple name='location'>
                <option value="1" selected>
                    abc
                </option>
                <option value="2"
                        selected>
                    abc
                </option>
                <option value="3"
                        selected>
                    abc
                </option>
            </select>
        </div>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/chosen.jquery.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script>
            $(".anyname").chosen();
        </script>
    </body>
</html>
