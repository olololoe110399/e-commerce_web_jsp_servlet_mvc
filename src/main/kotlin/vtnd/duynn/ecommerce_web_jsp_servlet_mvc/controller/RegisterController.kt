package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.controller

import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@WebServlet(name = "registerController", value = ["/register"])
class RegisterController : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req?.session?.setAttribute("active", "register")
        resp?.sendRedirect("register.jsp")
    }
}
