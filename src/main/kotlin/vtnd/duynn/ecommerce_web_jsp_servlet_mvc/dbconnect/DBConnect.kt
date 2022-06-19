package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect

import java.sql.*
import java.util.logging.Level
import java.util.logging.Logger

class DBConnect {
    private var connection: Connection? = null

    @Throws(SQLException::class, ClassNotFoundException::class)
    fun getConnection(): Connection? {
        try {
            Class.forName(DatabaseConfig.DEVICE_NAME)
            connection = DriverManager.getConnection(
                "${DatabaseConfig.URL}?${DatabaseConfig.UNICODE}",
                DatabaseConfig.UNAME,
                DatabaseConfig.UPASS
            )
        } catch (ex: ClassNotFoundException) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
        } catch (ex: SQLException) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
        }
        return connection
    }

    @Throws(SQLException::class)
    fun close(conn: Connection?, ps: Statement?, rs: ResultSet?) {
        if (rs != null && !rs.isClosed) {
            rs.close()
        }
        if (ps != null && !ps.isClosed) {
            ps.close()
        }
        if (conn != null && !conn.isClosed) {
            conn.close()
        }
    }

    private object Holder {
        val INSTANCE = DBConnect()
    }

    companion object {
        val instance: DBConnect = Holder.INSTANCE
    }
}
