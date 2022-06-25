<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 25.06.22
  Time: 01:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    String exceptionMessage = exception.getMessage();
%>
<html>
<head>
    <title>Error Page</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<div class="d-flex align-items-center justify-content-center vh-100">
    <div class="text-center">
        <h1 class="display-1 fw-bold">Error</h1>
        <p class="fs-3"><span class="text-danger">Opps!</span> Page error.</p>
        <c:if test="${not empty error}">
            <p class="lead">
                    ${error}
            </p>
        </c:if>
        <%
            if (exceptionMessage != null) {
        %>
        <p class="lead">
            <%=exceptionMessage %>
        </p>
        <%
            }
        %>
        <a href="home" class="btn btn-primary">Go Home</a>
    </div>
</div>
</body>
</html>
