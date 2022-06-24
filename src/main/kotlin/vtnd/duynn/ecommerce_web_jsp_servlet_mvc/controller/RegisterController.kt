package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.controller

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.UserModel
import java.util.logging.Level
import java.util.logging.Logger
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


    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        try {
            resp?.contentType = "text/html"
            val userName = req?.getParameter("user_name")
            val userEmail = req?.getParameter("user_email")
            val userPassword = req?.getParameter("user_password")
            val userPhone = req?.getParameter("user_phone")
            val userAddress = req?.getParameter("user_address")
            val user = User(
                name = userName ?: "",
                email = userEmail ?: "",
                password = userPassword ?: "",
                phone = userPhone ?: "",
                address = userAddress ?: "",
            )
            val errors = validateUserRegister(user)
            if (errors.isEmpty()) {
                val model = UserModel(DBConnect.instance)
                model.saveUser(user)
                req?.session?.setAttribute(
                    "message",
                    "*Registration SuccessFul !!"
                )
                resp?.sendRedirect("login.jsp")
            } else {
                req?.session?.setAttribute(
                    "message",
                    "*Registration failed !! ${errors.first()}"
                )
                resp?.sendRedirect("register.jsp")
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
            req?.session?.setAttribute("error", "${ex.printStackTrace()}")
            resp?.sendRedirect("error.jsp")
        }
    }

    private fun validateUserRegister(user: User): List<String> {
        val errors = mutableListOf<String>()
        if (user.name.trim().isEmpty()) {
            errors.add("User not null or empty!")
        }
        if (user.email.trim().isEmpty()) {
            errors.add("Email not null or empty!")
        }
        if (user.password.trim().isEmpty()) {
            errors.add("Password not null or empty!")
        }
        if (user.password.trim().length <= 6) {
            errors.add("Password must be more than 6 characters!")
        }

        return errors
    }
}
