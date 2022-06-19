<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 01:33
  To change this template use File | Settings | File Templates.
--%>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <%=message %>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message");
    }
%>