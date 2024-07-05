<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/newstyles.css">
    </head>
    <style>
        .bg-orange {
            background-color: orange !important;
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
        <div class="container mt-5">

            <div class="row">
                <div class="col-md-3">
                    <form id="courseForm" action="ViewCourseInfor" method="post">
                        <div class="form-group">
                            <label for="">Filter Activities</label>
                            <select class="form-control" id="courseSelect" name="courseSelect" onchange="document.getElementById('courseForm').submit();">
                                <c:forEach items="${question}" var="l">
                                    <option value="${l.status}"> ${l.status}</option>
                                </c:forEach>

                            </select>

                        </div>

                    </form>
                </div>
                <div class="col-md-3">
                    <form id="courseForm" action="ViewCourseInfor" method="get">
                        <div class="form-group">
                            <label for="">Filter Slot</label>
                            <select class="form-control" id="courseSelect" name="slot" >
                                <c:forEach items="${lesson}" var="l">
                                    <option value="${l.slot}">Slot ${l.slot}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </form>
                </div>
            </div>


            <c:forEach items="${lesson}" var="l">
                <c:set var="id" value="${l.lessonId}"/> 

                <div class="container" style="margin-top: 20px">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Content Section -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Slot ${l.slot}</h5>
                                    <p id="lessonContent" class="card-text">${l.lessonContent}</p>
                                </div>
                                <div class="card" id="questionsAccordion">
                                    <div class="card-header">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseQuestions" aria-expanded="true" aria-controls="collapseQuestions">
                                                Show Assignment
                                                <input value="${l.lessonId}" name="id" hidden="">
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseQuestions" class="collapse" aria-labelledby="headingQuestions" data-parent="#questionsAccordion">
                                        <div class="card-body">
                                            <c:if test="${assignment == null}">
                                                <p>This Assignment doesnt have question</p>
                                            </c:if>
                                            <c:if test="${assignment != null}">
                                                <c:forEach items="${assignment}" var="a">
                                                      <c:set var="aid" value="${a.assignmentId}"/> 
                                                    <a href="ViewAssignment?aid=${aid}">${a.assignmentName}</a> 
                                                </c:forEach>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>





            </c:forEach>
        </div>
        <!-- Bootstrap CSS -->

        <!-- jQuery, Popper.js, and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>

