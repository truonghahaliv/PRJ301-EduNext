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
             .bg-orange {
            background-color: orange !important;
        }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-orange">
            <a class="navbar-brand" href="#">EduNext</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5">
            <c:set var="lid" value="${id}"/> 
            <c:if test="${teacher != null}">
                <div>
                <%@include file="SideBarTeacher.jsp" %>
            </div>
            </c:if>
            
            <div class="container" style="margin-top: -20px">
                <c:if test="${teacher != null}">
                    
              
                <div>
                    <div class="container">
                            
                        <a href="AddQuestionAssignment?aid=${aid}" class="btn  p-2" style="background: #58abff; color: white; margin-bottom: 45px;margin-top: 30px "  >Add New Question</a>
                    </div>
                </div>
                      </c:if>
                <div class="container" style="margin-top: -30px">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Question ID</th>

                                <th scope="col"> Question Content</th>
                                <th scope="col">Status</th>
                                <c:if test="${teacher != null}">
                                 <th scope="col">Action</th>
                                </c:if>
                               
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items = "${requestScope.list}" var="c">     

                                <tr>
                                    <td>${c.questionId}</td>                               
                                    <td>${c.questionContent}</td>
                                    <td>${c.status}</td>
                                    <c:if test="${teacher != null}">
                                    <td>

                                        <div class="container mt-1">
                                            <form action="UpdateQuestionAssignment" method="get" class="d-inline-block">
                                                <input value="${c.questionId}" name="id" type="hidden">
                                                <input value="${aid}" name="aid" type="hidden">
                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </form>
                                            <form onsubmit="return false;" class="d-inline-block">
                                                <input value="${c.questionId}" name="id" type="hidden">
                                                <input value="${aid}" name="aid" type="hidden">
                                                <button type="button" class="btn btn-danger" onclick="confirmDelete('${id}', '${aid}')">Delete</button>
                                            </form>
                                        </div>



                                    </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <script>
            function confirmDelete(id, aid) {

                var result = confirm("are you sure to delete id?");
                if (result) {

                    window.location.href = "DeleteQuestionAssignment?id=" + id + "&aid=" + aid;

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

