<%-- 
    Document   : Login
    Created on : Jun 24, 2024, 5:19:43 PM
    Author     : Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles.css">

        <title>Login</title>
    </head>

    <body>
        <div class="container">
            <div class="row justify-content-center align-items-center min-vh-100">
                <div class="col-md-6 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <h1 class="font-weight-bold text-center mb-4">Sign In</h1>
                            </div>
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label class="font-weight-bold" for="username">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label class="font-weight-bold" for="password">Password</label>
                                    <input type="password" name="password" class="form-control" id="password" required>
                                </div>
                                <input style="background-color: darkorange" type="submit" value="Log In" class="btn btn-block ">
                                <c:if test="${message !=null}">
                                    <p class="text-center text-danger">${message}</p>
                                </c:if>
                            </form>
                            <div class="text-center mt-3">
                                <p>Don't have an account? <a href="register">Register here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
