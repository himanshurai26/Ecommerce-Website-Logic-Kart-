
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_csss_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-cart/Home</title>

    </head>
    <body>
        <%@include file="components/Navbar.jsp" %>
        <div class="container-fluid ">
            <div class="row mt-3 mx-2 ">
                
                <%  String cate = request.getParameter("category");
                 // out.println(cate);
                   ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                   
                      List<Product> list = null;
                  
                      if(cate == null){
                      list= dao.getAllProduct();
                    }
                     else if (cate.trim().equals("all")) {
                   list= dao.getAllProduct();
               }else{
                  int cateId =Integer.parseInt(cate.trim());
                   list = dao.getAllProductById(cateId);
                 }    
                    
                       
                    
                    

                    CategoryDao dao1 = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list1 = dao1.getCategories();


                %>


                <!--//show categories-->
                <div class="col-md-2">
                    <div class="list-group">
                        <button type="button" class="list-group-item list-group-item-action active text-white" aria-current="true"><a href="index.jsp?category=all" class="text-decoration-none text-white" > 
                                All Products  
                            </a>
                        </button>

                        <% for (Category category : list1) {%>
                        <button type="button" class="list-group-item list-group-item-action"><a class="text-decoration-none text-dark" href="index.jsp?category=<%=category.getCategoryId()%>"><%= category.getCategoryTitle()%></a></button>
                            <% }%>

                    </div>
                </div>




                <!--//show product-->
                <div class="col-md-10">

                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <%
                            for (Product product : list) {
                        %>
                        <div class="col mb-4">



                            <div class="card h-100">
                             <img src="img/Products/<%=product.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="">
                                <div class="card-body">
                                  
                                    <h5 class="card-title"><%=product.getpName()%></h5>
                                    <h3 class="text-dark"><span class="text-danger">-<%= product.getpDiscount()%>%</span>&#8377;<%=product.getPriceAfterApplyinhDiscount()%></h3>
                       
                                    <h5 class="text-muted">M.R.P.: &#8377;<span class="text-muted text text-decoration-line-through" ><%= product.getpPrice() %></span></h5>
                                    <p class="card-text"><%= Helper.get15Word(product.getpDescr())%></p>
                                </div>
                                <div class="card-footer text-center ">
                                    <button class="btn btn bg-warning">Add to Card</button>
                                    <button class="btn btn buynow">Buy Now</button>
                                </div>
                            </div>



                        </div>   
                        <% }

//             if(list.size() == 0){
//out.println("<h3>Not Item in this Category </h3");
//}

                        %>







                    </div>
                </div> 


            </div>   
        </div>




    </body>
</html>
