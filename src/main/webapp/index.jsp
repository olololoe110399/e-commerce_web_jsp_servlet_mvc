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
    <title>Welcome to Shopping Card!</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">User Login</div>
        <div class="card-body">
            <form action="user-login" method="post">
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
<%@include file="includes/footer.jsp" %>
</body>
</html>