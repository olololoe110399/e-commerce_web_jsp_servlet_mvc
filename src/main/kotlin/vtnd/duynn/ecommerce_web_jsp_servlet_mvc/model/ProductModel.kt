package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Category
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Product
import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement

class ProductModel constructor(
    private val db: DBConnect
) {
    private var pst: Statement? = null
    private var rs: ResultSet? = null
    private var con: Connection? = null

    fun saveProduct(pro: Product) {
        val query =
            "INSERT INTO Product (name, description,discount,price,quantity,photo, c_id ) " +
                    "VALUES ('${pro.name}','${pro.description}','${pro.discount}','${pro.price}','${pro.quantity}','${pro.photo}','${pro.category?.id}')"
        try {
            con = db.getConnection()
            pst = con?.createStatement()
            pst?.executeUpdate(query)
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, null)
        }
    }

    fun getProducts(): List<Product> {
        val query = "SELECT * FROM Product p INNER JOIN Category c ON p.c_id = c.id"
        try {
            val sl = arrayListOf<Product>()
            con = db.getConnection()
            pst = con?.prepareStatement(query)
            rs = (pst as PreparedStatement?)?.executeQuery()
            rs?.let {
                while (it.next()) {
                    sl.add(
                        Product(
                            id = it.getInt("id"),
                            name = it.getString("name"),
                            description = it.getString("description"),
                            discount = it.getInt("discount"),
                            price = it.getInt("price"),
                            quantity = it.getInt("quantity"),
                            photo = it.getString("photo"),
                            category = Category(
                                id = it.getInt("c.id"),
                                title = it.getString("c.title"),
                                description = it.getString("c.description"),
                            )
                        )
                    )
                }
            }
            return sl
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, rs)
        }
    }


    fun getProductsById(id: Int): List<Product> {
        val query = "SELECT * FROM Product p INNER JOIN Category c ON p.c_id = c.id WHERE c.id=?"
        try {
            val sl = arrayListOf<Product>()
            con = db.getConnection()
            pst = con?.prepareStatement(query)
            (pst as PreparedStatement?)?.setInt(1, id)
            rs = (pst as PreparedStatement?)?.executeQuery()
            rs?.let {
                while (it.next()) {
                    sl.add(
                        Product(
                            id = it.getInt("id"),
                            name = it.getString("name"),
                            description = it.getString("description"),
                            discount = it.getInt("discount"),
                            price = it.getInt("price"),
                            quantity = it.getInt("quantity"),
                            photo = it.getString("photo"),
                            category = Category(
                                id = it.getInt("c.id"),
                                title = it.getString("c.title"),
                                description = it.getString("c.description"),
                            )
                        )
                    )
                }
            }
            return sl
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, rs)
        }
    }
}