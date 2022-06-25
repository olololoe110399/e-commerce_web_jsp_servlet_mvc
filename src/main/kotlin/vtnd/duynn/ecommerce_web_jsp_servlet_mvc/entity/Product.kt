package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity

data class Product(
    val id: Int = -1,
    val name: String = "",
    val description: String = "",
    val price: Int = -1,
    val discount: Int = -1,
    val quantity: Int = -1,
    val photo: String = "default.png",
    var category: Category? = null
) {
    fun getPriceAfterApplyDiscount(): Int {
        val d = (this.discount / 100.0 * this.price).toInt()
        return this.price - d
    }
}
