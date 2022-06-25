package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect

fun main(args: Array<String>) {
    val model = ProductModel(DBConnect.instance)
//    model.getProducts().forEach {
//        println(it.category.toString())
//    }
}