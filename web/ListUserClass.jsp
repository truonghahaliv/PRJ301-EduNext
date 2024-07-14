<%-- 
    Document   : ListUser
    Created on : Jun 25, 2024, 1:38:13 AM
    Author     : Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
            
    </head>
    <body>
        <div class="d-flex">
            <div>
                <%@include file="SideBarTeacher.jsp" %>
            </div>
            <div class="container" style="margin-top: 20px">
               <h2 style="color: #007bff; margin-bottom: 20px;">List User</h2>
                <div class="container" style="margin-top: 30px">
                    <a href="#" style="text-decoration: none; color: #58abff"><h2 style="color: white">List User</h2></a>                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">User ID</th>
                                <th scope="col">UserName</th>    
                                <th scope="col">Email</th>                                                                                       
                               
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items = "${requestScope.list}" var="c">
                                <c:set var="id" value="${c.userId}"/> 
                                <tr>
                                    <td>${id}</td>
                                    <td>${c.username}</td>
                                    <td>${c.email}</td>                                                               
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

