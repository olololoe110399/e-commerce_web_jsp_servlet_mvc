package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.controller

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.UserModel
import java.io.IOException
import java.util.logging.Level
import java.util.logging.Logger
import javax.servlet.ServletException
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


@WebServlet(name = "loginController", value = ["/login"])
class LoginController : HttpServlet() {

    @Throws(ServletException::class, IOException::class)
    private fun processRequest(request: HttpServletRequest, response: HttpServletResponse) {
        response.contentType = "text/html;charset=UTF-8"
        try {
            val email = request.getParameter("login-email")
            val password = request.getParameter("login-password")
            val model = UserModel(DBConnect.instance)
            val user: User? = model.userLogin(email, password)
            user?.let {
                request.session.setAttribute("auth", user)
                when (user.type) {
                    "admin" -> {
                        request.session?.setAttribute("active", "admin")
                        response.sendRedirect("admin.jsp")
                        return
                    }
                    "normal" -> {
                        request.session?.setAttribute("active", "home")
                        response.sendRedirect("index.jsp")
                        return
                    }
                    else -> {
                        request.session?.setAttribute("message", "We have not identified user type !!!")
                        request.session?.setAttribute("active", "login")
                        response.sendRedirect("login.jsp")
                        return
                    }
                }
            } ?: kotlin.run {
                request.session.setAttribute("message", "*Invalid Email or Password!*")
                response.sendRedirect("login.jsp")
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
            request.session?.setAttribute("error", "${ex.printStackTrace()}")
            response.sendRedirect("error.jsp")
        }
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        if (req != null && resp != null) {
            processRequest(req, resp)
        }
    }

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req?.session?.setAttribute("active", "login")
        resp?.sendRedirect("login.jsp")
    }

    override fun destroy() {
    }
}
