<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 00:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User" %>
<%
    User user = (User) session.getAttribute("auth");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }

%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orders Page</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Your selected items</h3>
                    <div class="cart-body"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Your details for order</h3>
                    <form action="">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label> <input
                                value="<%=user.getEmail() %>"
                                type="email" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll
                                never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Your name</label>
                            <input value="<%=user.getName() %>"
                                   type="text" class="form-control"
                                   id="name"
                                   aria-describedby="emailHelp"
                                   placeholder="Enter your name">

                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Your shipping address</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1"
                                      rows="3" placeholder="Enter your address"><%=user.getAddress() %></textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Your Contact Number</label>
                            <input
                                    value="<%=user.getPhone() %>"
                                    type="text" class="form-control" id="name"
                                    aria-describedby="emailHelp" placeholder="Enter your number">

                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-success">Order now</button>
                            <button class="btn btn-outline-primary">Continue shopping</button>
                        </div>
                    </form>

                </div>
            </div>

        </div>

    </div>
</div>
<%@include file="includes/modals.jsp" %>
<%@include file="includes/footer.jsp" %>
</body>
</html>
