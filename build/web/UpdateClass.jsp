
<%-- 
    Document   : UpdateUser
    Created on : Mar 1, 2024, 6:10:16 PM
    Author     : Dan
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <%@include file="SideBarAdmin.jsp" %>
            </div>
            <div class="container mt-5">
                <c:set var="classs" value="${requestScope.classs}"/>

                <h1 style="margin-bottom: 40px">Update Class</h1>
                <form action="UpdateClass" method="post">
                    <input value="${classs.classId}" name="id" hidden="">
                    <div class="form-row">

                        <div class="form-group col-md-5">

                            <label for="inputUsername4" style="font-weight: bold">Class Name </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder="Class Name"  name="name" value="${classs.className}">
                        </div>
                        <div class="form-group col-md-5">



                            <label for="cname" style="font-weight: bold">Course Name</label>
                            <select id="cname" class="form-control" name="cname" >

                                <c:forEach items = "${requestScope.list}" var="c">
                                    <option value="${c.courseName}">${c.courseName}</option>
                                </c:forEach>
                            </select>

                        </div>

                    </div>


                    <button type="submit" class=" d-flex  btn btn-primary updateBtn">Add To System</button>
                </form>

            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>

