package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.User
import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.Statement

class UserModel constructor(
    private val db: DBConnect
) {
    private var pst: Statement? = null
    private var rs: ResultSet? = null
    private var con: Connection? = null
    fun userLogin(email: String, password: String): User? {
        try {
            con = db.getConnection()
            val query = "SELECT * FROM User WHERE email=? AND password=?"
            pst = con?.prepareStatement(query)
            (pst as PreparedStatement?)?.setString(1, email)
            (pst as PreparedStatement?)?.setString(2, password)
            rs = (pst as PreparedStatement?)?.executeQuery()
            rs?.let {
                if (it.next()) {
                    return User(
                        id = it.getInt("id"),
                        name = it.getString("name"),
                        email = it.getString("email"),
                        phone = it.getString("phone"),
                        address = it.getString("address"),
                        avatar = it.getString("avatar"),
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

    fun saveUser(user: User) {
        try {
            con = db.getConnection()
            val query =
                "INSERT INTO User (name, email, password,type, avatar, phone, address  ) VALUES ('${user.name}','${user.email}','${user.password}','${user.type}','${user.avatar}','${user.phone}','${user.address}')"
            pst = con?.createStatement()
            pst?.executeUpdate(query)
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, rs)
        }
    }
}
