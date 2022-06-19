package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.controller

import java.io.IOException
import java.util.logging.Level
import java.util.logging.Logger
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


@WebServlet(name = "logoutController", value = ["/logout"])
class LogoutController : HttpServlet() {

    @Throws(IOException::class)
    private fun processRequest(request: HttpServletRequest, response: HttpServletResponse) {
        response.contentType = "text/html;charset=UTF-8"
        try {
            if (request.session.getAttribute("auth") != null) {
                request.session.removeAttribute("auth")
                request?.session?.setAttribute("active", "login")
                response.sendRedirect("login.jsp")
            } else {
                request?.session?.setAttribute("active", "home")
                response.sendRedirect("index.jsp")
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
            response.sendRedirect("error.jsp")
        }
    }

    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        processRequest(request, response)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        if (req != null && resp != null) {
            processRequest(req, resp);
        }
    }

    override fun destroy() {
    }
}
