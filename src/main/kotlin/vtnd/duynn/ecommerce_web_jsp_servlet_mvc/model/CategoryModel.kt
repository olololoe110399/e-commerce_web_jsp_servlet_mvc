package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Category
import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement

class CategoryModel constructor(
    private val db: DBConnect
) {
    private var pst: Statement? = null
    private var rs: ResultSet? = null
    private var con: Connection? = null

    fun saveCategory(cat: Category) {
        val query =
            "INSERT INTO Category (title, description) VALUES ('${cat.title}','${cat.description}')"
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


    fun getCategories(): List<Category> {
        val query = "SELECT * FROM Category"
        try {
            val sl = arrayListOf<Category>()
            con = db.getConnection()
            pst = con?.prepareStatement(query)
            rs = (pst as PreparedStatement?)?.executeQuery()
            rs?.let {
                while (it.next()) {
                    sl.add(
                        Category(
                            id = it.getInt(1),
                            title = it.getString(2),
                            description = it.getString(3),
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

    fun getCategoryById(id: Int): Category? {
        val query = "SELECT * FROM Category WHERE id= $id";
        try {
            var model: Category? = null
            con = db.getConnection()
            pst = con?.createStatement()
            rs = pst?.executeQuery(query)
            rs?.let {
                while (it.next()) {
                    model = Category(
                        id = it.getInt(1),
                        title = it.getString(2),
                        description = it.getString(3),
                    )
                }
            }
            return model
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, rs)
        }
    }
}