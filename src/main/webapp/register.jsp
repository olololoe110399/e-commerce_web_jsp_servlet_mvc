<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 02:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart Register</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <h3 class="card-header text-center">Sign Up</h3>
        <div class="card-body">
            <%@include file="includes/message.jsp" %>
            <form action="register" method="post">
                <div class="form-group">
                    <label for="user">User Name</label>
                    <input type="text" name="user_name" class="form-control" id="user"  placeholder="Enter name here">
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email"name="user_email" class="form-control" id="email" placeholder="Enter email here">
                </div>
                <div class="form-group">
                    <label for="password">User Password</label>
                    <input type="password" name="user_password" class="form-control" id="password" placeholder="Enter password here">
                </div>
                <div class="form-group">
                    <label for="phone">User phone</label>
                    <input type="number" name="user_phone" class="form-control" id="phone" placeholder="Enter Phone number here">
                </div>
                <div class="form-group">
                    <%--@declare id="address"--%><label for="address">User address</label>
                    <textarea name="user_address" class="form-control" style="height:200px;"placeholder="Enter your Address"></textarea>
                </div>
                <div class="container text-center">
                    <button type="submit" class="btn btn-outline-success">Submit</button>
                    <button type="reset" value="clear" class="btn btn-outline-warning">Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
