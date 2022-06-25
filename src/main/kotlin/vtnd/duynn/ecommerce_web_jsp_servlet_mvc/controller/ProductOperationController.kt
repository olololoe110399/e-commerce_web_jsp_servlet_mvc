package vtnd.duynn.ecommerce_web_jsp_servlet_mvc.controller

import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.dbconnect.DBConnect
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Category
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.entity.Product
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.CategoryModel
import vtnd.duynn.ecommerce_web_jsp_servlet_mvc.model.ProductModel
import java.io.File
import java.io.FileOutputStream
import java.util.logging.Level
import java.util.logging.Logger
import javax.servlet.annotation.MultipartConfig
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.Part

@MultipartConfig
@WebServlet(name = "productOperationController", value = ["/product-operation"])
class ProductOperationController : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req?.session?.setAttribute("active", "admin")
        resp?.sendRedirect("admin.jsp")
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        try {
            val op = req?.getParameter("operation")
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, op)

            if (op?.trim() == "addCategory") {
                val title = req.getParameter("catTitle")
                val description = req.getParameter("catDescription")
                val category = Category(
                    title = title,
                    description = description
                )
                //category database save;
                val categoryModel = CategoryModel(DBConnect.instance)
                categoryModel.saveCategory(category)
                req.session.setAttribute("message", "Category added successfully!")
                resp?.sendRedirect("admin.jsp")
            } else if (op?.trim() == "addProduct") {
                Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, "addProduct")
                val pName = req.getParameter("pName")
                val pDesc = req.getParameter("pDesc")
                val pPrice = req.getParameter("pPrice").toInt()
                val pDiscount = req.getParameter("pDiscount").toInt()
                val pQuantity = req.getParameter("pQuantity").toInt()
                val catId = req.getParameter("catId").toInt()
                val part: Part = req.getPart("pPic")
                val product = Product(
                    name = pName,
                    description = pDesc,
                    price = pPrice,
                    discount = pDiscount,
                    quantity = pQuantity,
                    photo = part.submittedFileName,
                )
                val categoryModel = CategoryModel(DBConnect.instance)
                val category = categoryModel.getCategoryById(catId)
                product.category = category
                val productModel = ProductModel(DBConnect.instance)
                productModel.saveProduct(product)
                try {
                    val context = req.session.servletContext
                    val path =
                        context.getRealPath("assets") + File.separator + "uploads" + File.separator + part.submittedFileName
                    val fos = FileOutputStream(path)
                    print(context.getRealPath("assets"))
                    val `is` = part.inputStream
                    val data = ByteArray(`is`.available())
                    `is`.read(data)
                    fos.write(data)
                    fos.close()
                } catch (e: Exception) {
                    println("lỗi :${e.message}")
                    Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, e)
                    throw e
                }
                req.session.setAttribute("message", "Product added successfully!")
                resp?.sendRedirect("admin.jsp")
            } else {
                resp?.sendRedirect("404.jsp")
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.simpleName).log(Level.SEVERE, null, ex)
            req?.session?.setAttribute("error", "${ex.printStackTrace()}")
            resp?.sendRedirect("error.jsp")
        }
    }
}
