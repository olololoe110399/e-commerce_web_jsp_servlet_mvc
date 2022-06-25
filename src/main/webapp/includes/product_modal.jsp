<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 25.06.22
  Time: 02:48
  To change this template use File | Settings | File Templates.
--%>
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
                <form action="product-operation" method="post" enctype="multipart/form-data">
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
                    <div class="form-group">
                        <select name="catId" class="form-control" id="">
                            <%
                                for (Category c : list) {
                            %>
                            <option value="<%=c.getId()%>"><%=c.getTitle()%>
                            </option>
                            <%
                                }
                            %>
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
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close
                </button>

            </div>
        </div>
    </div>
</div>