<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 20.06.22
  Time: 01:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container admin mt-3">
    <div class="container-fluid">
        <%@include file="includes/message.jsp" %>
    </div>

    <div class="row mt-3">
        <!-- //first column -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="images/user.png" alt="user.png">
                    </div>
                    <h1>0</h1>
                    <h1>Users</h1>
                </div>
            </div>
        </div>

        <!-- //second column -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="images/category.png" alt="user.png">

                    </div>
                    <h1>0</h1>
                    <h1>Categories</h1>
                </div>
            </div>
        </div>

        <!-- //third column  -->
        <div class="col-md-4">

            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="images/product.png" alt="user.png">

                    </div>
                    <h1>0</h1>
                    <h1>Product</h1>

                </div>
            </div>
        </div>


    </div>

    <!-- second row -->
    <div class="row mt-3">
        <!-- first column -->
        <div class="col-md-6">
            <div class="card" data-toggle="modal"
                 data-target="#add-category-modal">
                <div class="card-body text-center ">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="images/keys.png" alt="user.png">
                    </div>
                    <p class="mt-2">Click here to add new category</p>
                    <h1>Add Categories</h1>
                </div>
            </div>
        </div>

        <!-- second column -->
        <div class="col-md-6">
            <div class="card" data-toggle="modal"
                 data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle"
                             src="images/add.png" alt="user.png">
                    </div>
                    <p class="mt-2">Click here to add new product</p>
                    <h1>Add Products</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category
                    Details</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post">

                    <input type="hidden" name="operation" value="addCategory">

                    <div class="form-group">
                        <input type="text" class="form-control" name="catTitle"
                               placeholder="Enter category title" required/>

                    </div>
                    <div class="form-group">
							<textarea style="height: 300px" class="form-control"
                                      placeholder="Enter category description" name="catDescription"
                                      required></textarea>

                    </div>

                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success">Add
                            Category
                        </button>
                        <button type="submit" class="btn btn-secondary"
                                data-dismiss="modal">Close
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Products
                    details</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- form -->
                <form action="ProductOperationServlet" method="post"
                      enctype="multipart/form-data">

                    <input type="hidden" name="operation" value="addProduct">

                    <div class="form-group">
                        <input type="text" class="form-control"
                               placeholder="Enter title of product" name="pName" required/>

                    </div>
                    <div class="form-group">
							<textarea style="height: 150px;" class="form-control"
                                      placeholder="Enter product description" name="pDesc" required></textarea>
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control"
                               placeholder="Price of the product" name="pPrice" required/>

                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control"
                               placeholder="Enter product discount" name="pDiscount" required/>

                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control"
                               placeholder="Enter product quantity" name="pQuantity" required/>

                    </div>


                    <!--  product categories -->
                    <div class="form-group">
                        <select name="catId" class="form-control" id="">

                            <option value="Laptop">Laptop
                            </option>
                        </select>


                        <div class="form-group">
                            <label for="pPic">Select Picture of product</label><br> <input
                                type="file" id="pPic" name="pPic" required/>

                        </div>


                    </div>

                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add Product</button>
                    </div>

                </form>

                <!-- end form -->

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close
                </button>

            </div>
        </div>
    </div>
</div>

<%@include file="includes/modals.jsp" %>
</body>
</html>
