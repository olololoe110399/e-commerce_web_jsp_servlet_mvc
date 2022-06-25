<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.CategoryModel" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Category" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.Helper" %>

<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 01:32
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) session.getAttribute("auth");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
    } else {
        if (user.getType().equals("normal")) {
            session.setAttribute("message", "You are not Admin !! Do not access this page");
            response.sendRedirect("home");
            return;
        }
    }
%>
<%
    CategoryModel cdao = new CategoryModel(DBConnect.Companion.getInstance());
    List<Category> list = cdao.getCategories();
    Map<String, Integer> m = Helper.Companion.getInstance().getCounts(DBConnect.Companion.getInstance());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container admin mt-3">
    <div class="container-fluid">
        <%@include file="includes/message.jsp" %>
    </div>
    <div class="row mt-3">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="assets/images/user.png" alt="user.png">
                    </div>
                    <h1><%=m.get("userCount") %>
                    <h1>Users</h1>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="assets/images/category.png" alt="user.png">

                    </div>
                    <h1><%= list.size() %>
                    <h1>Categories</h1>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="assets/images/product.png" alt="user.png">
                    </div>
                    <h1><%=m.get("productCount") %>
                    <h1>Product</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-6">
            <div class="card" data-toggle="modal"
                 data-target="#add-category-modal">
                <div class="card-body text-center ">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="assets/images/keys.png" alt="user.png">
                    </div>
                    <p class="mt-2">Click here to add new category</p>
                    <h1>Add Categories</h1>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card" data-toggle="modal"
                 data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="assets/images/add.png" alt="user.png">
                    </div>
                    <p class="mt-2">Click here to add new product</p>
                    <h1>Add Products</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Category Modal -->
<%@include file="includes/category_modal.jsp" %>
<!-- Product Modal -->
<%@include file="includes/product_modal.jsp" %>
<%--js--%>
<%@include file="includes/footer.jsp" %>
</body>
</html>
