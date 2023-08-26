<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "you are not looged in. Please log in and try again!!");
        response.sendRedirect("login.jsp");
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin ! Do not access this page!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Pannel</title>
        <%@include file="components/common_csss_js.jsp"%>
    </head>
    <body>
        <%@include file="components/Navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <!-- first column -->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded" src="img/group.png" alt="" />
                            </div>
                            <h1>234</h1>
                            <h3 class="text-uppercase text-muted">Users</h3>

                        </div>

                    </div>

                  
                </div>
                <!--<!-- Second col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded" src="img/list.png" alt="" />
                            </div>

                            <h1>234</h1>
                            <h3 class="text-uppercase text-muted">Categories</h3>

                        </div>

                    </div>


                </div>

                <!-- third column  -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded" src="img/product.png" alt="" />
                            </div>
                            <h1>234</h1>
                            <h3 class="text-uppercase text-muted">Products</h3>

                        </div>

                    </div>


                </div>






            </div>

            <!-- Second row -->

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded" src="img/addlist.png" alt="" />
                            </div>
                            <h1>234</h1>
                            <h3 class="text-uppercase text-muted">Add Categories</h3>

                        </div>

                    </div>

                </div>  


                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-model">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded" src="img/addproduct.png" alt="" />
                            </div>
                            <h1>234</h1>
                            <h3 class="text-uppercase text-muted">Add product</h3>

                        </div>

                    </div>

                </div>  



            </div>

        </div>

        <!-- Add categories model -->

        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill categories details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" name="catTitle" required placeholder="Enter Category Title" class="form-control" />
                            </div>

                            <div class="form-group mt-3">
                                <textarea class="form-control" cols="15" rows="5" name="catDescription" required placeholder="Enter category description "></textarea>
                            </div>

                            <div class="contanier text-center mt-3">
                                <button class="btn btn-warning">Add Category</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- End categories model -->


        <!-- Start of Add category model-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct" />
                            
                            <div class="form-group">
                                <input type="text" name="pName" required placeholder="Enter Product Name" class="form-control" />
                            </div>

                            <div class="form-group mt-3">
                                <textarea class="form-control" cols="15" rows="5" name="pDescription" required placeholder="Enter product description "></textarea>
                            </div>

                            <div class="form-group mt-3">
                                <input type="number" name="pPrice" required placeholder="Enter Product Price" class="form-control" />
                            </div>
                            <div class="form-group mt-3">
                                <input type="number" name="pDiscount" required placeholder="Enter Product Discount" class="form-control" />
                            </div>

                            <div class="form-group mt-3">
                                <input type="number" name="pQuantity" required placeholder="Enter Product Quantity" class="form-control" />
                            </div>

                            <!--product category-->

                            <% CategoryDao catdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = catdao.getCategories();
                            %>

                            <div class="form-group mt-3">
                                <select name="catId" id="catId" class="form-control">

                                    <%
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%></option>   


                                    <%}

                                    %>





                                </select>

                                <div class="form-group mt-3">
                                    <label>Select Product Image</label>
                                    <input type="file" name="pphoto" required  class="form-control" />
                                </div>
                            </div>


                            <div class="contanier text-center mt-3">
                                <button class="btn btn-warning">Add Product</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
                                    

        <!--End of Add product model -->
        
        <%                       session.removeAttribute("message");

                    %>
    </body>
</html>
