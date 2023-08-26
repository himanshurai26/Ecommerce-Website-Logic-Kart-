

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>New User</title>


        <%@include file="components/common_csss_js.jsp" %>
        <%@include file="components/Navbar.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                      <%@include file="components/message.jsp" %>
                    <div class="card-body px-4">
                        
                        <div class="container text-center">
                            <img src="img/add_user.png" style="max-width: 100px;" class="img-fluid" alt="alt"/>
                            
                        </div>
                        
                <h3 class="text-center my-3">Create Account</h3>
                
                <form action="RegisterServlet" method="post">

                    <div class="mb-3">
                        <label for="name" class="form-label">User Name</label>
                        <input type="text" class="form-control" id="name" name="user_name" required aria-describedby="emailHelp">
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">User Email</label>
                        <input type="email" class="form-control" id="email" name="user_email" required aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">User Password</label>
                        <input type="password" class="form-control" id="password" name="user_password" required aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">User Phone</label>
                        <input type="tel" class="form-control" id="phone" name="user_phone" required aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">User Address</label>
                        <textarea style="height: 150px" class="form-control" id="address" required name="userAddress" placeholder="Enter your Address"></textarea>
                    </div>

                    <div class="container text-center">
                        <button class="btn btn-outline-warning">Sign up</button>
                        
  
                </form>
                <%-- Clear the session attribute after displaying the message --%>
                        <%
                            session.removeAttribute("message");
                        %>


                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
