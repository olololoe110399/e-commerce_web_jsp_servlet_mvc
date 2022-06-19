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
<
<div class="row mt-5">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <%@include file="includes/message.jsp" %>
            <div class="card-body px-5">
                <h3 class="text-center my-3">Sign Up here</h3>
                <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label for="user">User Name</label>
                        <input type="text" name="user_name" class="form-control" id="user"
                               placeholder="Enter name here">
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" name="user_email" class="form-control" id="email"
                               placeholder="Enter email here">
                    </div>
                    <div class="form-group">
                        <label for="password">User Password</label>
                        <input type="password" name="user_password" class="form-control" id="password"
                               placeholder="Enter password here">
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success">Submit</button>
                        <button type="reset" value="clear" class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
