package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity

data class User(
    val id: Int = -1,
    val name: String = "",
    val email: String = "",
    val password: String = "",
    val type: String = "normal",
)
