<%--
  Created by IntelliJ IDEA.
  User: nguyenngocduy
  Date: 25.06.22
  Time: 02:45
  To change this template use File | Settings | File Templates.
--%>
<div class="modal fade" id="add-category-modal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="product-operation" method="post">
                    <input type="hidden" name="operation" value="addCategory"/>
                    <div class="form-group">
                        <input type="text" class="form-control" name="catTitle" placeholder="Enter category title"
                               required/>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 300px" class="form-control" placeholder="Enter category description"
                                  name="catDescription" required></textarea>
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
