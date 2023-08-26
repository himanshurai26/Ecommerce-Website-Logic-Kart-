<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>








<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

    <div class="container">
        <a class="navbar-brand" href="index.jsp">Logic-Kart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <!--        <li class="nav-item">
                          <a class="nav-link" href="#">Link</a>
                        </li>-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <% CategoryDao dao2 = new CategoryDao(FactoryProvider.getFactory());
            List<Category> list2 = dao2.getCategories();
            for (Category cat : list2) {%>
                        <li><a class="dropdown-item" href="#"><%= cat.getCategoryTitle()%></a></li>
                            <% } %>
                    </ul>
                </li>


                <!--        <li class="nav-item">
                          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>-->
            </ul>
            <!--      <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                  </form>-->

            <ul class="navbar-nav ml-auto">
                <%                        if (user1 == null) {
                %>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
                </li>
                <%
                } else {

                %>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#!"><%=user1.getUserName()%></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="LogoutServlet">Logout</a>
                </li>

                <%    }

                %>


            </ul>
        </div>
    </div>

</nav>