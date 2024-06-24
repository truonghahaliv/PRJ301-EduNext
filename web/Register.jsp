<%-- 
    Document   : Register
    Created on : Jun 24, 2024, 5:53:05 PM
    Author     : Dan
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="mb-4">
                            <h1 class="font-weight-bold text-center mb-4">Register</h1>
                        </div>
                        <form action="register" method="post">
                            <div class="form-group">
                                <label class="font-weight-bold" for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold" for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold" for="password">Password</label>
                                <input type="password" name="password" class="form-control" id="password" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold" for="repassword">Confirm Password</label>
                                <input type="password" name="repassword" class="form-control" id="repassword" required>
                            </div>
                            <input style="background-color: darkorange" type="submit" value="Register" class="btn btn-block">
                            <c:if test="${message !=null}">
                                <p class="text-center text-danger">${message}</p>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
