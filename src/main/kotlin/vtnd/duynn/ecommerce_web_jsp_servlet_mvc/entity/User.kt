package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity

data class User(
    val id: Int = -1,
    val name: String = "",
    val email: String = "",
    val password: String = "",
    val phone: String = "",
    val address: String = "",
    val avatar: String =  "default.jpg",
    val type: String = "normal",
)
