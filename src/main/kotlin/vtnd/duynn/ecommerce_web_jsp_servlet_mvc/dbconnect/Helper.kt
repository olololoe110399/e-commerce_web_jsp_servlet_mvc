package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect

import java.sql.Connection
import java.sql.ResultSet
import java.sql.Statement

class Helper {
    fun get10Words(desc: String): String {
        val strings = desc.split(" ".toRegex()).dropLastWhile { it.isEmpty() }.toTypedArray()
        return if (strings.size > 10) {
            val res = StringBuilder()
            for (i in 0..9) {
                res.append(strings[i]).append(" ")
            }
            "$res..."
        } else {
            "$desc..."
        }
    }

    fun getCounts(db: DBConnect): Map<String, Int?> {
        var pst: Statement? = null
        var con: Connection? = null
        var rs: ResultSet?
        val q1 = "Select count(*) from User"
        val q2 = "Select count(*) from Product"
        val map: MutableMap<String, Int?> = HashMap()

        try {
            con = db.getConnection()
            pst = con?.prepareStatement(q1)
            rs = pst?.executeQuery()
            rs?.let {
                while (it.next()) {
                    map["userCount"] = it.getInt(1)
                }
            }
            pst = con?.prepareStatement(q2)
            rs = pst?.executeQuery()
            rs?.let {
                while (it.next()) {
                    map["productCount"] = it.getInt(1)
                }
            }
            return map
        } catch (ex: Exception) {
            throw ex
        } finally {
            db.close(con, pst, null)
        }
    }

    private object Holder {
        val INSTANCE = Helper()
    }

    companion object {
        val instance: Helper = Holder.INSTANCE
    }
}