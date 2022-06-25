<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.ProductModel" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.CategoryModel" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Category" %>
<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.Helper" %><%--
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
<%@include file="/includes/navbar.jsp" %>
<%
    String cat = request.getParameter("category");

    ProductModel dao = new ProductModel(DBConnect.Companion.getInstance());
    List<Product> list = null;

    if (cat == null || cat.trim().equals("all")) {
        list = dao.getProducts();
    } else {
        int cid = Integer.parseInt(cat.trim());
        list = dao.getProductsById(cid);
    }

    CategoryModel cdao = new CategoryModel(DBConnect.Companion.getInstance());
    List<Category> clist = cdao.getCategories();
    Integer category_id = null;
    if (request.getParameter("category") != null) {
        request.setAttribute("active_category", request.getParameter("category"));
        if (!request.getParameter("category").equals("all")) {
            category_id = Integer.parseInt(request.getParameter("category"));
        }
    }

%>
<div class="row ml-2">
    <div class="col-md-2">
        <div class="list-group mt-4">
            <a href="index.jsp?category=all"
               class="list-group-item list-group-item-action  ${active_category == "all" || active_category == null ? 'active' : ''}">All
                Products</a>
            <%
                for (Category c : clist) {
            %>
            <%
                if (category_id != null && category_id == c.getId()) {
            %>
            <a href="index.jsp?category=<%=c.getId() %>"
               class="list-group-item list-group-item-action active"><%=c.getTitle()%>
            </a>
            <%
            } else {
            %>
            <a href="index.jsp?category=<%=c.getId() %>"
               class="list-group-item list-group-item-action"><%=c.getTitle()%>
            </a>
            <%
                    }
                }
            %>
        </div>
    </div>
    <div class="col-md-10">
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card-columns">
                    <%
                        for (Product p : list) {
                    %>
                    <div class="card">
                        <div class="container text-center">
                            <img alt="..." style="max-height:200px; max-width:200px; width:auto;"
                                 src="assets/uploads/<%= p.getPhoto()%>" class="card-img-top m-2">
                        </div>
                        <div class="class-body">
                            <h5 class="card-title ml-2"><%=p.getName() %>
                            </h5>
                            <p class="card-text ml-2"><%=Helper.Companion.getInstance().get10Words(p.getDescription()) %>
                            </p>
                        </div>
                        <div class="card-footer text-center">
                            <button class="btn custom-bg text-white"
                                    onclick="add_to_cart(<%=p.getId() %>,'<%=p.getName() %>','<%=p.getPriceAfterApplyDiscount() %>')">
                                Add to Cart
                            </button>
                            <button class="btn btn-outline-success">$ <%=p.getPriceAfterApplyDiscount()%>/- <span
                                    class="text-secondary discount-label"> <%=p.getPrice() %> <%=p.getDiscount() %>%</span>
                            </button>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/modals.jsp" %>
<%@include file="includes/footer.jsp" %>
</body>
</html>