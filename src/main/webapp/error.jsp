<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 02:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 Error Page</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<div class="d-flex align-items-center justify-content-center vh-100">
    <div class="text-center">
        <h1 class="display-1 fw-bold">404</h1>
        <p class="fs-3"><span class="text-danger">Opps!</span> Page not found.</p>
        <p class="lead">
            The page you’re looking for doesn’t exist.
        </p>
        <a href="home" class="btn btn-primary">Go Home</a>
    </div>
</div>
</body>
</html>
