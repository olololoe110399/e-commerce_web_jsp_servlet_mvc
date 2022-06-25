<%@ page import="vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 01:19
  To change this template use File | Settings | File Templates.
--%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="home">E-Commerce Cart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link ${active == "home" ? 'font-weight-bold' : ''}"
                                        href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${active == "cart" ? 'font-weight-bold' : ''}" href="#"  data-toggle="modal" data-target="#cart">Cart
                    <span class="badge badge-danger cart-items">0</span> </a></li>
                <%
                    if (auth != null) {
                %>
                <li class="nav-item"><a class="nav-link ${active == "orders" ? 'font-weight-bold' : ''}"
                                        href="orders">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                <%
                    if (auth.getType().equals("admin")) {
                %>
                <li class="nav-item"><a class="nav-link ${active == "admin" ? 'font-weight-bold' : ''}" href="admin">Admin</a>
                </li>
                <%
                    }
                %>
                <%
                } else {
                %>
                <li class="nav-item"><a class="nav-link ${active == "register" ? 'font-weight-bold' : ''}"
                                        href="register">Register</a>
                </li>
                <li class="nav-item"><a class="nav-link ${active == "login" ? 'font-weight-bold' : ''}"
                                        href="login">Login</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
