package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User
import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet


class UserModel constructor(
    private val db: DBConnect
) {
    private var query: String? = null
    private var pst: PreparedStatement? = null
    private var rs: ResultSet? = null
    private var con: Connection? = null
    fun userLogin(email: String, password: String): User? {
        try {
            con = db.getConnection()
            query = "select * from User where email=? and password=?"
            pst = con?.prepareStatement(query)
            pst?.setString(1, email)
            pst?.setString(2, password)
            rs = pst?.executeQuery()
            rs?.let {
                if (it.next()) {
                    return User(
                        id = it.getInt("id"),
                        name = it.getString("name"),
                        email = it.getString("email"),
                        type = it.getString("type")
                    )
                }
            }
        } catch (e: Exception) {
            throw e
        } finally {
            db.close(con, pst, rs)
        }
        return null
    }
}
