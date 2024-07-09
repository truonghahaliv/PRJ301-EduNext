<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <style>
        .bg-orange {
            background-color: orange !important;
        }
        .card-bg-gray {
            background-color: #f8f9fa;
        }
    </style>
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
        <div class="container mt-4">
            <h3><strong>(QUESTION) ${question.name}</strong></h3>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Content Section -->
                        <div class="card card-bg-gray" style="margin-top: 20px">
                            <div class="card-body">
                                <h5 class="card-title">Content</h5>
                                <hr style="margin-bottom: 8px; height: 5px;">
                                <p id="lessonContent" class="card-text">${question.content}</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <h5 style="margin-left: 15px">Discussion</h5>
            <div class="content" style="margin-left: 15px; margin-top: 20px">
                <c:forEach items="${answerUsers}" var="a">
                    <c:set var="aid" value="${a.aid}"/>
                    <div class="content-cmt" style="margin-top: 30px">
                        <div class="mt-2 d-flex justify-content-between">
                            <p><strong>${a.username}</strong></p>

                        </div>
                        <textarea class="form-control" id="content-${a.aid}" name="content" rows="5" style="resize: none;" readonly>${a.content}</textarea>
                    </div>
                </c:forEach>
            </div>

        </div>

        <!-- jQuery, Popper.js, and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>
