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
            <c:set var="lid" value="${id}"/> 
            <div>
                <%@include file="SideBarTeacher.jsp" %>
            </div>
            <div class="container" style="margin-top: -20px">
                <div>
                    <div class="container">



                        <a href="AddQuestion?lid=${lid}" class="btn  p-2" style="background: #58abff; color: white; margin-bottom: 45px;margin-top: 30px "  >Add New Question</a>
                    </div>
                </div>
                <div class="container" style="margin-top: -30px">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Question ID</th>
                                <th scope="col">Question Name</th>    
                                <th scope="col">Content</th>
                                <th scope="col">Status</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items = "${requestScope.question}" var="c">                         
                                <c:set var="id" value="${c.questionId}"/> 
                                <tr>
                                    <td>${id}</td>
                                    <td>${c.name}</td>
                                    <td>${c.content}</td>
                                    <td>${c.status}</td>
                                    <td>${c.start}</td>
                                    <td>${c.end}</td>
                                    <td>

                                        <div class="container mt-1">
                                            <form action="UpdateQuestion" method="get" class="d-inline-block">
                                                <input value="${id}" name="id" type="hidden">
                                                <input value="${lid}" name="lid" type="hidden">
                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </form>
                                            <form onsubmit="return false;" class="d-inline-block">
                                                <input value="${id}" name="id" type="hidden">
                                                <input value="${lid}" name="lid" type="hidden">
            <button type="button" class="btn btn-danger" onclick="confirmDelete('${id}', '${lid}')">Delete</button>
                                            </form>
                                        </div>



                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <script>
            function confirmDelete(id, lid) {

                var result = confirm("are you sure to delete id?");
                if (result) {

                    window.location.href = "DeleteQuestionSlot?id=" + id + "&lid=" + lid;

                } else {
                    // Người dùng đã chọn Hủy bỏ, không làm gì cả
                    console.log("Người dùng đã hủy bỏ xóa.");
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

