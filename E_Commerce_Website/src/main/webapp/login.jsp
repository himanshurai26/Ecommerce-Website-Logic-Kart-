
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="components/common_csss_js.jsp" %>
    </head>
    <body>
        <%@include file="components/Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header">
                            <div class="container text-center">
                            <img src="img/login.png" style="max-width: 100px;" class="img-fluid" alt="alt"/>
                            
                        </div>
                            <h3 class="text-center">Sign in </h3>
                        </div>

                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">

                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-warning text-center">Sign in</button>
                                    </div>

                                    <div class="card-footer mt-4">
                                        <h5 class="text-center">New to E-Kart?</h5>
                                        <div class="container text-center mt-3">
                                            <button class="rounded">
                                            <a class="text-decoration-none text-dark" href="Register.jsp">Create you E-Kart account</a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>

 <%-- Clear the session attribute after displaying the message --%>
                        <%
                            session.removeAttribute("message");
                        %>

                        </div>



                    </div>
                </div>


            </div>


    </body>
</html>
