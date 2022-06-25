<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 00:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart Login</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <h3 class="card-header text-center">Sign In</h3>
        <div class="card-body">
            <%@include file="includes/message.jsp" %>
            <form action="login" method="post">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="login-email" class="form-control" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="login-password" class="form-control" placeholder="Password">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="includes/modals.jsp" %>
<%@include file="includes/footer.jsp" %>
</body>
</html>
