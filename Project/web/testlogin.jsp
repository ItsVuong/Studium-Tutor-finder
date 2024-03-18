<%-- 
    Document   : testlogin
    Created on : Jan 20, 2024, 5:49:11 PM
    Author     : Asus
--%>
<<<<<<< HEAD
=======
<%@page import="DAL.*"%>
<%@page import="Models.*"%>
<%@page import="java.util.*"%>

>>>>>>> Hung
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${user.getName()}</title>
    </head>
    <body>
        <h1>ten: ${userObj.getName()}</h1>
        <h1>sdt: ${userObj.getPhone()}</h1>
    </body>
</html>
